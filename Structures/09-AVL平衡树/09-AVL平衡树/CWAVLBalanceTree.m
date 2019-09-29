//
//  CWAVLBalanceTree.m
//  09-AVL平衡树
//
//  Created by mac on 2019/5/30.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWAVLBalanceTree.h"
#import "CWAVLCompareModel.h"

@interface CWAVLBalanceTree (){
    id ele;                              // 元素
    CWAVLCompareModel  *_compare;        // 比较器
}

@property (nonatomic,assign)  int height; //平衡树的高度

@end

@implementation CWAVLBalanceTree

/**
 0、初始化node节点
 */
- (instancetype)init{
    if (self = [super init]) {
        self.size = 0;
        self.root = nil;
        _compare = [CWAVLCompareModel new];
    }
    return self;
}

- (CWAVLBalanceTree *)private_initListNodeNext:(CWAVLBalanceTree *)parent E:(id)E
{
    CWAVLBalanceTree *bst = [[CWAVLBalanceTree alloc] init];
    bst->_parent = parent;
    bst->ele = E;
    bst->_height = 1;
    // 创建新node
    if (self.root == nil) {
        self.root = bst;
    }
    return bst;
}


/**
 1、新增某元素
 */
- (void)cw_addE:(id)E
{
    // 1、root节点设置
    if(self.root == nil){
        self.root = [self private_initListNodeNext:nil E:E];
        self.size++;
        [self private_afterAdd:self.root];
        return;
    }
    
    // 2、寻找父节点
    CWAVLBalanceTree *node = self.root;
    CWAVLBalanceTree *parent = self.root;
    NSInteger result = 0;
    while (node != nil) {
        result = [self private_compare:node->ele newValue:E];
        parent = node;
        if (result>0) {
            node = node->_right;
        }else if (result<0){
            node = node->_left;
        }else{
            break;
        }
    }
    
    // 3、设置left、right节点
    CWAVLBalanceTree *insert = [self private_initListNodeNext:parent E:E];
    if (result>0) {
        parent->_right = insert;
    }else if (result<0){
        parent->_left = insert;
    }else{
        
    }
    self.size++;
    [self private_afterAdd:insert];
    
}

/**
 2、移除index元素
 */

- (id)cw_removeE:(id)E
{
    return [self cw_removeBST:[self private_AVLForElement:E]];
}

- (id)cw_removeBST:(CWAVLBalanceTree *)bst
{
    if (bst == nil) {
        return nil;
    }
    
    // 1、度为2的节点
    if ([self hasTwoChildrenForNode:bst]) {
        // 找前序节点(前序节点或者后序节点一定是度为0或者1)
        CWAVLBalanceTree *predecessor = [self predecessorNode:bst];
        bst->ele = predecessor->ele;
        bst = predecessor;
    }
    
    // 2、度为1或者为0
    CWAVLBalanceTree *replace = bst->_left != nil ? bst->_left:bst->_right;
    // 度为1节点
    if (replace != nil) {
        // 2-1、删除的节点为root
        if (bst == self.root) {
            replace->_parent = nil;
            self.root = replace;
        }
        // 2-2、是否为右子节点
        else if ([self isRightNode:bst]){
            replace->_parent = bst->_parent;
            bst->_parent->_right = replace;
        }
        // 2-3、是否为左子节点
        else if ([self isLeftNode:bst]){
            replace->_parent = bst->_parent;
            bst->_parent->_left = replace;
        }
        
        [self private_afterRemove:replace];
    }
    // 3、度为0的节点
    else{
        // 3-1、删除的节点为root
        if (bst == self.root) {
            self.root = nil;
        }
        // 3-2、删除的节点为右节点
        else if ([self isRightNode:bst]) {
            bst->_parent->_right = nil;
        }
        // 3-3、删除的节点为左节点
        else if([self isLeftNode:bst]){
            bst->_parent->_left = nil;
        }
        [self private_afterRemove:bst];
    }
    self.size--;
    return bst;
}

/**
 3、清空数据数据
 */
- (void)cw_clear
{
    self.root = nil;
    self.size = 0;
}

/**
 4、数组的大小
 */
- (int)cw_size
{
    return self.size;
}

/**
 5、数组是否为空
 */
- (BOOL)cw_isEmpty
{
    return self.size == 0;
}

/**
 6、递归的前序遍历、中序遍历、后续遍历
 */

- (void)recursive_preOrderTraversal:(CWAVLBalanceTree *)node
{
    if (node == nil) {
        return;
    }
    
    NSLog(@"%@",node->ele);
    [self recursive_preOrderTraversal:node->_left];
    [self recursive_preOrderTraversal:node->_right];
}

- (void)recursive_inOrderTraversal:(CWAVLBalanceTree *)node
{
    if (node == nil) {
        return;
    }
    
    [self recursive_inOrderTraversal:node->_left];
    NSLog(@"%@",node->ele);
    [self recursive_inOrderTraversal:node->_right];
}

- (void)recursive_postOrderTraversal:(CWAVLBalanceTree *)node
{
    if (node == nil) {
        return;
    }
    
    [self recursive_postOrderTraversal:node->_left];
    [self recursive_postOrderTraversal:node->_right];
    NSLog(@"%@",node->ele);
}

/**
 7、前序、中序、后序遍历
 */
- (void)preOrderTraversal:(CWAVLBalanceTree *)node
{
    if (node == nil) return;
    // 栈数组，先进后出
    NSMutableArray *stacks = [NSMutableArray array];
    while(node != nil){
        NSLog(@"%@",node->ele);
        if (node->_right != nil) {
            [stacks addObject:node->_right];
        }
        node = node->_left;
        if (node == nil) {
            node = stacks.lastObject;
            [stacks removeLastObject];
        }
    }
}

- (void)inOrderTraversal:(CWAVLBalanceTree *)node
{
    if (node == nil) return;
    // 栈数组，先进后出
    NSMutableArray *stacks = [NSMutableArray array];
    while (node != nil || stacks.count!= 0) {
        if (node != nil) {
            [stacks addObject:node];
            node = node->_left;
        }
        
        if (node == nil) {
            CWAVLBalanceTree *temp = [[CWAVLBalanceTree alloc] init];
            temp = stacks.lastObject;
            [stacks removeLastObject];
            NSLog(@"%@",temp->ele);
            node = temp->_right;
        }
    }
}

- (void)postOrderTraversal:(CWAVLBalanceTree *)node
{
    if (node == nil) return;
    // 栈数组，先进先出
    NSMutableArray *listqueues = [NSMutableArray array];
    CWAVLBalanceTree *pre;
    CWAVLBalanceTree *top;
    [listqueues addObject:node];
    while (listqueues.count != 0) {
        top = listqueues[listqueues.count-1];
        // 1、为叶子节点;遍历顺序是先左pre == top->_left 后右pre == top->_right 在左右子节点都访问过后再本身节点
        if((top->_right == nil && top->_left == nil) || (pre == top->_right) || (pre == top->_left)){
            NSLog(@"%@",top->ele);
            pre = top;
            [listqueues removeObjectAtIndex:listqueues.count-1];
            
        }else{
            if (top ->_right) [listqueues addObject:top->_right];
            if (top->_left)   [listqueues addObject:top->_left];
        }
        
    }
    
    
}


/**
 8、层序遍历
 */
- (void)levelOrderTraversal:(CWAVLBalanceTree *)node
{
    // 定义个数组，用于队列功能(先进先出功能)
    NSMutableArray *queues = [NSMutableArray array];
    if (node != nil) {
        [queues addObject:node];
    }
    while (queues.count != 0) {
        
        CWAVLBalanceTree *outNode = queues.firstObject;
        
        // 出队列
        [queues removeObjectAtIndex:0];
        NSLog(@"%@",outNode->ele);
        
        if (outNode->_left != nil) {
            [queues addObject:outNode->_left];
        }
        
        if (outNode->_right != nil) {
            [queues addObject:outNode->_right];
        }
    }
}

/**
 9、二叉树的高度
 */
- (int)bstHeightForTree:(CWAVLBalanceTree *)node
{
    if (node == nil) {
        return 0;
    }
    NSMutableArray *queues = [NSMutableArray array];
    int height = 0;
    [queues addObject:node];
    int temp = (int)queues.count;
    while (queues.count != 0) {
        CWAVLBalanceTree *outNode = queues.firstObject;
        [queues removeObjectAtIndex:0];
        temp--;
        if (outNode->_left) {
            [queues addObject:outNode->_left];
        }
        if (outNode->_right) {
            [queues addObject:outNode->_right];
        }
        
        if (temp == 0) {
            height++;
            temp = (int)queues.count;
        }
    }
    return height;
}

/**
 10、获取前驱节点
 */
- (CWAVLBalanceTree *)predecessorNode:(CWAVLBalanceTree *)node
{
    CWAVLBalanceTree *bst = node->_left;
    // 1、当前节点的left节点不为空
    if (bst != nil) {
        while (bst->_right != nil) {
            bst = bst->_right;
        }
        return bst;
    }
    // 2、bst==nil && bst->_patent != nil
    else if (node->_parent != nil){
        bst = node;
        while(bst != nil){
            NSLog(@"value:%d",[self private_compare:bst->ele newValue:node->ele]);
            if ([self private_compare:bst->ele newValue:node->ele] > 0) {
                NSLog(@"%@",bst->ele);
                return bst;
            }else{
                bst = bst->_parent;
            }
        }
    }
    // 3、没有前驱节点
    else{
        return nil;
    }
    
    return nil;
}

/**
 11、获取后继节点
 */
- (CWAVLBalanceTree *)successorNode:(CWAVLBalanceTree *)node
{
    CWAVLBalanceTree *bst = node->_right;;
    
    // 1、node的left节点不为空
    if (bst != nil) {
        while (bst->_left != nil) {
            bst = bst->_left;
        }
        return bst;
    }
    
    // 2、node的left节点不为空
    else if (node->_parent != nil){
        bst = node;
        while (bst != nil) {
            NSLog(@"value:%d",[self private_compare:bst->ele newValue:node->ele]);
            if ([self private_compare:bst->ele newValue:node->ele] < 0) {
                NSLog(@"%@",bst->ele);
                return bst;
            }else{
                bst = bst->_parent;
            }
        }
    }
    
    // 3、没有后继节点
    else{
        return nil;
    }
    return nil;
}

/**
 12、是否叶子节点
 */
- (BOOL)isLeaf:(CWAVLBalanceTree *)node
{
    return node.left == nil && node.right == nil;
}

/**
 13、是否有左右子节点
 */
- (BOOL)hasTwoChildrenForNode:(CWAVLBalanceTree *)node
{
    return node.left != nil && node.right != nil;
}

/**
 14、是否是右子节点
 */
- (BOOL)isRightNode:(CWAVLBalanceTree *)node
{
    return node.parent.right == node;
}

/**
 15、是否是左子节点
 */
- (BOOL)isLeftNode:(CWAVLBalanceTree *)node
{
    return node.parent.left == node;
}


/**
 添加之后的调整二叉树
 */
- (void)private_afterAdd:(CWAVLBalanceTree *)node
{
    while ((node = node.parent) != nil) {
        // 平衡树
        if ([self private_isbalance:node]) {
            // 更新高度
            [self private_updateHeight:node];
        }
        // 非平衡树
        else{
            [self rebalanceTree:node];
            break;
        }
    }
}

/**
 删除之后的调整二叉树
 */
- (void)private_afterRemove:(CWAVLBalanceTree *)node
{
    while ((node = node.parent) != nil) {
        // 平衡树
        if ([self private_isbalance:node]) {
            // 更新高度
            [self private_updateHeight:node];
        }
        // 非平衡树
        else{
            [self rebalanceTree:node];
        }
    }
}


/**
 二叉树是否需要进行旋转
 */
- (BOOL)private_isbalance:(CWAVLBalanceTree *)node
{
    int leftH = (node.left == nil?0:node.left.height);
    int rightH = (node.right == nil?0:node.right.height);
    //NSLog(@"abs:%d",abs(leftH-rightH));
    return abs(leftH-rightH) <= 1;
}

/**
 二叉树旋转
 */
- (void)rebalanceTree:(CWAVLBalanceTree *)node
{
    CWAVLBalanceTree *parent = [self private_tallerChild:node];
    CWAVLBalanceTree *child = [self private_tallerChild:parent];
    // L
    if ([self isLeftNode:parent]) {
        
        // LL
        if ([self isLeftNode:child]) {
            [self private_rotateRight:node];
        }
        // LR
        else{
            [self private_rotateLeft:parent];
            [self private_rotateRight:node];
        }
        
    }
    // R
    else{
        // RL
        if ([self isLeftNode:child]) {
            [self private_rotateRight:parent];
            [self private_rotateLeft:node];
        }
        // RR
        else{
            [self private_rotateLeft:node];
        }
        
    }
}

/**
 获取二叉树高度较高的子节点
 */
- (CWAVLBalanceTree *)private_tallerChild:(CWAVLBalanceTree *)node
{
    int leftH = (node.left == nil?0:node.left.height);
    int rightH = (node.right == nil?0:node.right.height);
    if (leftH > rightH) {
        return node.left;
    }
    if (rightH > leftH){
        return node.right;
    }
    return nil;
}


/**
 二叉树更新高度
 */
- (void)private_updateHeight:(CWAVLBalanceTree *)node
{
    int leftH = (node.left == nil?0:node.left.height);
    int rightH = (node.right == nil?0:node.right.height);
    node.height = MAX(leftH, rightH) + 1;
}

/**
 左旋转节点
 */
- (void)private_rotateLeft:(CWAVLBalanceTree *)node
{
    CWAVLBalanceTree *grand = node;
    CWAVLBalanceTree *parent = node.right;

    // 调整指针
    grand.right = parent.left;
    parent.left = grand;
    
    // 判断最新parent的是属于上一节点的left或者right
    if ([self isLeftNode:node]) {
        node.parent.left = parent;
    }else if ([self isRightNode:node]){
        node.parent.right = parent;
    }
    // 当前node为root节点
    else{
        self.root = parent;
    }
    
    // 更新 parent(root、parent、grand)
    parent.parent = grand.parent;
    grand.parent = parent;
    if (grand.right != nil) {
        grand.right.parent = grand;
    }
    
    // 更新高度
    [self private_updateHeight:grand];
    [self private_updateHeight:parent];
    
}

/**
 右旋转节点
 */
- (void)private_rotateRight:(CWAVLBalanceTree *)node
{
    CWAVLBalanceTree *grand = node;
    CWAVLBalanceTree *parent = node.left;
    
    // 调整指针
    grand.left = parent.right;
    parent.right = grand;
    
    // 判断最新parent的是属于上一节点的left或者right
    if ([self isLeftNode:node]) {
        node.parent.left = parent;
    }else if ([self isRightNode:node]){
        node.parent.right = parent;
    }
    // 当前node为root节点
    else{
        self.root = parent;
    }
    
    
    // 更新parent(root、parent、grand)
    parent.parent = grand.parent;
    if (grand.left != nil) {
        grand.left.parent = grand;
    }
    grand.parent = parent;

    
    // 更新高度g、p
    [self private_updateHeight:grand];
    [self private_updateHeight:parent];
    
    
}

/**
 比较获取节点的位置
 */
- (int)private_compare:(id)compare newValue:(id)newValue
{
    return [_compare compareValue:compare oldValue:newValue];
}

/**
 获取节点的对应位置节点
 */
- (CWAVLBalanceTree *)private_AVLForElement:(id)E
{
    CWAVLBalanceTree *bst = self.root;
    NSInteger compare;
    while (bst != nil) {
        compare = [self private_compare:bst->ele newValue:E];
        if (compare > 0) {
            bst = bst->_right;
        }else if (compare < 0){
            bst = bst->_left;
        }else{
            return bst;
        }
    }
    return nil;
}




/**
 打印工具
 */


#pragma mark - MJBinaryTreeInfo
- (id)left:(CWAVLBalanceTree *)node {
    return node->_left;
}

- (id)right:(CWAVLBalanceTree *)node {
    return node->_right;
}

- (id)string:(CWAVLBalanceTree *)node {
//    return node->ele;
    if(node.parent == nil){
        return [NSString stringWithFormat:@"%@",node->ele];
    }
    return [NSString stringWithFormat:@"%@(%@)",node->ele,node.parent->ele];
}

- (id)root {
    return self->_root;
}

@end

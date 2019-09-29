//
//  CWRBSet.m
//  11-集合(Set)
//
//  Created by mac on 2019/6/6.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWRBSet.h"
#import "CWRBTCompareModel.h"

typedef NS_ENUM(NSInteger, CWRBSetColor) {
    CWRBSetColorRed = 0,              // Red
    CWRBSetColorBlack                 // Black
};


@interface CWRBSet (){
    id ele;                              // 元素
    CWRBTCompareModel  *_compare;        // 比较器
}

@property (nonatomic,strong)  CWRBSet *parent;
@property (nonatomic,strong)  CWRBSet *left;
@property (nonatomic,strong)  CWRBSet *right;
@property (nonatomic,assign)  CWRBSetColor color;
@property (nonatomic,strong)  CWRBSet *root;
@end

@implementation CWRBSet


#pragma mark - 二叉树的初始化方法

- (instancetype)init{
    if (self = [super init]) {
        self.size = 0;
        self.root = nil;
        _compare = [CWRBTCompareModel new];
    }
    return self;
}

- (CWRBSet *)private_initListNodeNext:(CWRBSet *)parent E:(id)E
{
    CWRBSet *bst = [[CWRBSet alloc] init];
    bst->_parent = parent;
    bst->ele = E;
    bst->_color = CWRBSetColorRed;
    // 创建新node
    if (self.root == nil) {
        bst.color = CWRBSetColorBlack;
        self.root = bst;
    }
    return bst;
}


#pragma mark - 二叉树的方法
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
    CWRBSet *node = self.root;
    CWRBSet *parent = self.root;
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
    CWRBSet *insert = [self private_initListNodeNext:parent E:E];
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

- (id)cw_removeBST:(CWRBSet *)bst
{
    if (bst == nil) {
        return nil;
    }
    
    // 1、度为2的节点
    if ([self hasTwoChildrenForNode:bst]) {
        // 找前序节点(前序节点或者后序节点一定是度为0或者1)
        CWRBSet *predecessor = [self predecessorNode:bst];
        bst->ele = predecessor->ele;
        bst = predecessor;
    }
    
    // 2、度为1或者为0
    CWRBSet *replace = bst->_left != nil ? bst->_left:bst->_right;
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
        
        [self private_afterRemove:bst replaceNode:replace];
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
        [self private_afterRemove:bst replaceNode:nil];
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
 6、遍历集合的数据
 */
- (void)cw_traversal:(CWRBSet *)node
{
    [self inOrderTraversal:node.root];
}


#pragma mark - 二叉树的内部方法

/**
 递归的前序遍历、中序遍历、后续遍历
 */
- (void)recursive_preOrderTraversal:(CWRBSet *)node
{
    if (node == nil) {
        return;
    }
    
    NSLog(@"%@",node->ele);
    [self recursive_preOrderTraversal:node->_left];
    [self recursive_preOrderTraversal:node->_right];
}

- (void)recursive_inOrderTraversal:(CWRBSet *)node
{
    if (node == nil) {
        return;
    }
    
    [self recursive_inOrderTraversal:node->_left];
    NSLog(@"%@",node->ele);
    [self recursive_inOrderTraversal:node->_right];
}

- (void)recursive_postOrderTraversal:(CWRBSet *)node
{
    if (node == nil) {
        return;
    }
    
    [self recursive_postOrderTraversal:node->_left];
    [self recursive_postOrderTraversal:node->_right];
    NSLog(@"%@",node->ele);
}

/**
 前序、中序、后序遍历
 */
- (void)preOrderTraversal:(CWRBSet *)node
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

- (void)inOrderTraversal:(CWRBSet *)node
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
            CWRBSet *temp = [[CWRBSet alloc] init];
            temp = stacks.lastObject;
            [stacks removeLastObject];
            NSLog(@"%@",temp->ele);
            node = temp->_right;
        }
    }
}

- (void)postOrderTraversal:(CWRBSet *)node
{
    if (node == nil) return;
    // 栈数组，先进先出
    NSMutableArray *listqueues = [NSMutableArray array];
    CWRBSet *pre;
    CWRBSet *top;
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
 层序遍历
 */
- (void)levelOrderTraversal:(CWRBSet *)node
{
    // 定义个数组，用于队列功能(先进先出功能)
    NSMutableArray *queues = [NSMutableArray array];
    if (node != nil) {
        [queues addObject:node];
    }
    while (queues.count != 0) {
        
        CWRBSet *outNode = queues.firstObject;
        
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
 获取前驱节点
 */
- (CWRBSet *)predecessorNode:(CWRBSet *)node
{
    CWRBSet *bst = node->_left;
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
 获取后继节点
 */
- (CWRBSet *)successorNode:(CWRBSet *)node
{
    CWRBSet *bst = node->_right;;
    
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
 是否叶子节点
 */
- (BOOL)isLeaf:(CWRBSet *)node
{
    return node.left == nil && node.right == nil;
}

/**
 是否有左右子节点
 */
- (BOOL)hasTwoChildrenForNode:(CWRBSet *)node
{
    return node.left != nil && node.right != nil;
}

/**
 是否是右子节点
 */
- (BOOL)isRightNode:(CWRBSet *)node
{
    return node.parent.right == node;
}

/**
 是否是左子节点
 */
- (BOOL)isLeftNode:(CWRBSet *)node
{
    return node.parent.left == node;
}

/**
 返回兄弟节点
 */
- (CWRBSet *)isSiblingNode:(CWRBSet *)node
{
    if ([self isLeftNode:node]) {
        return node.parent.right;
    }
    
    else if ([self isRightNode:node]){
        return node.parent.left;
    }
    return nil;
}

/**
 是否红色节点
 */
- (BOOL)isRed:(CWRBSet *)node
{
    if (node == nil) {
        return NO;
    }
    return node.color == CWRBSetColorRed;
}

/**
 是否黑色节点
 */
- (BOOL)isBlack:(CWRBSet *)node
{
    if (node == nil) {
        return YES;
    }
    return node.color == CWRBSetColorBlack;
}

/**
 染色成红色节点
 */
- (CWRBSet *)red:(CWRBSet *)node
{
    if (node == nil) {
        return nil;
    }
    node.color = CWRBSetColorRed;
    return node;
}

/**
 染色成黑色
 */
- (CWRBSet *)black:(CWRBSet *)node
{
    if (node == nil) {
        return nil;
    }
    node.color = CWRBSetColorBlack;
    return node;
}

/**
 获取节点的颜色
 */
- (CWRBSetColor)colorOf:(CWRBSet *)node
{
    if ([self isRed:node]) {
        return CWRBSetColorRed;
    }
    
    return CWRBSetColorBlack;
}

/**
 添加之后的调整二叉树
 */
- (void)private_afterAdd:(CWRBSet *)node
{
    
    // 上益节点至root，染色为黑色
    if (node.parent == nil) {
        [self black:node];
        return;
    }
    // 1、父节点为黑色，不需要设置什么
    if ([self isBlack:node.parent]) {
        return;
    }
    
    // 2、父节点为红色
    else if([self isRed:node.parent]){
        
        // uncle节点为红色
        if([self isRed:[self isSiblingNode:node.parent]]){
            // LL RR LR RL染色，上益
            [self private_rebalanceUpTree:node];
        }
        
        // uncle节点为黑色
        else if([self isBlack:[self isSiblingNode:node.parent]]){
            // LL RR LR RL旋转操作
            [self private_rebalanceTree:node];
        }
    }
}

/**
 删除之后的调整二叉树
 */
- (void)private_afterRemove:(CWRBSet *)node replaceNode:(CWRBSet *)replaceNode
{
    // 1、如果删除的节点为red，不需要做任何处理
    if ([self isRed:node]) {
        return;
    }
    
    // 2、如果删除的度为1的黑色节点（一黑色节点带有一个红色节点）
    if ([self isRed:replaceNode]) {
        [self black:replaceNode];
        return;
    }
    
    // 3、删除为叶子节点
    BOOL left = node.parent.left == nil || [self isLeftNode:node];
    CWRBSet *sibling = left ? node.parent.right:node.parent.left;
    CWRBSet *parent = node.parent;
    
    
    // 4、删除的节点在left
    if(left){
        // 兄弟节点为红色
        if([self isRed:sibling]){
            [self black:sibling];
            [self red:parent];
            [self private_rotateLeft:parent];
            
            // 更换sibling节点
            sibling = parent.right;
        }
        
        // 兄弟节点本身为黑色（子节点也是黑）
        if([self isBlack:sibling.left] && [self isBlack:sibling.right]){
            
            CWRBSetColor isBlack = [self colorOf:parent];
            [self red:sibling];
            [self black:parent];
            if(isBlack == CWRBSetColorBlack){
                [self private_afterRemove:parent replaceNode:nil];
            }
        }
        
        // 黑色节点至少有一个红色子节点
        else{
            // 兄弟节点有一个right红色节点（LR旋转）
            if(sibling.left == nil){
                [self private_rotateRight:sibling];
                sibling = parent.right;
            }
            
            // 染色parent
            sibling.color = [self colorOf:parent];
            [self black:sibling.left];
            [self black:sibling.right];
            // 旋转
            [self private_rotateLeft:parent];
        }
    }
    
    // 删除的节点在right
    else{
        // 兄弟节点为红色
        if([self isRed:sibling]){
            [self black:sibling];
            [self red:parent];
            [self private_rotateRight:parent];
            // 更换sibling节点
            sibling = node.parent.left;
        }
        // 兄弟节点本身为黑色（子节点也是黑）
        if([self isBlack:sibling.left] && [self isBlack:sibling.right]){
            
            CWRBSetColor isBlack = [self colorOf:parent];
            [self red:sibling];
            [self black:parent];
            if(isBlack == CWRBSetColorBlack){
                [self private_afterRemove:parent replaceNode:nil];
            }
        }
        
        // 黑色节点至少有一个红色子节点
        else{
            // 兄弟节点有一个right红色节点（LR旋转）
            if(sibling.left == nil){
                [self private_rotateLeft:sibling];
                sibling = parent.left;
            }
            
            // 染色parent
            sibling.color = [self colorOf:parent];
            [self black:sibling.left];
            [self black:sibling.right];
            
            // 旋转
            [self private_rotateRight:parent];
            
        }
    }
}



/**
 二叉树旋转 (parent节点为red，uncle节点为black)
 */
- (void)private_rebalanceTree:(CWRBSet *)node
{
    CWRBSet *parent = node.parent;
    CWRBSet *child = node;
    // L
    if ([self isLeftNode:parent]) {
        // LL
        if ([self isLeftNode:child]) {
            [self black:parent];
            [self red:parent.parent];
            [self private_rotateRight:node.parent.parent];
        }
        // LR
        else{
            [self black:node];
            [self red:node.parent.parent];
            [self private_rotateLeft:parent];
            [self private_rotateRight:child.parent];
        }
    }
    // R
    else{
        // RL
        if ([self isLeftNode:child]) {
            [self black:node];
            [self red:node.parent.parent];
            [self private_rotateRight:parent];
            [self private_rotateLeft:child.parent];
        }
        // RR
        else{
            [self black:node.parent];
            [self red:node.parent.parent];
            [self private_rotateLeft:node.parent.parent];
        }
    }
}

/**
 二叉树上益平衡 (parent节点为red，uncle节点为red)
 */
- (void)private_rebalanceUpTree:(CWRBSet *)node
{
    CWRBSet *parent = node.parent;
    CWRBSet *child = node;
    
    [self black:parent];
    [self black:[self isSiblingNode:node.parent]];
    [self red:node.parent.parent];
    [self private_afterAdd:node.parent.parent];
    
    return;
    
    
    
    // 以下代码处理逻辑一致
    // L
    if ([self isLeftNode:parent]) {
        // LL
        if ([self isLeftNode:child]) {
            [self black:parent];
            [self black:[self isSiblingNode:node.parent]];
            [self red:node.parent.parent];
            [self private_afterAdd:node.parent.parent];
        }
        // LR
        else{
            [self black:parent];
            [self black:[self isSiblingNode:node.parent]];
            [self red:node.parent.parent];
            [self private_afterAdd:node.parent.parent];
        }
    }
    // R
    else{
        // RL
        if ([self isLeftNode:child]) {
            [self black:parent];
            [self black:[self isSiblingNode:node.parent]];
            [self red:node.parent.parent];
            [self private_afterAdd:node.parent.parent];
        }
        // RR
        else{
            [self black:parent];
            [self black:[self isSiblingNode:node.parent]];
            [self red:node.parent.parent];
            [self private_afterAdd:node.parent.parent];
        }
    }
}


/**
 左旋转节点
 */
- (void)private_rotateLeft:(CWRBSet *)node
{
    CWRBSet *grand = node;
    CWRBSet *parent = node.right;
    
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
    
}

/**
 右旋转节点
 */
- (void)private_rotateRight:(CWRBSet *)node
{
    CWRBSet *grand = node;
    CWRBSet *parent = node.left;
    
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
- (CWRBSet *)private_AVLForElement:(id)E
{
    CWRBSet *bst = self.root;
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


@end

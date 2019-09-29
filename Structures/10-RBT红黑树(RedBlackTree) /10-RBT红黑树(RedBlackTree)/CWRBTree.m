//
//  CWRBTree.m
//  10-RBT红黑树(RedBlackTree)
//
//  Created by mac on 2019/6/3.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWRBTree.h"
#import "CWRBTCompareModel.h"

@interface CWRBTree (){
    id ele;                              // 元素
    CWRBTCompareModel  *_compare;        // 比较器
}

@end

@implementation CWRBTree


#pragma mark - 二叉树的初始化方法

- (instancetype)init{
    if (self = [super init]) {
        self.size = 0;
        self.root = nil;
        _compare = [CWRBTCompareModel new];
    }
    return self;
}

- (CWRBTree *)private_initListNodeNext:(CWRBTree *)parent E:(id)E
{
    CWRBTree *bst = [[CWRBTree alloc] init];
    bst->_parent = parent;
    bst->ele = E;
    bst->_color = CWRBTreeColorRed;
    // 创建新node
    if (self.root == nil) {
        bst.color = CWRBTreeColorBlack;
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
    CWRBTree *node = self.root;
    CWRBTree *parent = self.root;
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
    CWRBTree *insert = [self private_initListNodeNext:parent E:E];
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

- (id)cw_removeBST:(CWRBTree *)bst
{
    if (bst == nil) {
        return nil;
    }
    
    // 1、度为2的节点
    if ([self private_hasTwoChildrenForNode:bst]) {
        // 找前序节点(前序节点或者后序节点一定是度为0或者1)
        CWRBTree *predecessor = [self private_predecessorNode:bst];
        bst->ele = predecessor->ele;
        bst = predecessor;
    }
    
    // 2、度为1或者为0
    CWRBTree *replace = bst->_left != nil ? bst->_left:bst->_right;
    // 度为1节点
    if (replace != nil) {
        // 2-1、删除的节点为root
        if (bst == self.root) {
            replace->_parent = nil;
            self.root = replace;
        }
        // 2-2、是否为右子节点
        else if ([self private_isRightNode:bst]){
            replace->_parent = bst->_parent;
            bst->_parent->_right = replace;
        }
        // 2-3、是否为左子节点
        else if ([self private_isLeftNode:bst]){
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
        else if ([self private_isRightNode:bst]) {
            bst->_parent->_right = nil;
        }
        // 3-3、删除的节点为左节点
        else if([self private_isLeftNode:bst]){
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
 6、递归的前序遍历、中序遍历、后续遍历
 */

- (void)recursive_preOrderTraversal:(CWRBTree *)node
{
    if (node == nil) {
        return;
    }
    
    NSLog(@"%@",node->ele);
    [self recursive_preOrderTraversal:node->_left];
    [self recursive_preOrderTraversal:node->_right];
}

- (void)recursive_inOrderTraversal:(CWRBTree *)node
{
    if (node == nil) {
        return;
    }
    
    [self recursive_inOrderTraversal:node->_left];
    NSLog(@"%@",node->ele);
    [self recursive_inOrderTraversal:node->_right];
}

- (void)recursive_postOrderTraversal:(CWRBTree *)node
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
- (void)preOrderTraversal:(CWRBTree *)node
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

- (void)inOrderTraversal:(CWRBTree *)node
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
            CWRBTree *temp = [[CWRBTree alloc] init];
            temp = stacks.lastObject;
            [stacks removeLastObject];
            NSLog(@"%@",temp->ele);
            node = temp->_right;
        }
    }
}

- (void)postOrderTraversal:(CWRBTree *)node
{
    if (node == nil) return;
    // 栈数组，先进先出
    NSMutableArray *listqueues = [NSMutableArray array];
    CWRBTree *pre;
    CWRBTree *top;
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
- (void)levelOrderTraversal:(CWRBTree *)node
{
    // 定义个数组，用于队列功能(先进先出功能)
    NSMutableArray *queues = [NSMutableArray array];
    if (node != nil) {
        [queues addObject:node];
    }
    while (queues.count != 0) {
        
        CWRBTree *outNode = queues.firstObject;
        
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
- (int)bstHeightForTree:(CWRBTree *)node
{
    if (node == nil) {
        return 0;
    }
    NSMutableArray *queues = [NSMutableArray array];
    int height = 0;
    [queues addObject:node];
    int temp = (int)queues.count;
    while (queues.count != 0) {
        CWRBTree *outNode = queues.firstObject;
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

#pragma mark - 红黑树的内部私有方法
/**
 获取前驱节点
 */
- (CWRBTree *)private_predecessorNode:(CWRBTree *)node
{
    CWRBTree *bst = node->_left;
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
- (CWRBTree *)private_successorNode:(CWRBTree *)node
{
    CWRBTree *bst = node->_right;;
    
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
- (BOOL)private_isLeaf:(CWRBTree *)node
{
    return node.left == nil && node.right == nil;
}

/**
 是否有左右子节点
 */
- (BOOL)private_hasTwoChildrenForNode:(CWRBTree *)node
{
    return node.left != nil && node.right != nil;
}

/**
 是否是右子节点
 */
- (BOOL)private_isRightNode:(CWRBTree *)node
{
    return node.parent.right == node;
}

/**
 是否是左子节点
 */
- (BOOL)private_isLeftNode:(CWRBTree *)node
{
    return node.parent.left == node;
}

/**
 返回兄弟节点
 */
- (CWRBTree *)private_isSiblingNode:(CWRBTree *)node
{
    if ([self private_isLeftNode:node]) {
        return node.parent.right;
    }
    
    else if ([self private_isRightNode:node]){
        return node.parent.left;
    }
    return nil;
}

/**
 是否红色节点
 */
- (BOOL)private_isRed:(CWRBTree *)node
{
    if (node == nil) {
        return NO;
    }
    return node.color == CWRBTreeColorRed;
}

/**
 是否黑色节点
 */
- (BOOL)private_isBlack:(CWRBTree *)node
{
    if (node == nil) {
        return YES;
    }
    return node.color == CWRBTreeColorBlack;
}

/**
 染色成红色节点
 */
- (CWRBTree *)private_red:(CWRBTree *)node
{
    if (node == nil) {
        return nil;
    }
    node.color = CWRBTreeColorRed;
    return node;
}

/**
 染色成黑色
 */
- (CWRBTree *)private_black:(CWRBTree *)node
{
    if (node == nil) {
        return nil;
    }
    node.color = CWRBTreeColorBlack;
    return node;
}

/**
 获取节点的颜色
 */
- (CWRBTreeColor)private_colorOf:(CWRBTree *)node
{
	if ([self private_isRed:node]) {
		return CWRBTreeColorRed;
	}
	
	return CWRBTreeColorBlack;
}

/**
 添加之后的调整二叉树
 */
- (void)private_afterAdd:(CWRBTree *)node
{

    // 上益节点至root，染色为黑色
    if (node.parent == nil) {
        [self private_black:node];
        return;
    }
    // 1、父节点为黑色，不需要设置什么
    if ([self private_isBlack:node.parent]) {
        return;
    }
    
    // 2、父节点为红色
    else if([self private_isRed:node.parent]){
        
        // uncle节点为红色
        if([self private_isRed:[self private_isSiblingNode:node.parent]]){
            // LL RR LR RL染色，上益
            [self private_rebalanceUpTree:node];
        }
        
        // uncle节点为黑色
        else if([self private_isBlack:[self private_isSiblingNode:node.parent]]){
            // LL RR LR RL旋转操作
            [self private_rebalanceTree:node];
        }
    }
}

/**
 删除之后的调整二叉树
 */
- (void)private_afterRemove:(CWRBTree *)node replaceNode:(CWRBTree *)replaceNode
{
    // 1、如果删除的节点为red，不需要做任何处理
    if ([self private_isRed:node]) {
        return;
    }
    
    // 2、如果删除的度为1的黑色节点（一黑色节点带有一个红色节点）
    if ([self private_isRed:replaceNode]) {
        [self private_black:replaceNode];
        return;
    }
    
    // 3、删除为叶子节点
	BOOL left = node.parent.left == nil || [self private_isLeftNode:node];
    CWRBTree *sibling = left ? node.parent.right:node.parent.left;
	CWRBTree *parent = node.parent;
    
    
    // 4、删除的节点在left
    if(left){
        // 兄弟节点为红色
        if([self private_isRed:sibling]){
            [self private_black:sibling];
            [self private_red:parent];
            [self private_rotateLeft:parent];
            
            // 更换sibling节点
            sibling = parent.right;
        }
        
        // 兄弟节点本身为黑色（子节点也是黑）
        if([self private_isBlack:sibling.left] && [self private_isBlack:sibling.right]){
            
			CWRBTreeColor isBlack = [self private_colorOf:parent];
			[self private_red:sibling];
			[self private_black:parent];
			if(isBlack == CWRBTreeColorBlack){
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
            sibling.color = [self private_colorOf:parent];
            [self private_black:sibling.left];
            [self private_black:sibling.right];
            // 旋转
            [self private_rotateLeft:parent];
        }
    }
    
    // 删除的节点在right
    else{
        // 兄弟节点为红色
        if([self private_isRed:sibling]){
            [self private_black:sibling];
            [self private_red:parent];
            [self private_rotateRight:parent];
            // 更换sibling节点
            sibling = node.parent.left;
        }
        // 兄弟节点本身为黑色（子节点也是黑）
        if([self private_isBlack:sibling.left] && [self private_isBlack:sibling.right]){
			
			CWRBTreeColor isBlack = [self private_colorOf:parent];
            [self private_red:sibling];
            [self private_black:parent];
            if(isBlack == CWRBTreeColorBlack){
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
            sibling.color = [self private_colorOf:parent];
            [self private_black:sibling.left];
            [self private_black:sibling.right];
            
            // 旋转
            [self private_rotateRight:parent];
            
        }
    }
}



/**
 二叉树旋转 (parent节点为red，uncle节点为black)
 */
- (void)private_rebalanceTree:(CWRBTree *)node
{
    CWRBTree *parent = node.parent;
    CWRBTree *child = node;
    // L
    if ([self private_isLeftNode:parent]) {
        // LL
        if ([self private_isLeftNode:child]) {
            [self private_black:parent];
            [self private_red:parent.parent];
            [self private_rotateRight:node.parent.parent];
        }
        // LR
        else{
            [self private_black:node];
            [self private_red:node.parent.parent];
            [self private_rotateLeft:parent];
            [self private_rotateRight:node.parent.parent];
        }
    }
    // R
    else{
        // RL
        if ([self private_isLeftNode:child]) {
            [self private_black:node];
            [self private_red:node.parent.parent];
            [self private_rotateRight:parent];
            [self private_rotateLeft:child.parent];
        }
        // RR
        else{
            [self private_black:node.parent];
            [self private_red:node.parent.parent];
            [self private_rotateLeft:node.parent.parent];
        }
    }
}

/**
 二叉树上益平衡 (parent节点为red，uncle节点为red)
 */
- (void)private_rebalanceUpTree:(CWRBTree *)node
{
    CWRBTree *parent = node.parent;
    CWRBTree *child = node;
    
    [self private_black:parent];
    [self private_black:[self private_isSiblingNode:node.parent]];
    [self private_red:node.parent.parent];
    [self private_afterAdd:node.parent.parent];
    
    return;
    
    
    
    // 以下代码处理逻辑一致
    // L
    if ([self private_isLeftNode:parent]) {
        // LL
        if ([self private_isLeftNode:child]) {
            [self private_black:parent];
            [self private_black:[self private_isSiblingNode:node.parent]];
            [self private_red:node.parent.parent];
            [self private_afterAdd:node.parent.parent];
        }
        // LR
        else{
            [self private_black:parent];
            [self private_black:[self private_isSiblingNode:node.parent]];
            [self private_red:node.parent.parent];
            [self private_afterAdd:child.parent];
        }
    }
    // R
    else{
        // RL
        if ([self private_isLeftNode:child]) {
            [self private_black:parent];
            [self private_black:[self private_isSiblingNode:node.parent]];
            [self private_red:node.parent.parent];
            [self private_afterAdd:node.parent.parent];
        }
        // RR
        else{
            [self private_black:parent];
            [self private_black:[self private_isSiblingNode:node.parent]];
            [self private_red:node.parent.parent];
            [self private_afterAdd:node.parent.parent];
        }
    }
}


/**
 左旋转节点
 */
- (void)private_rotateLeft:(CWRBTree *)node
{
    CWRBTree *grand = node;
    CWRBTree *parent = node.right;
    
    // 调整指针
    grand.right = parent.left;
    parent.left = grand;
    
    // 判断最新parent的是属于上一节点的left或者right
    if ([self private_isLeftNode:node]) {
        node.parent.left = parent;
    }else if ([self private_isRightNode:node]){
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
- (void)private_rotateRight:(CWRBTree *)node
{
    CWRBTree *grand = node;
    CWRBTree *parent = node.left;
    
    // 调整指针
    grand.left = parent.right;
    parent.right = grand;
    
    // 判断最新parent的是属于上一节点的left或者right
    if ([self private_isLeftNode:node]) {
        node.parent.left = parent;
    }else if ([self private_isRightNode:node]){
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
- (CWRBTree *)private_AVLForElement:(id)E
{
    CWRBTree *bst = self.root;
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


#pragma mark - 二叉树的打印工具类

- (id)left:(CWRBTree *)node {
    return node->_left;
}

- (id)right:(CWRBTree *)node {
    return node->_right;
}

- (id)string:(CWRBTree *)node {
    //return node->ele;
    if (node.color == CWRBTreeColorRed) {
        return [NSString stringWithFormat:@"%@(%@)",node->ele,@"R"];
    }else{
        return [NSString stringWithFormat:@"%@",node->ele];
    }
}

- (id)root {
    return self->_root;
}


@end

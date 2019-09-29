//
//  CWBinarySearchTree.m
//  08-二叉搜索树
//
//  Created by mac on 2019/5/17.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWBinarySearchTree.h"
#import "CWBSTCompareModel.h"
@interface CWBinarySearchTree (){
    id ele;                              // 元素
    //CWBinarySearchTree *_root;           // root节点
//    CWBinarySearchTree *_parent;         // parent节点
//    CWBinarySearchTree *_left;           // left节点
//    CWBinarySearchTree *_right;          // right节点
    CWBSTCompareModel  *_compare;        // 比较器
}

//@property (nonatomic,assign)  BOOL isLeaf;              /**< 是否叶子节点 */
//@property (nonatomic,assign)  BOOL hasTwoChildren;      /**< 是否有二个子节点 */

@end

@implementation CWBinarySearchTree

/**
 0、初始化node节点
 */
- (instancetype)init{
    if (self = [super init]) {
        self.size = 0;
        self->_root = nil;
        _compare = [CWBSTCompareModel new];
    }
    return self;
}

- (CWBinarySearchTree *)private_initListNodeNext:(CWBinarySearchTree *)parent E:(id)E
{
    CWBinarySearchTree *bst = [[CWBinarySearchTree alloc] init];
    bst->_parent = parent;
    bst->ele = E;
    // 创建新node
    if (self->_root == nil) {
        self->_root = bst;
    }
	// 代码有问题：创建节点的时候，无法判断叶子节点和是否有左右子节点
//    bst.isLeaf = (bst->_right == nil && bst->_left == nil);
//    bst.hasTwoChildren = (bst->_right != nil && bst->_left != nil);
    return bst;
}



/**
 1、新增某元素
 */
- (void)cw_addE:(id)E
{
	// 1、root节点设置
	if(self->_root == nil){
		self->_root = [self private_initListNodeNext:nil E:E];
		self.size++;
		return;
	}
	
	// 2、寻找父节点
	CWBinarySearchTree *node = self->_root;
	CWBinarySearchTree *parent = self->_root;
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
	CWBinarySearchTree *insert = [self private_initListNodeNext:parent E:E];
	if (result>0) {
		parent->_right = insert;
	}else if (result<0){
		parent->_left = insert;
    }else{
        
    }
	self.size++;
	
}

/**
 2、移除index元素
 */
- (id)cw_removeBST:(CWBinarySearchTree *)bst
{
    if (bst == nil) {
        return nil;
    }
    
    // 1、度为2的节点
    if ([self hasTwoChildrenForNode:bst]) {
        // 找前序节点(前序节点或者后序节点一定是度为0或者1)
        CWBinarySearchTree *predecessor = [self predecessorNode:bst];
        bst->ele = predecessor->ele;
        bst = predecessor;
    }
    
    // 2、度为1或者为0
    CWBinarySearchTree *replace = bst->_left != nil ? bst->_left:bst->_right;
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
    }
    self.size--;
    return bst;
}

- (id)cw_removeE:(id)E
{
    return [self cw_removeBST:[self private_BSTForElement:E]];
}

/**
 3、清空数据数据
 */
- (void)cw_clear
{
    self->_root = nil;
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

- (void)recursive_preOrderTraversal:(CWBinarySearchTree *)node
{
    if (node == nil) {
        return;
    }
    
    NSLog(@"%@",node->ele);
    [self recursive_preOrderTraversal:node->_left];
    [self recursive_preOrderTraversal:node->_right];
}

- (void)recursive_inOrderTraversal:(CWBinarySearchTree *)node
{
    if (node == nil) {
        return;
    }
    
    [self recursive_inOrderTraversal:node->_left];
    NSLog(@"%@",node->ele);
    [self recursive_inOrderTraversal:node->_right];
}

- (void)recursive_postOrderTraversal:(CWBinarySearchTree *)node
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
- (void)preOrderTraversal:(CWBinarySearchTree *)node
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

- (void)inOrderTraversal:(CWBinarySearchTree *)node
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
			CWBinarySearchTree *temp = [[CWBinarySearchTree alloc] init];
			temp = stacks.lastObject;
			[stacks removeLastObject];
			NSLog(@"%@",temp->ele);
			node = temp->_right;
		}
	}
}

- (void)postOrderTraversal:(CWBinarySearchTree *)node
{
//	if (node == nil) return;
//	// 栈数组，先进后出
//	NSMutableArray *leftStacks = [NSMutableArray array];
//	NSMutableArray *rightStacks = [NSMutableArray array];
//
//	while (node != nil) {
//		if (node->_left != nil) [leftStacks addObject:node->_left];
//		if (node->_right != nil) [rightStacks addObject:node->_right];
//		node = node->_left;
//
//		if (node == nil) {
//			CWBinarySearchTree *left = leftStacks.lastObject;
//			if (left != nil) NSLog(@"%@",left->ele);
//			[leftStacks removeLastObject];
//
//			CWBinarySearchTree *right = rightStacks.lastObject;
//			if (right != nil && right->_left == nil){
//				NSLog(@"%@",right->ele);
//
//			}
//
//			[rightStacks removeLastObject];
//			node = right;
//		}
//
//	}
	
	
	
	if (node == nil) return;
	// 栈数组，先进先出
	NSMutableArray *stacks = [NSMutableArray array];
	CWBinarySearchTree *pre;
	CWBinarySearchTree *top;
	[stacks addObject:node];
	while (stacks.count != 0) {
		top = stacks.lastObject;
		// 1、为叶子节点;遍历顺序是先左pre == top->_left 后右pre == top->_right 在左右子节点都访问过后再本身节点
		if((top->_right == nil && top->_left == nil) || (pre != nil && pre == top->_right) || (pre != nil && pre == top->_left)){
			NSLog(@"%@",top->ele);
			pre = top;
			[stacks removeObjectAtIndex:stacks.count-1];
			
		}else{
			if (top ->_right) [stacks addObject:top->_right];
			if (top->_left)   [stacks addObject:top->_left];
		}
		
	}
}


/**
 8、层序遍历
 */
- (void)levelOrderTraversal:(CWBinarySearchTree *)node
{
    // 定义个数组，用于队列功能(先进先出功能)
    NSMutableArray *queues = [NSMutableArray array];
    if (node != nil) {
        [queues addObject:node];
    }
    while (queues.count != 0) {
        
        CWBinarySearchTree *outNode = queues.firstObject;
        
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
- (int)bstHeightForTree:(CWBinarySearchTree *)node
{
    if (node == nil) {
        return 0;
    }
    NSMutableArray *queues = [NSMutableArray array];
    int height = 0;
    [queues addObject:node];
    int temp = (int)queues.count;
    while (queues.count != 0) {
        CWBinarySearchTree *outNode = queues.firstObject;
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
- (CWBinarySearchTree *)predecessorNode:(CWBinarySearchTree *)node
{
	CWBinarySearchTree *bst = node->_left;
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
- (CWBinarySearchTree *)successorNode:(CWBinarySearchTree *)node
{
	CWBinarySearchTree *bst = node->_right;;
	
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
- (BOOL)isLeaf:(CWBinarySearchTree *)node
{
	return node.left == nil && node.right == nil;
}

/**
 13、是否有左右子节点
 */
- (BOOL)hasTwoChildrenForNode:(CWBinarySearchTree *)node
{
	return node.left != nil && node.right != nil;
}

/**
 14、是否是右子节点
 */
- (BOOL)isRightNode:(CWBinarySearchTree *)node
{
	return node.parent.right == node;
}

/**
 15、是否是左子节点
 */
- (BOOL)isLeftNode:(CWBinarySearchTree *)node
{
	return node.parent.left == node;
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
- (CWBinarySearchTree *)private_BSTForElement:(id)E
{
    CWBinarySearchTree *bst = self->_root;
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
- (id)left:(CWBinarySearchTree *)node {
    return node->_left;
}

- (id)right:(CWBinarySearchTree *)node {
    return node->_right;
}

- (id)string:(CWBinarySearchTree *)node {
    return node->ele;
}

- (id)root {
    return self->_root;
}

@end

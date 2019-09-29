//
//  CWBinarySearchTree.h
//  08-二叉搜索树
//
//  Created by mac on 2019/5/17.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJBinaryTreeInfo.h"
@interface CWBinarySearchTree : NSObject

@property (nonatomic,assign)  int size;     /**< 二叉树数目 */
@property (nonatomic,strong)  CWBinarySearchTree *root;

@property (nonatomic,strong)  CWBinarySearchTree *parent;
@property (nonatomic,strong)  CWBinarySearchTree *left;
@property (nonatomic,strong)  CWBinarySearchTree *right;

/**
 1、新增某元素
 */
- (void)cw_addE:(id)E;


/**
 2、移除E、BST元素
 */
- (id)cw_removeBST:(CWBinarySearchTree *)bst;

- (id)cw_removeE:(id)E;

/**
 3、清空数据数据
 */
- (void)cw_clear;

/**
 4、数组的大小
 */
- (int)cw_size;

/**
 5、数组是否为空
 */
- (BOOL)cw_isEmpty;

/**
 6、递归的前序遍历、中序遍历、后续遍历
 */
- (void)recursive_preOrderTraversal:(CWBinarySearchTree *)node;

- (void)recursive_inOrderTraversal:(CWBinarySearchTree *)node;

- (void)recursive_postOrderTraversal:(CWBinarySearchTree *)node;

/**
 7、前序、中序、后序遍历
 */
- (void)preOrderTraversal:(CWBinarySearchTree *)node;

- (void)inOrderTraversal:(CWBinarySearchTree *)node;

- (void)postOrderTraversal:(CWBinarySearchTree *)node;

/**
 8、层序遍历
 */
- (void)levelOrderTraversal:(CWBinarySearchTree *)node;

/**
 9、二叉树的高度
 */
- (int)bstHeightForTree:(CWBinarySearchTree *)node;

/**
 10、获取前驱节点
 */
- (CWBinarySearchTree *)predecessorNode:(CWBinarySearchTree *)node;

/**
 11、获取后继节点
 */
- (CWBinarySearchTree *)successorNode:(CWBinarySearchTree *)node;

/**
 12、是否叶子节点
 */
- (BOOL)isLeaf:(CWBinarySearchTree *)node;

/**
 13、是否有左右子节点
 */
- (BOOL)hasTwoChildrenForNode:(CWBinarySearchTree *)node;

/**
 14、是否是右子节点
 */
- (BOOL)isRightNode:(CWBinarySearchTree *)node;

/**
 15、是否是左子节点
 */
- (BOOL)isLeftNode:(CWBinarySearchTree *)node;



@end

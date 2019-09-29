//
//  CWAVLBalanceTree.h
//  09-AVL平衡树
//
//  Created by mac on 2019/5/30.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJBinaryTreeInfo.h"
@interface CWAVLBalanceTree : NSObject

@property (nonatomic,assign)  int size;     /**< 二叉树数目 */
@property (nonatomic,strong)  CWAVLBalanceTree *root;
@property (nonatomic,strong)  CWAVLBalanceTree *parent;
@property (nonatomic,strong)  CWAVLBalanceTree *left;
@property (nonatomic,strong)  CWAVLBalanceTree *right;

/**
 1、新增某元素
 */
- (void)cw_addE:(id)E;

/**
 2、移除E、BST元素
 */
- (id)cw_removeE:(id)E;

- (id)cw_removeBST:(CWAVLBalanceTree *)bst;

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
- (void)recursive_preOrderTraversal:(CWAVLBalanceTree *)node;

- (void)recursive_inOrderTraversal:(CWAVLBalanceTree *)node;

- (void)recursive_postOrderTraversal:(CWAVLBalanceTree *)node;

/**
 7、前序、中序、后序遍历
 */
- (void)preOrderTraversal:(CWAVLBalanceTree *)node;

- (void)inOrderTraversal:(CWAVLBalanceTree *)node;

- (void)postOrderTraversal:(CWAVLBalanceTree *)node;

/**
 8、层序遍历
 */
- (void)levelOrderTraversal:(CWAVLBalanceTree *)node;

/**
 9、二叉树的高度
 */
- (int)bstHeightForTree:(CWAVLBalanceTree *)node;

/**
 10、获取前驱节点
 */
- (CWAVLBalanceTree *)predecessorNode:(CWAVLBalanceTree *)node;

/**
 11、获取后继节点
 */
- (CWAVLBalanceTree *)successorNode:(CWAVLBalanceTree *)node;

/**
 12、是否叶子节点
 */
- (BOOL)isLeaf:(CWAVLBalanceTree *)node;

/**
 13、是否有左右子节点
 */
- (BOOL)hasTwoChildrenForNode:(CWAVLBalanceTree *)node;

/**
 14、是否是右子节点
 */
- (BOOL)isRightNode:(CWAVLBalanceTree *)node;

/**
 15、是否是左子节点
 */
- (BOOL)isLeftNode:(CWAVLBalanceTree *)node;


@end

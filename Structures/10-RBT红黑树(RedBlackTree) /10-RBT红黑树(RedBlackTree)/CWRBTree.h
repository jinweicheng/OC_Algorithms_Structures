//
//  CWRBTree.h
//  10-RBT红黑树(RedBlackTree)
//
//  Created by mac on 2019/6/3.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJBinaryTreeInfo.h"

typedef NS_ENUM(NSInteger, CWRBTreeColor) {
    CWRBTreeColorRed = 0,              // Red
    CWRBTreeColorBlack                 // Black
};

@interface CWRBTree : NSObject
@property (nonatomic,assign)  int size;     /**< 二叉树数目 */
@property (nonatomic,strong)  CWRBTree *root;
@property (nonatomic,strong)  CWRBTree *parent;
@property (nonatomic,strong)  CWRBTree *left;
@property (nonatomic,strong)  CWRBTree *right;
@property (nonatomic,assign)  CWRBTreeColor color;


/**
 1、新增某元素
 */
- (void)cw_addE:(id)E;

/**
 2、移除E、BST元素
 */
- (id)cw_removeE:(id)E;

- (id)cw_removeBST:(CWRBTree *)bst;

/**
 3、清空数据数据
 */
- (void)cw_clear;

/**
 4、红黑树的大小
 */
- (int)cw_size;

/**
 5、红黑树是否为空
 */
- (BOOL)cw_isEmpty;

/**
 6、递归的前序遍历、中序遍历、后续遍历
 */
- (void)recursive_preOrderTraversal:(CWRBTree *)node;

- (void)recursive_inOrderTraversal:(CWRBTree *)node;

- (void)recursive_postOrderTraversal:(CWRBTree *)node;

/**
 7、前序、中序、后序遍历
 */
- (void)preOrderTraversal:(CWRBTree *)node;

- (void)inOrderTraversal:(CWRBTree *)node;

- (void)postOrderTraversal:(CWRBTree *)node;

/**
 8、层序遍历
 */
- (void)levelOrderTraversal:(CWRBTree *)node;

/**
 9、红黑树的高度
 */
- (int)bstHeightForTree:(CWRBTree *)node;


@end

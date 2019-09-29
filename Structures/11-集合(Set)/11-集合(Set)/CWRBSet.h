//
//  CWRBSet.h
//  11-集合(Set)
//
//  Created by mac on 2019/6/6.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWRBSet : NSObject
@property (nonatomic,assign)  int size;

/**
 1、新增某元素
 */
- (void)cw_addE:(id)E;

/**
 2、移除E、BST元素
 */
- (id)cw_removeE:(id)E;

- (id)cw_removeBST:(CWRBSet *)bst;

/**
 3、清空数据数据
 */
- (void)cw_clear;

/**
 4、集合的大小
 */
- (int)cw_size;

/**
 5、集合是否为空
 */
- (BOOL)cw_isEmpty;

/**
 6、遍历集合的数据
 */
- (void)cw_traversal:(CWRBSet *)node;


@end

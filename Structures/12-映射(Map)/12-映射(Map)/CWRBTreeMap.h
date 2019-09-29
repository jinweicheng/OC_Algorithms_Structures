//
//  CWRBTreeMap.h
//  12-映射(Map)
//
//  Created by 程金伟 on 2019/6/7.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWRBTreeMap : NSObject
@property (nonatomic,assign)  int size;

/**
 1、新增某元素
 */
- (void)cw_addNodeWithKey:(id)key value:(id)value;

/**
 2、移除E、BST元素
 */
- (id)cw_removeE:(id)key;

- (id)cw_removeBST:(CWRBTreeMap *)bst;

/**
 3、查找key对应的节点
 */
- (CWRBTreeMap *)getNodeWithKey:(id)key;

/**
 4、是否包含value的node
 */
- (BOOL)isContainValue:(id)value;

/**
 5、清空数据数据
 */
- (void)cw_clear;

/**
 6、集合的大小
 */
- (int)cw_size;

/**
 7、集合是否为空
 */
- (BOOL)cw_isEmpty;

/**
 8、遍历集合的数据
 */
- (void)cw_traversal:(CWRBTreeMap *)node;

@end

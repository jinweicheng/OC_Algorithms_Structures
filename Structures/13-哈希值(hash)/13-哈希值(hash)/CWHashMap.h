//
//  CWHashMap.h
//  13-哈希值(hash)
//
//  Created by mac on 2019/6/11.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CWHashMapModel;

@interface CWHashMap : NSObject

/**< 哈希表大小 */
@property (nonatomic,assign)  int size;
/**< 哈希表 */
@property (nonatomic,strong)  NSMutableArray *hashTable;

/**
 1、哈希表新增某元素
 */
- (void)cw_addNodeWithKey:(id)key value:(id)value;

/**
 2、哈希表移除E、BST元素
 */
- (id)cw_removeForKey:(id)key;

/**
 3、哈希表查找key对应的节点
 */
- (CWHashMapModel *)getNodeWithKey:(id)key;

/**
 4、哈希表是否包含value的node
 */
- (BOOL)isContainValue:(id)value key:(id)key;

/**
 5、哈希表清空数据数据
 */
- (void)cw_clear;

/**
 6、哈希表的大小
 */
- (int)cw_size;

/**
 7、哈希表是否为空
 */
- (BOOL)cw_isEmpty;

/**
 8、哈希表遍历
 */
- (void)traversal;


@end

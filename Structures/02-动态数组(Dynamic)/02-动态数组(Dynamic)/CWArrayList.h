//
//  CWArrayList.h
//  02-动态数组
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

/**模拟动态数组的内部实现：
 1、基于array操作
 2、扩容1.5倍
 3、降容1.5倍
**/

@interface CWArrayList : NSObject
@property (nonatomic,assign)  int size;              /**< 数组size */
@property (nonatomic,assign)  int capacity;          /**< 数组的内存大小 */
@property (nonatomic,strong)  NSMutableArray *array; /**< 数组 */

/**
  1、清空数据数据
 */
- (void)cw_clear;

/**
  2、数组的大小
 */
- (int)cw_size;

/**
  3、数组是否为空
 */
- (BOOL)cw_isEmpty;

/**
  4、是否包含某元素
 */
- (BOOL)cw_isContainE:(id)E;

/**
  5、根据下标查找某元素
 */
- (id)cw_getIndex:(int)index;

/**
  6、根据下标设置某元素
 */
- (id)cw_setE:(int)index E:(id)E;

/**
  7、新增某元素
 */
- (void)cw_addE:(id)E;

/**
  8、新增某个index下新增元素
 */
- (void)cw_addE:(id)E index:(int)index;

/**
  9、移除index元素
 */
- (id)cw_removeIndex:(int)index;


/**
 10、移除index元素
 */
- (id)cw_removeE:(id)E;

/**
  11、根据元素查找下标
 */
- (int)cw_indexOf:(id)E;



@end

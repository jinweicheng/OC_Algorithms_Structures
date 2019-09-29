//
//  CWDoubleCycleNode.h
//  05-循环链表
//
//  Created by mac on 2019/5/13.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWDoubleCycleNode : NSObject

@property (nonatomic,assign)  int size;     /**< 链表子节点数目 */

/**
 1、新增某元素
 */
- (void)cw_addE:(id)E;

/**
 2、新增某个index下新增元素
 */
- (void)cw_addE:(id)E index:(int)index;

/**
 3、移除index元素
 */
- (id)cw_removeIndex:(int)index;

/**
 4、移除index元素
 */
- (id)cw_removeE:(id)E;

/**
 5、根据元素查找下标
 */
- (int)cw_indexOf:(id)E;

/**
 6、清空数据数据
 */
- (void)cw_clear;

/**
 7、数组的大小
 */
- (int)cw_size;

/**
 8、数组是否为空
 */
- (BOOL)cw_isEmpty;

/**
 9、是否包含某元素
 */
- (BOOL)cw_isContainE:(id)E;

/**
 10、根据下标查找某元素
 */
- (id)cw_getIndex:(int)index;

@end

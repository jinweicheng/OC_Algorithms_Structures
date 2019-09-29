//
//  CWPriorityQueue.h
//  15-优先级队列(Priority Queue)
//
//  Created by mac on 2019/7/5.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CWPriorityQueueModel;
@interface CWPriorityQueue : NSObject

@property (nonatomic,assign)  NSInteger size;
@property (nonatomic,strong)  NSMutableArray <CWPriorityQueueModel *>*arrays;
@property (nonatomic,assign)  BOOL MaxHeap;

/**
 1、优先级队列添加元素
 */
- (void)enQueue:(id)ele;

/**
 2、优先级队列删除元素
 */
- (id)deQueue;

/**
 3、获取队列头元素
 */
- (id)queue_front;

/**
 4、优先级队列的size
 */
- (int)queue_size;

/**
 5、优先级队列是否为空
 */
- (BOOL)queue_isEmpty;

/**
 6、优先级队列的的清空
 */
- (void)queue_clear;

@end

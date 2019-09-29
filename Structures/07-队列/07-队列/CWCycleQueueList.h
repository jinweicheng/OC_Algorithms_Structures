//
//  CWCycleQueueList.h
//  07-队列
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 循环队列：可以从尾添加，头删除的循环队列，内部基于数组实现功能。
 **/
@interface CWCycleQueueList : NSObject

@property (nonatomic,assign)  int size;              /**< 数组size */
@property (nonatomic,assign)  int front;             /**< 指向队列的头部下标 */
@property (nonatomic,assign)  int capacity;          /**< 数组的内存大小 */
@property (nonatomic,strong)  NSMutableArray *array; /**< 数组 */

/**
 1、入队（队尾入）
 */
- (void)cw_enQueue:(id)E;

/**
 2、出队（队头出）
 */
- (id)cw_deQueue;

/**
 3、出队（队头元素）
 */
- (id)cw_topQueue;

/**
 4、队列的大小
 */
- (int)cw_size;

/**
 5、队列是否为空
 */
- (BOOL)cw_isEmpty;

/**
 6、清空队列数据
 */
- (void)cw_clear;

@end

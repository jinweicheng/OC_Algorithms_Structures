//
//  CWDoubleCycleQueueList.h
//  07-队列
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 双端循环队列：可以从头尾添加，头尾删除的循环队列，内部基于数组实现功能。
 **/

@interface CWDoubleCycleQueueList : NSObject

@property (nonatomic,assign)  int size;              /**< 数组size */
@property (nonatomic,assign)  int front;             /**< 指向队列的头部下标 */
@property (nonatomic,assign)  int capacity;          /**< 数组的内存大小 */
@property (nonatomic,strong)  NSMutableArray *array; /**< 数组 */

/**
 1、入队（队头入）
 */
- (void)cw_enQueueHead:(id)E;

/**
 2、入队（队尾入）
 */
- (void)cw_enQueueTail:(id)E;

/**
 3、出队（队头出）
 */
- (id)cw_deQueueHead;

/**
 4、出队（队尾出）
 */
- (id)cw_deQueueTail;

/**
 5、获取队头元素
 */
- (id)cw_headQueue;

/**
 6、获取队尾元素
 */
- (id)cw_tailQueue;

/**
 7、队列的大小
 */
- (int)cw_size;

/**
 8、队列是否为空
 */
- (BOOL)cw_isEmpty;

/**
 9、清空队列数据
 */
- (void)cw_clear;

@end

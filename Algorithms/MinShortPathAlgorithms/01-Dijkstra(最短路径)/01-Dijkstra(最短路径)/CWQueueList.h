//
//  CWQueueList.h
//  07-队列
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 队列特点：只能在队列尾添加、队列头删除元素
 **/

@interface CWQueueList : NSObject

/**< 链表子节点数目 */
@property (nonatomic,assign)  int size;
/**< 队列元素 */
@property (nonatomic,copy) id ele;

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

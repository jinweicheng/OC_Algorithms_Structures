//
//  CWDoubleQueueList.h
//  07-队列
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 双端队列特点：能在队列头尾二端添加、删除元素
 **/

@interface CWDoubleQueueList : NSObject

/**< 链表子节点数目 */
@property (nonatomic,assign)  int size;
/**< 队列元素 */
@property (nonatomic,copy) id ele;

/**
 1、入队（队头入队）
 */
- (void)cw_enQueueH:(id)E;

/**
 2、入队（队尾入队）
 */
- (void)cw_enQueueT:(id)E;

/**
 3、出队（队头出队）
 */
- (id)cw_deQueueH;

/**
 4、出队（队尾出队）
 */
- (id)cw_deQueueT;

/**
 5、获取队列top元素（队尾元素）
 */
- (id)cw_tailQueue;

/**
 6、获取队列元素（队头元素）
 */
- (id)cw_headQueue;

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

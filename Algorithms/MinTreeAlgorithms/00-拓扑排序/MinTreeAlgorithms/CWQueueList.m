
//  CWQueueList.m
//  07-队列
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWQueueList.h"

@interface CWQueueList()
{
    CWQueueList *_first;                      // 头链表
    CWQueueList *_last;                       // 尾链表
}

@property(nonatomic,strong)CWQueueList *next;  // 头链表
@property (nonatomic,weak) id prev;            // 尾链表

@end

@implementation CWQueueList



/**
 0、初始化node节点
 */
- (instancetype)init{
    if (self = [super init]) {
        self.size = 0;
        self->_first = nil;
        self->_last = nil;
    }
    return self;
}

- (CWQueueList *)private_initListQueueNext:(CWQueueList *)next prev:(CWQueueList *)prev E:(id)E
{
    // 创建新node
    CWQueueList *queue = [[CWQueueList alloc] init];
    queue.next = next;
    queue.prev = prev;
    queue->_ele = E;
    queue->_first = nil;
    queue->_last = nil;
    return queue;
}


- (int)private_indexOf:(id)E
{
    int index = 0;
    CWQueueList *queue = self->_first;
    while (queue != nil) {
        if ([queue->_ele isEqual:E]) {
            return index;
        }
        queue = queue.next;
        index++;
    }
    return -1;
}

- (id)private_getIndex:(int)index
{
    [self private_addThrowException:index];
    CWQueueList *queue = nil;
    // index处于前半部分
    if (index <= self.size/2) { // 或者self.size >> 1
        queue = self->_first;
        for (int i = 0; i < index; i++) {
            queue = queue.next;
        }
    }
    // index处于后半部分
    else if (index > self.size/2){
        queue = self->_last;
        for (int i = self.size - 1; i > index; i--) {
            queue = queue.prev;
        }
    }
    return queue;
}


- (id)private_removeE:(id)E
{
    int index = [self private_indexOf:E];
    return [self private_removeIndex:index];
}

- (id)private_removeIndex:(int)index
{
    [self private_throwException:index];
    
    CWQueueList *queue = [self private_getIndex:index];
    CWQueueList *nextQ = queue.next;
    CWQueueList *prevQ = queue.prev;
    // 删除第一个元素
    if (prevQ == nil) {
        self->_first = nextQ;
    }else{
        prevQ.next = nextQ;
    }
    
    // 删除最后一个元素
    if (nextQ == nil) {
        self->_last = prevQ;
    }else{
        nextQ.prev = prevQ;
    }
    self.size--;
    return queue->_ele;
}



- (void)private_throwException:(int)index
{
    if (index < 0 || index >= self.size) {
        @throw [NSException exceptionWithName:@"listNode out of bounds" reason:@"index out of bounds" userInfo:nil];
    }
}

- (void)private_addThrowException:(int)index
{
    if (index < 0 || index > self.size) {
        @throw [NSException exceptionWithName:@"listNode out of bounds" reason:@"index out of bounds" userInfo:nil];
    }
}

- (NSString *)description
{
    NSString *temp = [NSString stringWithFormat:@"queue:["];
    CWQueueList *queue = self->_first;;
    for (int i = 0; i < self.size; i ++) {

        if (i == self.size -1) {
            temp = [temp stringByAppendingFormat:@"%@",queue->_ele];
        }else{
            temp = [temp stringByAppendingFormat:@"%@->",queue->_ele];
        }
        queue = queue.next;

    }
    temp = [temp stringByAppendingString:@"]"];
    return temp;
}




/**
 1、入队（队尾入队）
 */
- (void)cw_enQueue:(id)E
{
    CWQueueList *lastN = self->_last;
    CWQueueList *currenN = nil;
    // 1-1、第一次添加的元素
    if (lastN == nil) {
        currenN = [self private_initListQueueNext:nil prev:nil E:E];
        self->_first = currenN;
        self->_last = currenN;
    }
    // 1-2、往最后位置添加元素
    else{
        currenN = [self private_initListQueueNext:nil prev:lastN E:E];
        lastN.next = currenN;
        self->_last = currenN;
    }
    self.size++;
}

/**
 2、出队（队头出队）
 */
- (id)cw_deQueue
{
    id queue = [self private_removeIndex:0];
    return queue;
}

/**
 3、出队（队头元素）
 */
- (id)cw_topQueue
{
    id queue = [self private_getIndex:self.size-1];
    return queue;
}

/**
 4、队列的大小
 */
- (int)cw_size
{
    return self.size;
}

/**
 5、队列是否为空
 */
- (BOOL)cw_isEmpty
{
    return self.size == 0;
}

/**
 6、清空队列数据
 */
- (void)cw_clear
{
    self.size = 0;
    // 内存管理
    // iOS开发的内存优化处理
    CWQueueList *queue = self->_last;
    self->_first = nil;
    self->_last = nil;

    while (queue != nil) {
        queue.next = nil;
        queue = queue.prev;
    }
}
@end

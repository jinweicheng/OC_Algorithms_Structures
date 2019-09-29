//
//  CWDoubleQueueList.m
//  07-队列
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWDoubleQueueList.h"

@interface CWDoubleQueueList()
{
    CWDoubleQueueList *_first;                      // 头链表
    CWDoubleQueueList *_last;                       // 尾链表
}

@property(nonatomic,strong)CWDoubleQueueList *next;  // 头链表
@property (nonatomic,weak) id prev;            // 尾链表

@end

@implementation CWDoubleQueueList



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

- (CWDoubleQueueList *)private_initListQueueNext:(CWDoubleQueueList *)next prev:(CWDoubleQueueList *)prev E:(id)E
{
    // 创建新node
    CWDoubleQueueList *queue = [[CWDoubleQueueList alloc] init];
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
    CWDoubleQueueList *queue = self->_first;
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
    CWDoubleQueueList *queue = nil;
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
    
    CWDoubleQueueList *queue = [self private_getIndex:index];
    CWDoubleQueueList *nextQ = queue.next;
    CWDoubleQueueList *prevQ = queue.prev;
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
    CWDoubleQueueList *queue = self->_first;;
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
 1、入队（队头入队）
 */
- (void)cw_enQueueH:(id)E
{
    // 1、第一个元素和添加最后
    int index = 0;
    if (index == self.size) {
        CWDoubleQueueList *lastN = self->_last;
        CWDoubleQueueList *currenN = nil;
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
    }
    // 2、往中间位置添加元素（包含头位置）
    else{
        CWDoubleQueueList *target = [self private_getIndex:index];
        CWDoubleQueueList *prevN = target.prev;
        CWDoubleQueueList *newN = [self private_initListQueueNext:target prev:prevN E:E];
        // 添加index=0位置
        if (prevN == nil) {
            self->_first = newN;
        }else{
            prevN.next = newN;
        }
    }
    self.size++;
}

/**
 2、入队（队尾入队）
 */
- (void)cw_enQueueT:(id)E
{
    CWDoubleQueueList *lastN = self->_last;
    CWDoubleQueueList *currenN = nil;
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
 3、出队（队头出队）
 */
- (id)cw_deQueueH
{
    id queue = [self private_removeIndex:0];
    return queue;
}

/**
 4、出队（队尾出队）
 */
- (id)cw_deQueueT
{
    id queue = [self private_removeIndex:self.size-1];
    return queue;
}

/**
 5、获取队列top元素（队尾元素）
 */
- (id)cw_tailQueue
{
    id queue = [self private_getIndex:self.size-1];
    return queue;
}

/**
 6、获取队列元素（队头元素）
 */
- (id)cw_headQueue
{
    id queue = [self private_getIndex:0];
    return queue;
}

/**
 6、队列的大小
 */
- (int)cw_size
{
    return self.size;
}

/**
 7、队列是否为空
 */
- (BOOL)cw_isEmpty
{
    return self.size == 0;
}

/**
 8、清空队列数据
 */
- (void)cw_clear
{
    self.size = 0;
    // iOS开发的内存优化处理
    CWDoubleQueueList *queue = self->_last;
    self->_first = nil;
    self->_last = nil;
    
    while (queue != nil) {
        queue.next = nil;
        queue = queue.prev;
    }
}


@end

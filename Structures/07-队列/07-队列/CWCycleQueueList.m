//
//  CWCycleQueueList.m
//  07-队列
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWCycleQueueList.h"

@implementation CWCycleQueueList

- (instancetype)init{
    if (self = [super init]) {
        self.capacity = 5;
        self.array = [NSMutableArray arrayWithCapacity:self.capacity];
        for (int i = 0; i < self.capacity; i++) {
            self.array[i] = [NSNull null];
        }
        self.size = 0;
        self.front = 0;
    }
    return self;
}

/**
 1、入队（队尾入）
 */
- (void)cw_enQueue:(id)E
{
    [self ensureCapacity:self.size+1];
    int tailIndex = (self.front + self.size) % self.capacity;
    self.array[tailIndex] = E;
    self.size++;
}

/**
 2、出队（队头出）
 */
- (id)cw_deQueue
{
    id object = self.array[self.front];
    self.array[self.front] = [NSNull null];
    self.size--;
    self.front = (self.front + 1) % self.capacity;
    return object;
}

/**
 3、出队（队头元素）
 */
- (id)cw_topQueue
{
    return self.array[self.front];
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
    for (int i = 0; i < self.size; i++) {
        self.array[i] = [NSNull null];
    }
    self.size = 0;
    self.front = 0;
}

/**
 7、扩容循环队列
 */
- (void)ensureCapacity:(int)size
{
    int oldCapacity = self.capacity;
    if (size <= oldCapacity) {
        return;
    }
    int newCapacity = (NSUInteger)oldCapacity * 1.5;
    self.capacity = newCapacity;
    
    // 扩容，初始化数组内容
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:newCapacity];
    for (int i = 0; i < self.capacity; i++) {
        newArray[i] = [NSNull null];
    }
    for (int i = 0; i < self.size; i++) {
        newArray[i] = self.array[(self.front+i)%oldCapacity];
    }
    self.array = [newArray mutableCopy];
    self.front = 0;
}


/**
 8、打印循环队列数据
 */
- (NSString *)description
{
    NSString *temp = [NSString stringWithFormat:@"queue:capacity:%d[",self.capacity];
    for (int i = 0; i < self.capacity; i ++) {
        if (i == self.capacity -1) {
            temp = [temp stringByAppendingFormat:@"%@:%d",self.array[i],self.front];
        }else{
            temp = [temp stringByAppendingFormat:@"%@:%d-> ",self.array[i],self.front];
        }
    }
    temp = [temp stringByAppendingString:@"]"];
    return temp;
}
@end

//
//  CWDoubleCycleQueueList.m
//  07-队列
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWDoubleCycleQueueList.h"

@implementation CWDoubleCycleQueueList

- (instancetype)init{
    if (self = [super init]) {
        self.capacity = 10;
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
 1、入队（队头入队）
 */
- (void)cw_enQueueHead:(id)E
{
    int index = (self.front - 1 < 0)?(self.capacity-1):(self.front-1);
    self.array[index] = E;
    self.size++;
    self.front = index;
   
}

/**
 2、入队（队尾入队）
 */
- (void)cw_enQueueTail:(id)E
{
    [self ensureCapacity:self.size+1];
    int tailIndex = (self.front + self.size) % self.capacity;
    self.array[tailIndex] = E;
    self.size++;
}

/**
 3、出队（队头出）
 */
- (id)cw_deQueueHead
{
    id object = self.array[self.front];
    self.array[self.front] = [NSNull null];
    self.size--;
    self.front = (self.front + 1) % self.capacity;
    return object;
}

/**
 4、出队（队尾出）
 */
- (id)cw_deQueueTail
{
    
    int index = (self.front + self.size - 1) % self.capacity;
    id object = self.array[index];
    self.array[index] = [NSNull null];
    self.size--;
    return object;
}

/**
 5、获取队头元素
 */
- (id)cw_headQueue
{
     return self.array[self.front];
}

/**
 6、获取队尾元素
 */
- (id)cw_tailQueue
{
     return self.array[(self.front + self.size-1) % self.capacity];
}

/**
 7、队列的大小
 */
- (int)cw_size
{
    return self.size;
}

/**
 8、队列是否为空
 */
- (BOOL)cw_isEmpty
{
    return self.size == 0;
}

/**
 9、清空队列数据
 */
- (void)cw_clear
{
    for (int i = 0; i < self.size; i++) {
        self.array[(i+self.front)%self.capacity] = [NSNull null];
    }
    self.size = 0;
    self.front = 0;
}

/**
 10、扩容循环队列
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
 11、打印循环队列数据
*/
- (NSString *)description
{
    NSString *temp = [NSString stringWithFormat:@"capacity:%d,front:%d[",self.capacity,self.front];
    for (int i = 0; i < self.capacity; i ++) {
        if (i == self.capacity -1) {
            //temp = [temp stringByAppendingFormat:@"%@:%d",self.array[(self.front+i)%self.capacity],i];
            temp = [temp stringByAppendingFormat:@"%@",self.array[i]];
        }else{
            //temp = [temp stringByAppendingFormat:@"%@:%d->",self.array[(self.front+i)%self.capacity],i];
            temp = [temp stringByAppendingFormat:@"%@->",self.array[i]];
        }
    }
    temp = [temp stringByAppendingString:@"]"];
    return temp;
}

@end

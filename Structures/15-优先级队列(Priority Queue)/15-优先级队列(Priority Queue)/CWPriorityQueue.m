//
//  CWPriorityQueue.m
//  15-优先级队列(Priority Queue)
//
//  Created by mac on 2019/7/5.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWPriorityQueue.h"
#import "CWPriorityQueueModel.h"

@implementation CWPriorityQueue

- (instancetype)init
{
    if (self = [super init]) {
        _arrays = [NSMutableArray array];
        self.size = 0;
        self.MaxHeap = true;
    }
    return self;
}

/**
 1、优先级队列添加元素
 */
- (void)enQueue:(id)ele
{
    self.arrays[self.size++] = ele;
    [self private_afterAdd:self.size - 1];
}

/**
 2、优先级队列删除元素
 */
- (id)deQueue
{
    if (self.size == 0) {
        return nil;
    }
    id ele = self.arrays[0];
    int index = --self.size;
    self.arrays[0] = self.arrays[index];
    self.arrays[index] = [NSNull null];
    [self private_afterRemove:0];
    return ele;
}

/**
 3、获取队列头元素
 */
- (id)queue_front
{
    if (self.size == 0) {
        return nil;
    }
    return self.arrays[0];
}

/**
 4、优先级队列的size
 */
- (int)queue_size
{
    return self.size;
}

/**
 5、优先级队列是否为空
 */
- (BOOL)queue_isEmpty
{
    return self.size == 0;
}

/**
 6、优先级队列的的清空
 */
- (void)queue_clear
{
    self.size = 0;
    for (int i = 0; i < self.size; i ++) {
        self.arrays[i] = [NSNull null];
    }
}


#pragma mark - 类的私有方法

- (void)private_afterAdd:(NSInteger)index
{
    if (self.size <= 1) {
        return;
    }
    id newele = self.arrays[index];
    while (index > 0) {
        NSInteger indexp = (index - 1) >> 1;
        id parentele = self.arrays[indexp];
        if ([self private_compareEle:newele nele:parentele]) break;
        
        // 1、交换内容
        self.arrays[index] = parentele;
        // 2、交换下标
        index = indexp;
    }
    self.arrays[index] = newele;
}

- (void)private_afterRemove:(NSInteger)index
{
    if (self.size <= 1) {
        return;
    }
    
    id ele = self.arrays[index];
    int half = self.size >> 1;
    while (index < half) {
        int indexl = (index << 1) + 1;
        int indexr = indexl + 1;
        int indexm = indexl;
        id max = self.arrays[indexl];
        
        if ((indexr < self.size) && [self private_compareEle:self.arrays[indexl] nele:self.arrays[indexr]]) {
            max = self.arrays[indexr];
            indexm = indexr;
        }
        
        if ([self private_compareEle:max nele:ele]) {
            break;
        }
        self.arrays[index] = max;
        index = indexm;
    }
    self.arrays[index] = ele;
    
}

- (BOOL)private_compareEle:(id)ele nele:(id)nele
{
    if ([ele isKindOfClass:[NSString class]] && [nele isKindOfClass:[NSString class]]) {
        NSInteger eleint = [ele integerValue];
        NSInteger neleint = [nele integerValue];
        // 大堆
        if (self.MaxHeap) {
            return neleint > eleint;
        }
        // 小堆
        else{
            return eleint > neleint;
        }
        
    }
    // 设置优先级队列的优先级
    else if ([ele isKindOfClass:[CWPriorityQueueModel class]] && [nele isKindOfClass:[CWPriorityQueueModel class]]){
        CWPriorityQueueModel *oele = ele;
        CWPriorityQueueModel *nelement = nele;
        // 大堆
        if (self.MaxHeap) {
            return nelement.age > oele.age;
        }
        // 小堆
        else{
            return oele.age > nelement.age;
        }
    }else{
        return false;
    }
}


@end

//
//  CWMaxBinaryHeap.m
//  14-二叉堆(BinaryHeap)
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWMaxBinaryHeap.h"
//#import "MJBinaryTreeInfo.h"
@interface CWMaxBinaryHeap (){
    // 默认的二叉堆的容量
    NSInteger _capacity;
}
@end

@implementation CWMaxBinaryHeap

- (instancetype)init
{
    if (self = [super init]) {
//        _capacity = 10;
//        _binaryHeaps = [NSMutableArray arrayWithCapacity:_capacity];
        
        _binaryHeaps = [NSMutableArray array];
        self.size = 0;
        self.MaxHeap = true;
        for (int i = 0; i < _capacity; i ++) {
            self.binaryHeaps[i] = [NSNull null];
        }
    }
    
    return self;
}

- (void)batchHeaps:(NSArray *)array
{
    _binaryHeaps = array.mutableCopy;
    self.size = array.count;
    [self batchOperation];
    
}

- (void)batchOperation
{
    // 自上而下的上滤
//    for (int i = 1; i < self.size; i ++) {
//        [self private_afterAdd:i];
//    }
    
    // 自下而上的下滤
    for (int i = ((self.size >> 1) - 1); i >= 0; i--) {
        [self private_afterRemove:i];
    }
}

/**
 1、二叉堆的size
 */
- (int)heap_size
{
    return self.size;
}

/**
 2、二叉堆是否为空
 */
- (BOOL)isEmpty
{
    return self.size == 0;
}

/**
 3、二叉堆的清空
 */
- (void)clear
{
    self.size = 0;
    for (int i = 0; i < self.size; i ++) {
        self.binaryHeaps[i] = [NSNull null];
    }
}

/**
 4、二叉堆添加元素
 */
- (void)addEle:(id)ele
{
    _binaryHeaps[self.size++] = ele;
    [self private_afterAdd:self.size - 1];
    
}

/**
 5、获取堆顶元素
 */
- (id)getTop
{
    if (self.size == 0) {
        return nil;
    }
    return _binaryHeaps[0];
}

/**
 6、删除堆顶元素
 */
- (id)removeTop
{
    if (self.size == 0) {
        return nil;
    }
    id ele = _binaryHeaps[0];
    int index = --self.size;
    _binaryHeaps[0] = _binaryHeaps[index];
    _binaryHeaps[index] = [NSNull null];
    [self private_afterRemove:0];
    return ele;
}

/**
 7、删除堆顶元素同时插入一个新元素
 */
- (id)replaceTopWithEle:(id)ele
{
    if (self.size == 0) {
        return nil;
    }
    id top = nil;
    top = _binaryHeaps[0];
    _binaryHeaps[0] = ele;
    [self private_afterRemove:0];
    return top;
}


#pragma mark - 类的私有方法

- (void)private_afterAdd:(NSInteger)index
{
    if (self.size <= 1) {
        return;
    }
    id newele = _binaryHeaps[index];
    while (index > 0) {
        NSInteger indexp = (index - 1) >> 1;
        id parentele = _binaryHeaps[indexp];
        if ([self private_compareEle:newele nele:parentele]) break;
        
        // 1、交换内容
        _binaryHeaps[index] = parentele;
        // 2、交换下标
        index = indexp;
    }
    _binaryHeaps[index] = newele;
}

- (void)private_afterRemove:(NSInteger)index
{
    if (self.size <= 1) {
        return;
    }
    
    id ele = _binaryHeaps[index];
    int half = self.size >> 1;
    while (index < half) {
        int indexl = (index << 1) + 1;
        int indexr = indexl + 1;
        int indexm = indexl;
        id max = _binaryHeaps[indexl];
        
        if ((indexr < self.size) && [self private_compareEle:_binaryHeaps[indexl] nele:_binaryHeaps[indexr]]) {
            max = _binaryHeaps[indexr];
            indexm = indexr;
        }
        
        if ([self private_compareEle:max nele:ele]) {
            break;
        }
        _binaryHeaps[index] = max;
        index = indexm;
    }
    _binaryHeaps[index] = ele;
    
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
        
    }else{
        return false;
    }
}

#pragma mark - 二叉树的打印工具类
//- (id)root {
//    return @0;
//}
//
//- (id)left:(NSObject *)node {
//    int indexn = ((int)node << 1) + 1;
//    NSLog(@"left:%@",node);
//    return @(indexn >= self.size?0:indexn);
//}
//
//- (id)right:(NSObject *)node {
//    int indexn = ((int)node << 1) + 2;
//    NSLog(@"right:%@",node);
//    return @(indexn >= self.size?0:indexn);
//}
//
//- (id)string:(NSObject *)node {
//    NSLog(@"%@",node);
//    return _binaryHeaps[(int)node];
////    return @"a";
//}




@end

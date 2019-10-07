//
//  CWMaxBinaryHeap.h
//  14-二叉堆(BinaryHeap)
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWMaxBinaryHeap : NSObject

@property (nonatomic,assign)  int size;
@property (nonatomic,strong)  NSMutableArray *binaryHeaps;
@property (nonatomic,assign)  BOOL MaxHeap;

/**
 0、批量建堆
 */
- (void)batchHeaps:(NSArray *)array;
- (void)batchOperation;
- (void)afterRemove:(NSInteger)index;
/**
 1、二叉堆的size
 */
- (int)heap_size;

/**
 2、二叉堆是否为空
 */
- (BOOL)isEmpty;

/**
 3、二叉堆的清空
 */
- (void)clear;

/**
 4、二叉堆添加元素
 */
- (void)addEle:(id)ele;

/**
 5、获取堆顶元素
 */
- (id)getTop;

/**
 6、删除堆顶元素
 */
- (id)removeTop;

/**
 7、删除堆顶元素同时插入一个新元素
 */
- (id)replaceTopWithEle:(id)ele;


@end

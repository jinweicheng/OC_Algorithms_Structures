//
//  CWBinaryHeap.h
//  01-Kruskal算法(最小生成树)
//
//  Created by 程金伟 on 2019/10/22.
//  Copyright © 2019 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWGraph.h"


@interface CWBinaryHeap : NSObject

@property (nonatomic,assign)  int size;
@property (nonatomic,strong)  NSMutableArray *binaryHeaps;
@property (nonatomic,assign)  BOOL MaxHeap;

/**
 0、批量建堆
 */
- (void)batchHeaps:(NSArray *)array;
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



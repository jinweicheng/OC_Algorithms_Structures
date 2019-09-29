//
//  main.m
//  14-二叉堆(BinaryHeap)
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWMaxBinaryHeap.h"
#import "MJBinaryTrees.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 1、add
        NSArray *array = [[NSArray alloc] initWithObjects:@"41", @"75", @"65", @"28", @"13", @"100",nil];
        CWMaxBinaryHeap *heap = [[CWMaxBinaryHeap alloc] init];
        for (int i = 0; i < array.count; i ++) {
            [heap addEle:array[i]];
//            [MJBinaryTrees println:heap];
            //NSLog(@"-----------------------");
        }
        
        NSLog(@"%@",heap.binaryHeaps);
        NSLog(@"-----------------------");
        
        
        // 2、remove
        [heap removeTop];
        NSLog(@"%@",heap.binaryHeaps);
        NSLog(@"-----------------------");
        
        
        
        // 3、remove的同时添加新元素
        [heap replaceTopWithEle:@"20"];
        NSLog(@"%@",heap.binaryHeaps);
        NSLog(@"-----------------------");
        
        
        // 4、批量建堆
        CWMaxBinaryHeap *batchHeap = [[CWMaxBinaryHeap alloc] init];
        [batchHeap batchHeaps:[NSArray arrayWithObjects:@"10",@"100",@"90",@"20",@"15",@"30",@"95",@"60",@"50",@"25",nil]];
        NSLog(@"%@",batchHeap.binaryHeaps);
        NSLog(@"-----------------------");
        
        // 5、大堆 小堆
        CWMaxBinaryHeap *maxHeap = [[CWMaxBinaryHeap alloc] init];
        [maxHeap batchHeaps:[NSArray arrayWithObjects:@"10",@"100",@"90",@"20",@"15",@"30",@"95",@"60",@"50",@"5",nil]];
        NSLog(@"%@",maxHeap.binaryHeaps);
        NSLog(@"-----------------------");
        
        // 小堆
        CWMaxBinaryHeap *minHeap = [[CWMaxBinaryHeap alloc] init];
        minHeap.MaxHeap = false;
        [minHeap batchHeaps:[NSArray arrayWithObjects:@"10",@"100",@"90",@"20",@"15",@"30",@"95",@"60",@"50",@"5",nil]];
        NSLog(@"%@",minHeap.binaryHeaps);
        NSLog(@"-----------------------");
        
        // 6、从海量的数据中找topk数据(应用)
        NSLog(@"海量的数据中找topk数据-----------------------");
        NSArray *datas = [NSArray arrayWithObjects:@"10",@"100",@"90",@"20",@"15",@"30",@"95",@"60",@"50",@"5",nil];
        CWMaxBinaryHeap *minHeap2 = [[CWMaxBinaryHeap alloc] init];
        minHeap2.MaxHeap = false;
        NSInteger topk = 4;
        for (int i = 0; i < datas.count; i ++) {
            if (minHeap2.binaryHeaps.count < topk) {
                [minHeap2 addEle:datas[i]];
            }else if ([[minHeap2 getTop] integerValue] <= [datas[i] integerValue]){
                [minHeap2 replaceTopWithEle:datas[i]];
            }
        }
        NSLog(@"%@",minHeap2.binaryHeaps);
        NSLog(@"-----------------------");
        
        
        
    }
    return 0;
}

//
//  main.m
//  15-优先级队列(Priority Queue)
//
//  Created by mac on 2019/7/5.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWPriorityQueue.h"
#import "CWPriorityQueueModel.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        
        
        
        // 1、入队
        CWPriorityQueue *queue = [[CWPriorityQueue alloc] init];
        queue.MaxHeap = true;
        NSArray *datas = [NSArray arrayWithObjects:@"10",@"100",@"90",@"20",@"15",@"30",@"95",@"60",@"50",@"5",nil];
        for (int i = 0; i < datas.count; i++) {
            [queue enQueue:datas[i]];
        }
        NSLog(@"%@",queue.arrays);
        
        // 2、出队
        [queue deQueue];
        NSLog(@"%@",queue.arrays);
        
        
        
        // 3、入队
        NSLog(@"--------------------model入队--------------------");
        CWPriorityQueue *queueModel = [[CWPriorityQueue alloc] init];
        queueModel.MaxHeap = true;
        
        NSArray *dataAge = [NSArray arrayWithObjects:@"10",@"100",@"90",@"20",@"15",@"30",@"95",@"60",@"50",@"5",nil];
        NSArray *dataName = [NSArray arrayWithObjects:@"jack",@"mark",@"make",@"que",@"cjw",@"sanshi",@"jiayou",@"yiqi",@"ceshi",@"test",nil];
        for (int i = 0; i < dataAge.count; i++) {
            CWPriorityQueueModel *model = [[CWPriorityQueueModel alloc] initWithName:dataName[i] age:[dataAge[i] integerValue]];
            [queueModel enQueue:model];
        }
        NSLog(@"%@",queueModel.arrays);
        
        // 4、出队
        [queueModel deQueue];
        NSLog(@"%@",queueModel.arrays);
        
    }
    return 0;
}

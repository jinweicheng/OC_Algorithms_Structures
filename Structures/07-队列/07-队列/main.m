//
//  main.m
//  07-队列
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWQueueList.h"
#import "CWDoubleQueueList.h"
#import "CWCycleQueueList.h"
#import "CWDoubleCycleQueueList.h"
// 1、队列
void queueList()
{
    CWQueueList *queue = [[CWQueueList alloc] init];
    for (int i = 1; i < 9; i++) {
        [queue cw_enQueue:[NSString stringWithFormat:@"%d",i]];
    }
    
    NSLog(@"queue:%@",queue);
    
    [queue cw_clear];
    NSLog(@"size:%d,empty:%d",queue.size,queue.cw_isEmpty);
    //        CWQueueList *top = [queue cw_topQueue];
    //        NSLog(@"top:%@,size:%d,empty:%d",top.ele,queue.size,queue.cw_isEmpty);
    
    while (!queue.cw_isEmpty) {
        CWQueueList *q = [queue cw_deQueue];
        NSLog(@"%@",q);
    }
    NSLog(@"%@",queue);
}

// 2、双端队列
void doubleQueueList()
{
    CWDoubleQueueList *queue = [[CWDoubleQueueList alloc] init];
    for (int i = 1; i < 9; i++) {
        [queue cw_enQueueT:[NSString stringWithFormat:@"%d",i]];
    }
    NSLog(@"queue:%@",queue);
    
    [queue cw_enQueueT:@"9"];
    [queue cw_enQueueH:@"0"];
    NSLog(@"queue:%@",queue);
    
    [queue cw_deQueueT];
    [queue cw_deQueueH];
    NSLog(@"queue:%@,head:%@,tail:%@",queue,[[queue cw_headQueue] ele],[[queue cw_tailQueue] ele]);
}


// 3、循环队列
void cycleQueueList()
{
    CWCycleQueueList *cycle = [[CWCycleQueueList alloc] init];
    
    for (int i = 1; i < 4; i++) {
        [cycle cw_enQueue:[NSString stringWithFormat:@"%d",i]];
    }
    NSLog(@"%@",cycle);
    [cycle cw_deQueue];
    NSLog(@"%@",cycle);
    [cycle cw_deQueue];
    NSLog(@"%@",cycle);
    
    
    [cycle cw_enQueue:@"10"];
    [cycle cw_enQueue:@"11"];
    NSLog(@"%@",cycle);
    
    
    [cycle cw_deQueue];
    NSLog(@"%@",cycle);
    
    
    [cycle cw_enQueue:@"12"];
    [cycle cw_enQueue:@"13"];
    [cycle cw_enQueue:@"14"];
    NSLog(@"%@",cycle);
    
    
    [cycle cw_enQueue:@"15"];
    NSLog(@"%@",cycle);
    
    NSLog(@"%@",[cycle cw_topQueue]);
    
    
//    [cycle cw_clear];
//    NSLog(@"%@",cycle);
}


// 4、双端循环队列
void doubleCycleQueue()
{
    CWDoubleCycleQueueList *queue = [[CWDoubleCycleQueueList alloc] init];
    //0,10,null,null,null,null,null,null,null,null
    //0,10,11,null,null,null,null,null,null,1
    //0,10,11,12,null,null,null,null,2,1
    //0,10,11,12,13,null,null,3,2,1
    //0,10,11,12,13,14,4,3,2,1
    for (int i = 0; i < 5; i++) {
        [queue cw_enQueueHead:[NSString stringWithFormat:@"%d",i]];
        [queue cw_enQueueTail:[NSString stringWithFormat:@"%d",i+10]];
    }
    NSLog(@"%@",queue);
    NSLog(@"top:%@",[queue cw_headQueue]);
    NSLog(@"tail:%@",[queue cw_tailQueue]);
    
    
    
    
    
    [queue cw_deQueueHead];
    //0,10,11,12,13,14,null,3,2,1
    NSLog(@"%@",queue);
    [queue cw_deQueueTail];
    //0,10,11,12,13,null,null,3,2,1
    NSLog(@"%@",queue);
    
    [queue cw_deQueueHead];
    [queue cw_deQueueTail];
    //0,10,11,12,null,null,null,null,2,1
    NSLog(@"%@",queue);
    
    
    [queue cw_deQueueHead];
    [queue cw_deQueueTail];
    //0,10,11,null,null,null,null,null,null,1
    NSLog(@"%@",queue);
    
    
    [queue cw_deQueueHead];
    [queue cw_deQueueTail];
    //0,10,null,null,null,null,null,null,null,null
    NSLog(@"%@",queue);
    
    [queue cw_deQueueHead];
    [queue cw_deQueueTail];
    //null,null,null,null,null,null,null,null,null,null
    NSLog(@"%@",queue);
    
    
    
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 1、
        //queueList();
        
        // 2、
        //doubleQueueList();
        
        // 3、
        //cycleQueueList();
        
        // 4、
        doubleCycleQueue();
        
    }
    return 0;
}

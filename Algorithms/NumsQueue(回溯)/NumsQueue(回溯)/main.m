//
//  main.m
//  NumsQueue(回溯)
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWNumsQueue.h"
#import "CWNumsQueue2.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 皇后1方法
//        CWNumsQueue *queue = [[CWNumsQueue alloc] initWithNumber:4];
//        [queue placeQueues];
//
        // 皇后2方法
        CWNumsQueue2 *queue2 = [[CWNumsQueue2 alloc] initWithNumber:4];
        [queue2 placeQueues];

    }
    return 0;
}

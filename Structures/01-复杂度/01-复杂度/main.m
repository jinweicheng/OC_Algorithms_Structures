//
//  main.m
//  01-复杂度
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWTimeTool.h"
#import "CWFibObject.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        // 1、代码执行耗时
        CWTimeTool *time = [[CWTimeTool alloc] init];
        [time executeTimesForFunction:^{
            int j = 0;
            for (int i = 0; i < 2000000000; i ++) {
                j++;
            }
        }];
        
        
        
        // 2、斐波那契函数,当递归求第50个斐波那契数列时，需要69.37s
        // 时间复杂度为2+4+8+16=O(2^n)
        CWFibObject *fib = [[CWFibObject alloc] init];
        [time executeTimesForFunction:^{
            NSLog(@"%d",[fib fib_recursive:50]);
        }];
        
        // 优化的方法，只需要0.00s
        // 时间复杂度O(n)
        [time executeTimesForFunction:^{
            NSLog(@"%d",[fib fib_good:50]);
        }];
        
        
        
    }
    return 0;
}

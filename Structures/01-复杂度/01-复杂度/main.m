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

void timeAnalysis(int n){
    
    return;
    // O(1)  执行次数:1+10+10 ～~~~~ 常数次数,采用大O表示法时间复杂度为O(1)
    for (int i = 0; i < 10; i++) {
        NSLog(@"%d",i);
    }
    
    // O(n)  执行次数:1+n+n ～~~~~ 2n次数,时间复杂度为O(n)
    for(int i = 0;i < n;i++){
        NSLog(@"%d",i);
    }
    
    // O(logn)  执行次数:1+2*logn ~~~~ 2logn,时间复杂度为O(logn)
    for (int i = n; i > 0 ; i = i / 2) {
        NSLog(@"%d",n);
    }
    
    // O(nlogn)  执行次数:(1+2*n)(1+2*logn)->(1+2logn+2n+4n*logn) ~~~~~ 时间复杂度为O(nlogn)
    for (int i = 0; i < n; i++) {
        for (int j = n; j > 0 ; j = j / 2) {
            NSLog(@"%d",n);
        }
    }
    
    // O(n^2)  执行次数(1+n+n)*(1+n+n)->1+2n+2n+4n^2 ~~~~ 时间复杂度为O(n^2)
    for(int i = 0;i < n;i++){
        // (1+n+n)
        for (int j = 0; j < n; j++) {
            NSLog(@"%d",j);
        }
    }
    
    
    // O(n^3)  执行次数(1+2n)*(1+2n)*(1+2n)->(1+4n+4n^2)*(1+2n)->1+2n+4n+8n^2+4n^2+8n^3 ~~~~ 时间复杂度为O(n^3)
    for(int i = 0;i < n;i++){
        // (1+n+n)
        for (int j = 0; j < n; j++) {
            // (1+n+n)
            for (int k = 0; k < n; k++) {
                NSLog(@"%d",k);
            }
            
        }
    }
    
    // O(2^n) 斐波那契数列求和fib(n) = fib(n-1)+fib(n-2)
    /* fib(n) = fib(n-1)+fib(n-2)
        fib(n-1) = 2^(n-2)
        fib(n-2) = 2^(n-3)
    执行次数:2^0+2^1+2^2+2^3+2^4+2^(n-1) ~~~~ 2^n
    */
    CWFibObject *fib = [[CWFibObject alloc] init];
    [fib fib_recursive:20];
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 0、时间复杂度--程序的执行次数
        timeAnalysis(10000);
        
        
        
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

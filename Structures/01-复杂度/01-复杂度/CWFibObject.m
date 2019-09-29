//
//  CWFibObject.m
//  01-复杂度
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWFibObject.h"

@implementation CWFibObject

- (int)fib_recursive:(int)value
{
    if (value <= 2) return value;
    int sum = [self fib_recursive:value-1] + [self fib_recursive:value-2];
    return sum;
    
}

- (int)fib_good:(int)value
{
    if (value <= 2) return value;
    int sum = 2,first = 1,secend = 1;
    for (int i = 3; i < value; i++) {
        first = secend;
        secend = sum;
        sum = first + secend;
    }
    return sum;
}

@end

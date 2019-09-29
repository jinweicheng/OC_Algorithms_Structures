//
//  CWFibObject.h
//  01-复杂度
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

/**< 斐波那契数列 */
@interface CWFibObject : NSObject

/**
 1、常规递归的斐波那契计算方法
 @param value 第几个斐波那契数列
 */
- (int)fib_recursive:(int)value;


/**
 2、优化的斐波那契计算方法
 @param value 第几个斐波那契数列
 */
- (int)fib_good:(int)value;

@end

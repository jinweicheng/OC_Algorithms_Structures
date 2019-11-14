//
//  CWDivideConquer.h
//  DivideConquer(分治)
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWDivideConquer : NSObject

// 1、求最大连续子序列和（-2、1、-3、4、-1、2、1、-5、4）O(n^3)
- (void)maxSubString1:(NSArray *)strings;

// 2、求最大连续子序列和（-2、1、-3、4、-1、2、1、-5、4）O(n^2)
- (void)maxSubString2:(NSArray *)strings;

// 3、分治求最大连续子序列和（-2、1、-3、4、-1、2、1、-5、4）O(nlogn)
- (NSInteger)maxSubStrForDivideConquer:(NSArray *)strings;
@end

//
//  CWDivideConquer.m
//  DivideConquer(分治)
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "CWDivideConquer.h"

@implementation CWDivideConquer

// 1、求最大连续子序列和（-2、1、-3、4、-1、2、1、-5、4）O(n^3)
- (void)maxSubString1:(NSArray *)strings
{
    NSLog(@"====================O(n^3)方法====================");
    int max = INT_MIN;
    NSMutableArray *maxArray = [NSMutableArray array];
    for (int begin = 0; begin < strings.count; begin++) {
        for (int end = begin; end < strings.count; end++) {
            int sum = 0;
            NSMutableArray *maxSubs = [NSMutableArray array];
            for (int k = begin; k < end; k++) {
                sum += [strings[k] intValue];
                [maxSubs addObject:strings[k]];
            }
            // 比较选择最大值
            if (sum > max) {
                max = sum;
                [maxArray removeAllObjects];
                [maxArray addObjectsFromArray:maxSubs];
            }
        }
    }
    NSLog(@"最大值:%d\n%@",max,maxArray);
}

// 2、求最大连续子序列和（-2、1、-3、4、-1、2、1、-5、4）O(n^2)
- (void)maxSubString2:(NSArray *)strings
{
    NSLog(@"====================O(n^2)方法====================");
    int max = INT_MIN;
    NSMutableArray *maxArray = [NSMutableArray array];
    for (int begin = 0; begin < strings.count; begin++) {
        int sum = 0;
        NSMutableArray *maxSubs = [NSMutableArray array];
        for (int end = begin; end < strings.count; end++) {
            
            // 优化了这边一层的for循环遍历
            sum += [strings[end] intValue];
            [maxSubs addObject:strings[end]];

            // 比较选择最大值
            if (sum > max) {
                max = sum;
                [maxArray removeAllObjects];
                [maxArray addObjectsFromArray:maxSubs];
            }
        }
    }
    NSLog(@"最大值:%d\n%@",max,maxArray);
}

// 3、分治求最大连续子序列和（-2、1、-3、4、-1、2、1、-5、4）O(nlogn)
- (NSInteger)maxSubStrForDivideConquer:(NSArray *)strings
{
    if (strings.count == 0) {
        return 0;
    }
    NSLog(@"====================O(nlogn)方法====================");
    NSInteger result = [self maxSubStrForDivideConquer:strings begin:0 end:strings.count];
    NSLog(@"%ld",result);
    return result;
}

- (int)maxSubStrForDivideConquer:(NSArray *)strings begin:(NSInteger)begin end:(NSInteger)end
{
    if (end - begin < 2) {
        return [strings[begin] intValue];
    }
    
    // 从中间往左半部分最大值
    int max = 0;
    int mid = (int)((begin + end) >> 1);
    int leftMax = [strings[mid - 1] intValue];
    int leftSum = leftMax;
    for (int i = mid - 2; i >= begin; i--) {
        leftSum += [strings[i] intValue];
        if (leftSum > leftMax) {
            leftMax = leftSum;
        }
    }
    
    // 从中间往右半部分最大值
    int rightMax = [strings[mid] intValue];
    int rightSum = rightMax;
    for (int i = mid + 1; i < end; i++) {
        rightSum += [strings[i] intValue];
        if (rightSum > rightMax) {
            rightMax = rightSum;
        }
    }
    
    max = rightMax + leftMax;
    // 左半部分、右半部分求最大值
    int maxLeft = [self maxSubStrForDivideConquer:strings begin:begin end:mid];
    int maxRight = [self maxSubStrForDivideConquer:strings begin:mid end:end];
    
    if (maxLeft > max) {
        max = maxLeft;
    }
    
    if (maxRight > max) {
        max = maxRight;
    }
    return max;
}

@end

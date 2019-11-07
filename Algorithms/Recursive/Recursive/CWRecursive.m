//
//  CWRecursive.m
//  Recursive
//
//  Created by 程金伟 on 2019/11/7.
//  Copyright © 2019 cjw. All rights reserved.
//

#import "CWRecursive.h"

@implementation CWRecursive

// 1、上楼梯
- (int)climbStair:(int)num
{
	if (num <= 2) {
		return num;
	}
	return [self climbStair:num-1] + [self climbStair:num-2];
}

- (int)good_climbStair:(int)num
{
	if(num <= 2)return num;
	int first = 1;
	int second = 2;
	for (int i = 3; i <= 4; i++) {
		second = first + second;
		first = second - first;
	}
	return second;
}

// 2、汉诺塔
- (void)hanoi:(int)num A:(NSString *)A B:(NSString *)B C:(NSString *)C
{
	if(num <= 1) {
		[self move:num from:A to:C];
	}
	[self hanoi:num - 1 A:A B:C C:B];
	[self move:num from:A to:C];
	[self hanoi:num - 1 A:B B:A C:C];
}

- (void)move:(int)num from:(NSString *)from to:(NSString *)to
{
	NSLog(@"盘号:%d + %@ -> %@",num,from,to);
}

@end

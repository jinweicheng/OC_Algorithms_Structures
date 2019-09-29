//
//  CWTimeTool.m
//  01-复杂度
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWTimeTool.h"

@implementation CWTimeTool

// 1、计算执行任务的时间
- (void)executeTimesForFunction:(ExecuteBlock)block
{
    
    _block = block;
    if (_block) {
        // 1、开始时间
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"];
        [formatter setTimeZone:timeZone];
        NSDate *dateS = [NSDate date];
        NSString *tempS = [formatter stringFromDate:dateS];
        double timeS = (long)([dateS timeIntervalSince1970]*10000);
        
        // 2、task执行
        _block();
        
        // 3、结束时间
        NSDate *dateE = [NSDate date];
        NSString *tempE = [formatter stringFromDate:dateE];
        double timeE = (long)([dateE timeIntervalSince1970]*10000);
        
        // 4、耗时计算
        double consume = timeE - timeS;
        NSLog(@"\n       [开始:%@]\n       [结束:%@]\n       [耗时:%.2fs]\n",tempS,tempE,consume/10000);
    }
}

// 2、判断是否为降序数组
+ (BOOL)isDescOrderArray:(NSArray *)array
{
	BOOL desc = true;
	for (int i = 0; i < array.count; i++) {
		NSString *max = array[0];
		if ([max integerValue] < [array[i] integerValue]) {
			desc = false;
		}
	}
	return desc;
}

// 3、判断是否为正序数组
+ (BOOL)isAscOrderArray:(NSArray *)array
{
	BOOL asc = true;
	for (int i = 0; i < array.count; i++) {
		NSString *max = array[0];
		if ([max integerValue] > [array[i] integerValue]) {
			asc = false;
		}
	}
	return asc;
}

@end

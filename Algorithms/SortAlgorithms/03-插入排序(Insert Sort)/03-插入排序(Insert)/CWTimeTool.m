//
//  CWTimeTool.m
//  01-复杂度
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWTimeTool.h"

@interface CWTimeTool()
{
	NSInteger _compareC;
	NSInteger _exchangeC;
	
}
@end

@implementation CWTimeTool

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
        NSLog(@"\n       [开始:%@]\n       [结束:%@]\n       [耗时:%.2fs]\n       [比较次数:%@]\n       [交换次数:%@]\n\n",tempS,tempE,consume/10000,[self private_unitCount:_compareC],[self private_unitCount:_exchangeC]);
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

// 4、比较方法
- (BOOL)compare:(NSString *)value1 value2:(NSString *)value2
{
	_compareC++;
	return [value1 integerValue] > [value2 integerValue];
}

// 5、交换次数
- (void)exchangeValue
{
	_exchangeC++;
//	NSString *temp = array[index1];
//	array[index1] = array[index2];
//	array[index2] = temp;
}


#pragma mark - privateMethod

- (NSString *)private_unitCount:(NSInteger)count
{
	if (count < 10000) {
		return [NSString stringWithFormat:@"%ld",count];
	}else{ // 大于一万
		if (count < 10000*10000) {
			return [NSString stringWithFormat:@"%.4f万",count/10000.0];
		}else{
			return [NSString stringWithFormat:@"%.4f亿",count/10000.0/10000.0];
		}
		
	}
}


@end

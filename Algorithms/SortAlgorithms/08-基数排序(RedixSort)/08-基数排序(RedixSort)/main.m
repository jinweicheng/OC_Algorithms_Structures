//
//  main.m
//  08-基数排序(RedixSort)
//
//  Created by 程金伟 on 2019/10/6.
//  Copyright © 2019 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWTimeTool.h"

NSMutableArray *_counts,*_sortArray;
// 2、基数排序
void divideSort(NSInteger divide)
{
	// 2-2、统计数值出现的个数
	NSMutableArray *counts = [NSMutableArray arrayWithCapacity:10];
	for (int i = 0; i < 10; i++) {
		counts[i] = [NSString stringWithFormat:@"%d",0];
	}
		
	for (int i = 0; i < _sortArray.count; i++) {
		NSInteger index = [_sortArray[i] integerValue] / divide % 10;
		NSInteger count = [counts[index] integerValue];
		counts[index] = [NSString stringWithFormat:@"%ld",++count];
	}
	// 转化成相应数值对应的下标
	for (int i = 1; i < counts.count; i++) {
		counts[i] = [NSString stringWithFormat:@"%ld",[counts[i] integerValue] + [counts[i-1] integerValue]];
	}
	
	// 2-3、赋值操作(为了保证数据的稳定性，所以从后面开始遍历)
	NSInteger index = 0;
	NSMutableArray *results = [NSMutableArray arrayWithCapacity:_sortArray.count];
	for (int i = 0; i < _sortArray.count; i++) {
		results[i] = @"0";
	}
	for (NSInteger i = _sortArray.count - 1; i >= 0; i--) {
		index = [_sortArray[i] integerValue] / divide % 10;
		NSInteger count = [counts[index] integerValue];
		counts[index] = [NSString stringWithFormat:@"%ld",--count];
		results[count] = _sortArray[i];
		
	}
	_sortArray = results.mutableCopy;
	// NSLog(@"%@",_sortArray);
}
void redixSort()
{
	// 2-1、寻找最大值
	NSString *max = _sortArray[0];
	for (int i = 1; i < _sortArray.count; i++) {
		if([max integerValue] < [_sortArray[i] integerValue]){
			max = _sortArray[i];
		}
	}
	for (int divide = 1; divide <= max.intValue;divide *= 10) {
		// 对个位、十位、百位...排序
		divideSort(divide);
	}
}



int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
	NSMutableArray *array = [NSMutableArray arrayWithObjects:@"0.34",@"0.47",@"0.99",@"0.84",@"0.46",@"0.37",@"0.36",@"0.79", nil];
//	 	NSMutableArray *array = [NSMutableArray arrayWithObjects:@"10",@"9",@"9",@"56",@"19",@"28",@"37",@"34",@"10",@"9", nil];
//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"126",@"69",@"593",@"23",@"6",@"89",@"54",@"8", nil];
//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"10",@"9",@"7",@"6",@"5",@"4",@"3", nil];
//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2",@"4",@"6",@"6",@"6",@"12",@"14", nil];
//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"12",@"4",@"6",@"2", nil];
//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"3",@"6",@"11",@"18",@"8",@"10",@"12",@"14", nil];
//	 	NSMutableArray *array = [NSMutableArray arrayWithObjects:@"8",@"7",@"6",@"5",@"4",@"3",@"2",@"1", nil];
		
//		NSMutableArray *array = [NSMutableArray array];
//		for (int i = 0; i < 10000; i++) {
//			[array addObject:[NSString stringWithFormat:@"%d",arc4random() % (10000+1)]];
//		}
		_sortArray = array.mutableCopy;
//		CWTimeTool *time = [[CWTimeTool alloc] init];
//		[time executeTimesForFunction:^{
//			countingSort2();
//		}];
		
//		CWTimeTool *time2 = [[CWTimeTool alloc] init];
//		[time2 executeTimesForFunction:^{
//			redixSort();
//		}];
		
	
		
		
		
		
		
		
	}
	return 0;
}


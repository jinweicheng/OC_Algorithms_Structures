//
//  main.m
//  09-桶排序(BucketSort)
//
//  Created by 程金伟 on 2019/10/6.
//  Copyright © 2019 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWTimeTool.h"

NSMutableArray *_counts,*_sortArray;

// 3、桶排序(针对s容器d内的数组元素值较小)
void bucketSort()
{
	// 3-1、创建桶数组
	NSInteger length = _sortArray.count;
	NSMutableArray *buckets = [NSMutableArray arrayWithCapacity:_sortArray.count];
	for (int i = 0; i < length; i++) {
		[buckets addObject:[NSMutableArray array]];
	}
	for (int i = 0; i < length; i++) {
		NSInteger arrayIndex = (NSInteger)([_sortArray[i] floatValue] * (float)length);
		NSMutableArray *items = buckets[arrayIndex];
		[items addObject:_sortArray[i]];
	}
	
	// 3-2、对桶内的数据进行排序
	for (int i = 0; i < buckets.count; i++) {
		NSMutableArray *array = buckets[i];
		for (int j = 1; j < array.count; j++) {
			if ([array[j-1] floatValue ] > [array[j] floatValue]) {
				NSString *temp = array[j];
				array[j] = array[j-1];
				array[j-1] = temp;
			}
		}
	}
	
	// 3-3、完成排序
	NSMutableArray *results = [NSMutableArray arrayWithCapacity:length];
	for (int i = 0; i < buckets.count; i++) {
		NSMutableArray *array = buckets[i];
		for (int j = 0; j < array.count; j++) {
			[results addObject:array[j]];
		}
	}
	NSLog(@"%@",results);
	
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
		
		CWTimeTool *time3 = [[CWTimeTool alloc] init];
		[time3 executeTimesForFunction:^{
			bucketSort();
		}];
		
		
		
		
		
		
	}
	return 0;
}


//
//  main.m
//  01-冒泡排序
//
//  Created by 程金伟 on 2019/9/22.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWTimeTool.h"



// 冒泡排序1
void sort1(NSArray *arr,CWTimeTool *timeT)
{
	NSMutableArray *array = arr.mutableCopy;
	for (NSInteger i = array.count; i > 0; i--) {
		for (NSInteger j = 0; j < i - 1 ; j++) {
			if ([timeT compare:array[j] value2:array[j+1]]) {
				[timeT exchangeValue];
				NSString *temp = array[j];
				array[j] = array[j+1];
				array[j+1] = temp;
			}
		}
	}
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:array]);
//	NSLog(@"%@",array);
}


// 冒泡排序2，优化:如果都是排好序的，直接停止排序
void sort2(NSArray *arr,CWTimeTool *timeT)
{
	NSMutableArray *array = arr.mutableCopy;
	for (NSInteger i = array.count; i > 0; i--) {
		BOOL sorted = true;
		for (NSInteger j = 0; j < i - 1 ; j++) {
			if ([timeT compare:array[j] value2:array[j+1]]) {
				[timeT exchangeValue];
				NSString *temp = array[j];
				array[j] = array[j+1];
				array[j+1] = temp;
				sorted = false;
			}
		}
		if (sorted)break;
	}
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:array]);
//	NSLog(@"%@",array);
}

// 冒泡排序3（尾有序），优化:后面部分已经排好序，记录排好序的下标，下次循环最后位置为记录好的下标
void sort3(NSArray *arr,CWTimeTool *timeT)
{
	NSMutableArray *array = arr.mutableCopy;
	for (NSInteger i = array.count - 1; i > 0; i--) {
		NSInteger index = 1;// index=1原因是因为排序算法的稳定性考虑
		for (NSInteger j = 0; j < i; j++) {
			if ([timeT compare:array[j] value2:array[j+1]]) {
				[timeT exchangeValue];
				NSString *temp = array[j];
				array[j] = array[j+1];
				array[j+1] = temp;
				index = j+1;
			}
		}
		i = index;
	}
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:array]);
//	NSLog(@"%@",array);
}


int main(int argc, const char * argv[]) {
	@autoreleasepool {
//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"10",@"9",@"56",@"19",@"28",@"37",@"34", nil];
		NSMutableArray *array = [NSMutableArray array];
		for (int i = 0; i < 10000; i++) {
			[array addObject:[NSString stringWithFormat:@"%d",arc4random() % (10000+1)]];
		}
		
		CWTimeTool *time = [[CWTimeTool alloc] init];
		[time executeTimesForFunction:^{
			sort1(array.copy,time) ;
		}];
		
		CWTimeTool *time2 = [[CWTimeTool alloc] init];
		[time2 executeTimesForFunction:^{
			sort2(array.copy,time2);
		}];
		
		CWTimeTool *time3 = [[CWTimeTool alloc] init];
		[time3 executeTimesForFunction:^{
			sort3(array.copy,time3);
		}];
		

		
	
		
	}
	return 0;
}




//
//  main.m
//  04-归并排序(Merge Sort)
//
//  Created by 程金伟 on 2019/9/26.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWTimeTool.h"

NSMutableArray *_backArray,*_sortArray;

// 归并排序 -- 合并
void merge(NSInteger begin,NSInteger middle,NSInteger end,CWTimeTool *time)
{
	// 1、数组下标(临时备份数组、右半部分数组、左边数组)
	NSInteger tb = 0,te = middle - begin;
	NSInteger rb = middle,re = end;
	NSInteger lb = begin;
	
	// 2、备份数组数据
	for (NSInteger i = tb; i < te; i++) {
		[time exchangeValue];
		_backArray[i] = _sortArray[begin + i];
	}
	
	// 3、有序数组合成中...
	while(tb < te){
//		if ((rb < re) && [_backArray[tb] integerValue] > [_sortArray[rb] integerValue]) {
		if ((rb < re) && [time compare:_backArray[tb] value2:_sortArray[rb]]) {
			[time exchangeValue];
			_sortArray[lb++] = _sortArray[rb++];
		}else{
			[time exchangeValue];
			_sortArray[lb++] = _backArray[tb++];
		}
	}
	
	
	// 3-1、右边先结束
//	if (tb < te) {
//		while(tb < te){
//			if ([_backArray[tb] integerValue] > [_sortArray[rb] integerValue]) {
//				_sortArray[lb++] = _sortArray[rb++];
//			}else{
//				_sortArray[lb++] = _backArray[tb++];
//			}
//		}
//	}
	
	// 3-2、左边先结束
//	if (rb < re) {
//		while(rb < re){
//			if ([_backArray[tb] integerValue] > [_sortArray[rb] integerValue]) {
//				_sortArray[lb++] = _sortArray[rb++];
//			}else{
//				_sortArray[lb++] = _backArray[tb++];
//			}
//		}
//		// 最后需要将备份的数据一步步添加到sort数组中
//		while (tb < te) {
//			_sortArray[lb++] = _backArray[tb++];
//		}
//	}
	
}

// 归并排序 -- 分拆、合并
void devide(NSInteger begin,NSInteger end,CWTimeTool *time)
{
	if(end - begin < 2) return;
	NSInteger mid = (end + begin) >> 1;
	// NSLog(@"================================");
	// NSLog(@"begin=%ld mid=%ld end=%ld",begin,mid,end);
	devide(begin,mid,time);
	// NSLog(@"--------------------------------");
	// NSLog(@"mid=%ld end=%ld",mid,end);
	devide(mid, end,time);
	// NSLog(@"????????????????????????????????");
	// NSLog(@"begin=%ld mid=%ld end=%ld",begin,mid,end);
	merge(begin, mid, end,time);
	
}

// 归并排序
void mergeSort(NSMutableArray *sortArray,CWTimeTool *time)
{
	// 备份数组（原始数组的一般长度）
	_backArray = [NSMutableArray arrayWithCapacity:_sortArray.count];
	devide(0,_sortArray.count,time);
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:sortArray]);
//	NSLog(@"%@",sortArray);
	
}


int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
//	 	NSMutableArray *array = [NSMutableArray arrayWithObjects:@"10",@"9",@"56",@"19",@"28",@"37",@"34", nil];
//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"10",@"9",@"7",@"6",@"5",@"4",@"3", nil];
//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2",@"4",@"6",@"6",@"6",@"12",@"14", nil];
//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"12",@"4",@"6",@"2", nil];
//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"3",@"6",@"11",@"18",@"8",@"10",@"12",@"14", nil];
//	 	NSMutableArray *array = [NSMutableArray arrayWithObjects:@"8",@"7",@"6",@"5",@"4",@"3",@"2",@"1", nil];
		NSMutableArray *array = [NSMutableArray array];
		for (int i = 0; i < 10000; i++) {
			[array addObject:[NSString stringWithFormat:@"%d",arc4random() % (10000+1)]];
		}
		_sortArray = array.mutableCopy;
		CWTimeTool *time = [[CWTimeTool alloc] init];
		[time executeTimesForFunction:^{
			mergeSort(_sortArray,time);
		}];
		
		
		
		
		
		
	}
	return 0;
}

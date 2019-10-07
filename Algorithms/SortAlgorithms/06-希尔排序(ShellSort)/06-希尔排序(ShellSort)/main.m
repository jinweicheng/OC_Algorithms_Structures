//
//  main.m
//  06-希尔排序(ShellSort)
//
//  Created by 程金伟 on 2019/10/6.
//  Copyright © 2019 cjw. All rights reserved.
//
#import "CWTimeTool.h"

NSMutableArray *_counts,*_sortArray;

// 希尔排序步长序列1
NSMutableArray* stepSequence()
{
	NSMutableArray *array = [NSMutableArray array];
	NSInteger length = _sortArray.count;
	while ((length = length >> 1) > 0) {
		[array addObject:[NSString stringWithFormat:@"%ld",length]];
	}
	return array;
}

// 希尔排序步长序列2
NSMutableArray* stepSequence2()
{
	NSMutableArray *array = [NSMutableArray array];
	int k = 0,step = 0;
	while (true) {
		if (k % 2 == 0) {
			int pow0 = (int) pow(2, k >> 1);
			step = 1 + 9 * (pow0 * pow0 - pow0);
		}else{
			int pow1 = (int) pow(2,(k - 1) >> 1);
			int pow2 = (int) pow(2,(k + 1) >> 1);
			step = 1 + 8 * pow1 * pow2 - 6 * pow2;
		}
		if (step >= _sortArray.count) {
			break;
		}
		[array insertObject:[NSString stringWithFormat:@"%d",step] atIndex:0];
		k++;
	}
	NSLog(@"%@",array);
	return array;
}

void sort(NSInteger step,CWTimeTool *time)
{
	// 逐列进行插入排序
	for (NSInteger col = 0; col < step; col++) {
		for (NSInteger begin = col + step; begin < _sortArray.count; begin += step) {
			NSInteger curren = begin;
			while (curren > col && [time compare:_sortArray[curren - step] value2:_sortArray[curren]]) {
				NSString *temp = _sortArray[curren];
				_sortArray[curren] = _sortArray[curren - step];
				_sortArray[curren - step] = temp;
				[time exchangeValue];
				curren -= step;
			}
		}
	}
}

// 希尔排序
void shellSort(CWTimeTool *time)
{
//	NSMutableArray *array = stepSequence();
	NSMutableArray *array = stepSequence2();
	for (int i = 0; i < array.count; i++) {
		sort([array[i] integerValue],time);
	}
}


int main(int argc, const char * argv[]) {
	@autoreleasepool {
//	 	NSMutableArray *array = [NSMutableArray arrayWithObjects:@"10",@"9",@"9",@"56",@"19",@"28",@"37",@"34",@"10",@"9", nil];
//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"126",@"69",@"593",@"23",@"6",@"89",@"54",@"8", nil];
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
			shellSort(time);
		}];
		NSLog(@"%d",[CWTimeTool isAscOrderArray:_sortArray]);
		
		
	}
	return 0;
}



//
//  main.m
//  05-快速排序(QuickSort)
//
//  Created by 程金伟 on 2019/10/6.
//  Copyright © 2019 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWTimeTool.h"

NSMutableArray *_counts,*_sortArray;

// 5、确定轴点w元素
int pivotIndex(int begin,int end,CWTimeTool *time)
{
	// 1、获取随机轴点,交换
	int index = begin + arc4random() % (end - begin);
	NSString *temp = _sortArray[begin];
	_sortArray[begin] = _sortArray[index];
	_sortArray[index] = temp;
	// 2、保存begin位置数值
 	NSString *pivotValue = _sortArray[begin];
	end--;
	while (begin < end) {
		while (begin < end) {
			if ([time compare:_sortArray[end] value2:pivotValue]) {
				end--;
			}else{
				_sortArray[begin++] = _sortArray[end];
				break;
			}
		}
		
		while (begin < end) {
			if ([time compare:pivotValue value2:_sortArray[begin]]) {
				begin++;
			}else{
				_sortArray[end--] = _sortArray[begin];
				break;
			}
		}
	}
	_sortArray[begin] = pivotValue;
	return begin;
}

void quickSort(int begin,int end,CWTimeTool *time)
{
	if (end - begin < 2) {
		return;
	}
	int pivot = pivotIndex(begin, end,time);
	quickSort(begin, pivot,time);
	quickSort(pivot + 1, end,time);
}


// 6、希尔排序步长序列1
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
//	NSLog(@"%@",array);
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
		
		NSMutableArray *array = [NSMutableArray array];
		for (int i = 0; i < 10000; i++) {
			[array addObject:[NSString stringWithFormat:@"%d",arc4random() % (10000+1)]];
		}
		// l、快速排序
		_sortArray = array.mutableCopy;
		CWTimeTool *time = [[CWTimeTool alloc] init];
		[time executeTimesForFunction:^{
			quickSort(0,_sortArray.count,time);
		}];
		NSLog(@"desc=%d",[CWTimeTool isAscOrderArray:_sortArray]);
		
		// 2、希尔排序
		_sortArray = array.mutableCopy;
		CWTimeTool *time2 = [[CWTimeTool alloc] init];
		[time2 executeTimesForFunction:^{
			shellSort(time2);
		}];
		NSLog(@"desc=%d",[CWTimeTool isAscOrderArray:_sortArray]);
		
		
		
	}
	return 0;
}


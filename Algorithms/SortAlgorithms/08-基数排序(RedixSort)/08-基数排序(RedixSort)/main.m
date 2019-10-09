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
// 1、基数排序
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
		counts[i] = [NSString stringWithFormat:@"%ld",[counts[i] integerValue] + [counts[i - 1] integerValue]];
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
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:_sortArray]);
}


// 2、基数排序方法二（消耗更多的空间，减低时间复杂度）
void divideSort2(CWTimeTool *time)
{
    // 2-1、找到最大数值
    NSInteger max = 0;
    for (int i = 0; i < _sortArray.count; i++) {
        if (max < [_sortArray[i] integerValue]) {
            max = [_sortArray[i] integerValue];
        }
    }
    
    // 2-2、分拆到二维数组的数据(0-9的二维数组)
    for (int devide = 1; devide <= max; devide *= 10) {
        
        // 初始化二维数组
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 10; i++) {
            NSMutableArray *rows = [NSMutableArray array];
            for (int j = 0; j < _sortArray.count; j++) {
                [rows addObject:@""];
            }
            [array addObject:rows];
        }
        
        // 分拆二维数组到对应的列数组中...
        int colIndex = 0;
        NSMutableArray *arraySize = [NSMutableArray arrayWithCapacity:_sortArray.count];
        for (int i = 0; i < _sortArray.count; i++) {
            [arraySize addObject:@"0"];
        }
        for(int j = 0; j < _sortArray.count; j++) {
            int value = [_sortArray[j] intValue];
            colIndex = value / devide % 10;
            int size = [arraySize[colIndex] intValue];
            array[colIndex][size] = _sortArray[j];
            arraySize[colIndex] = [NSString stringWithFormat:@"%d",++size];
        }
        
        // 整合二维数组中的有序数据(0-9的二维数组)
        int index = 0;
        for (int col = 0; col < 10; col++) {
            for (int row = 0; row < [arraySize[col] intValue]; row++) {
                _sortArray[index++] = array[col][row];
            }
        }
    }
    NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:_sortArray]);
//    NSLog(@"%@",_sortArray);
}



int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
//        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"88",@"12",@"109",@"1800",@"288",@"30",@"66",@"44",@"23",@"22", nil];
//        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"8888",@"3457",@"2356",@"2129",@"1866",@"844",@"184",@"83",@"41",@"22", nil];
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 10000; i++) {
            [array addObject:[NSString stringWithFormat:@"%d",arc4random() % (10000+1)]];
        }
		_sortArray = array.mutableCopy;
        // 基数排序1
        CWTimeTool *time = [[CWTimeTool alloc] init];
        [time executeTimesForFunction:^{
            redixSort();
        }];
        
		// 基数排序优化（空间换时间）
		CWTimeTool *time2 = [[CWTimeTool alloc] init];
		[time2 executeTimesForFunction:^{
			divideSort2(time2);
		}];
        
        
		
	
		
		
		
		
		
		
	}
	return 0;
}


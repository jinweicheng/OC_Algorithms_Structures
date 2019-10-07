//
//  main.m
//  01-SelectSort
//
//  Created by mac on 2019/9/23.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWMaxBinaryHeap.h"
#import "CWTimeTool.h"

// 1、选择排序：(每一趟遍历找到最大值，与数组最后元素进行交换)
void selectSort1(NSMutableArray *arr,CWTimeTool *timeT)
{
    NSMutableArray *array = arr.mutableCopy;
    for(NSInteger i = array.count - 1;i > 0;i--){
        NSInteger maxIndex = 0;
        NSString *max = array[0];
        for (NSInteger j = 1; j < i + 1; j++) {
            // 1、查找最大值下标
//			if ([max integerValue] < [array[j] integerValue]) {
            if ([timeT compare:array[j] value2:max]) {
                max = array[j];
                maxIndex = j;
            }
        }
        // 2、与最后元素交换最大值
        NSString *temp = array[maxIndex];
        array[maxIndex] = array[i];
        array[i] = temp;
    }
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:array]);
	
}

// 2-2、选择排序：（使用最大堆，简化搜索最大值过程）
void selectSort2(NSMutableArray *arr,CWTimeTool *timeT)
{
    // 1、批量建堆
    CWMaxBinaryHeap *maxHeap = [[CWMaxBinaryHeap alloc] init];
    [maxHeap batchHeaps:arr];
    
    // 2、交换
    while (maxHeap.size > 1) {
        // 2-1、交换
		[timeT exchangeValue];
        NSString *temp = maxHeap.binaryHeaps[0];
        maxHeap.binaryHeaps[0] = maxHeap.binaryHeaps[maxHeap.size-1];
        maxHeap.binaryHeaps[maxHeap.size-1] = temp;
        //2-2、heap_size
        maxHeap.size--;
        // 2-3、下滤
        [maxHeap afterRemove:0];
    }
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:maxHeap.binaryHeaps]);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

//        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"10",@"9",@"8",@"7",@"6",@"5",@"4",@"3", nil];
//        selectSort1(array.copy);
        
//        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"49",@"38",@"65",@"97",@"76",@"13",@"27",@"49", nil];
		
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 10000; i++) {
            [array addObject:[NSString stringWithFormat:@"%d",arc4random() % (10000+1)]];
        }
		
//        NSMutableArray *array = [NSMutableArray array];
//        for (int i = 0; i < 10000; i++) {
//            [array addObject:[NSString stringWithFormat:@"%d",arc4random() % (10000+1)]];
//        }
		
        
        CWTimeTool *timeblcok1 = [[CWTimeTool alloc] init];
        
        [timeblcok1 executeTimesForFunction:^{
            selectSort1(array.mutableCopy,timeblcok1);
        }];
        
        CWTimeTool *timeblcok2 = [[CWTimeTool alloc] init];
        [timeblcok2 executeTimesForFunction:^{
            selectSort2(array.mutableCopy,timeblcok2);
        }];

        
        
        
        
        
        
        
    }
    return 0;
}

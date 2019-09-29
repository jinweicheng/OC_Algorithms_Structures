//
//  main.m
//  03-插入排序(Insert)
//
//  Created by 程金伟 on 2019/9/24.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWTimeTool.h"

// 1、插入排序
void insertSort1(NSArray *arr,CWTimeTool *timeT)
{
	NSMutableArray *array = arr.mutableCopy;
	for (NSInteger i = 1; i < array.count; i++) {
		NSInteger cur = i;
//        while (cur > 0 && [array[cur] integerValue] < [array[cur - 1] integerValue]) {
        while (cur > 0 && (![timeT compare:array[cur] value2:array[cur - 1]])) {
            [timeT exchangeValue];
			NSString *temp = array[cur];
			array[cur] = array[cur - 1];
			array[cur - 1] = temp;
			cur--;
		}
	}
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:array]);
//    NSLog(@"%@",array);
}


// 2、插入排序(替换的代码量减少)
void insertSort2(NSArray *arr,CWTimeTool *timeT)
{
	NSMutableArray *array = arr.mutableCopy;
	for (NSInteger i = 1; i < array.count; i++) {
		NSInteger cur = i;
        NSString *insert = array[cur];
//        while (cur > 0 && [array[cur] integerValue] < [array[cur - 1] integerValue]) {
		while (cur > 0 && [timeT compare:array[cur - 1] value2:insert]) {
            [timeT exchangeValue];
			array[cur] = array[cur - 1];
			cur--;
		}
        array[cur] = insert;
	}
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:array]);
//    NSLog(@"%@",array);
}


// 二分查找方法（但是出现重复数据，会有问题）

NSInteger binarySearch(NSArray *arr,NSInteger value)
{
    // binarySearch test
    //        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2",@"4",@"6",@"6",@"6",@"12",@"14", nil];
    //        assert(binarySearch(array.copy, 4) == 1);
    //        assert(binarySearch(array.copy, 2) == 0);
    //        assert(binarySearch(array.copy, 14) == 6);
    //        assert(binarySearch(array.copy, 6) == 3);
    //        assert(binarySearch(array.copy, 7) == -1);
    //        assert(binarySearch(array.copy, 18) == -1);
    
	NSInteger begin = 0;
	NSInteger end = arr.count;
	while (begin < end) {
		NSInteger mid = (begin + end) >> 1;
		if (value > [arr[mid] integerValue]) {
			begin = mid + 1;
		}else if(value < [arr[mid] integerValue]){
			end = mid;
		}else{
			return mid;
		}
	}
	return -1;
}

// 一般数据排序流程
// @"10",@"80",@"2",@"8",@"16",@"66",@"70"
// 1、@"10",@"80",@"2",@"8",@"16",@"66",@"70"
// 2、@"10",@"80",@"2",@"8",@"16",@"66",@"70"   ---->>> @"2",@"10",@"80",@"8",@"16",@"66",@"70"
// 3、@"2",@"10",@"80",@"8",@"16",@"66",@"70"   ---->>> @"2",@"8",@"10",@"80",@"16",@"66",@"70"
// 4、@"2",@"8",@"10",@"80",@"16",@"66",@"70"   ---->>> @"2",@"8",@"10",@"16",@"80",@"66",@"70"
// 5、@"2",@"8",@"10",@"16",@"80",@"66",@"70"   ---->>> @"2",@"8",@"10",@"16",@"66",@"80",@"70"
// 6、@"2",@"8",@"10",@"16",@"66",@"80",@"70"   ---->>> @"2",@"8",@"10",@"16",@"66",@"70",@"80"

// 带有重复数据排序流程
// @"16",@"80",@"16",@"8",@"16",@"66",@"70",@"16"
// 1、@"16",@"80",@"16",@"8",@"16",@"66",@"70",@"16"  ---->>> @"16",@"80",@"16",@"8",@"16",@"66",@"70",@"16"
// 2、@"16",@"80",@"16",@"8",@"16",@"66",@"70",@"16"  ---->>> @"16",@"16",@"80",@"8",@"16",@"66",@"70",@"16"
// 3、@"16",@"16",@"80",@"8",@"16",@"66",@"70",@"16"  ---->>> @"8",@"16",@"16",@"80",@"16",@"66",@"70",@"16"
// 4、@"8",@"16",@"16",@"80",@"16",@"66",@"70",@"16"  ---->>> @"8",@"16",@"16",@"16",@"80",@"66",@"70",@"16"
// 5、@"8",@"16",@"16",@"16",@"80",@"66",@"70",@"16"  ---->>> @"8",@"16",@"16",@"16",@"66",@"80",@"70",@"16"
// 6、@"8",@"16",@"16",@"16",@"66",@"80",@"70",@"16"  ---->>> @"8",@"16",@"16",@"16",@"66",@"70",@"80",@"16"
// 7、@"8",@"16",@"16",@"16",@"66",@"70",@"80",@"16"  ---->>> @"8",@"16",@"16",@"16",@"66",@"16",@"70",@"80"

// 3、插入排序(前半部分二分查找)
// 二分查找方法（查找第一个最近大于value值的数据）
NSInteger search(NSInteger index,NSMutableArray *array,CWTimeTool *timeT)
{
    NSInteger begin = 0;
    NSInteger end = index;
    while(begin < end){
        NSInteger mid = (end + begin) >> 1;
        //        if([array[index] integerValue] < [array[mid] integerValue]){
        if([timeT compare:array[mid] value2:array[index]]){
            end = mid;
        }else{
            begin = mid + 1;
        }
    }
    return begin;
}

void insert(NSInteger startIndex,NSInteger moveIndex,CWTimeTool *timeT,NSMutableArray *array)
{
    NSString *currenE = array[startIndex];
    for (NSInteger i = startIndex; i > moveIndex; i--) {
        [timeT exchangeValue];
        array[i] = array[i - 1];
    }
    array[moveIndex] = currenE;
}


void insertSort3(NSArray *arr,CWTimeTool *timeT)
{
    
    NSMutableArray *array = arr.mutableCopy;
    for (NSInteger i = 1; i < array.count; i++) {
        insert(i, search(i, array, timeT), timeT, array);
    }
    NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:array]);
//    NSLog(@"%@",array);
}






int main(int argc, const char * argv[]) {
	@autoreleasepool {
//        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"10",@"9",@"56",@"19",@"28",@"37",@"34", nil];
//        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"10",@"9",@"7",@"6",@"5",@"4",@"3", nil];
//        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2",@"4",@"6",@"6",@"6",@"12",@"14", nil];
//        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"16",@"80",@"16",@"8",@"16",@"66",@"70",@"16", nil];
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 10000; i++) {
            [array addObject:[NSString stringWithFormat:@"%d",arc4random() % (10000+1)]];
        }
		
        CWTimeTool *time = [[CWTimeTool alloc] init];
        [time executeTimesForFunction:^{
            insertSort1(array.copy,time) ;
        }];

        CWTimeTool *time2 = [[CWTimeTool alloc] init];
        [time2 executeTimesForFunction:^{
            insertSort2(array.copy,time2);
        }];

        CWTimeTool *time3 = [[CWTimeTool alloc] init];
        [time3 executeTimesForFunction:^{
            insertSort3(array.copy,time3);
        }];
        

        
        
       
	}
	return 0;
}


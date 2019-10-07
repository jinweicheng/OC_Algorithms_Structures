//
//  main.m
//  00-排序(Sort)
//
//  Created by 程金伟 on 2019/10/7.
//  Copyright © 2019 cjw. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "CWMaxBinaryHeap.h"
#import "CWTimeTool.h"

NSMutableArray *_counts,*_sortArray,*_backArray;


// 冒泡排序1-1
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
}


// 冒泡排序1-2，优化:如果都是排好序的，直接停止排序
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
}

// 冒泡排序1-3（尾有序），优化:后面部分已经排好序，记录排好序的下标，下次循环最后位置为记录好的下标
void sort3(NSArray *arr,CWTimeTool *timeT)
{
	NSMutableArray *array = arr.mutableCopy;
	for (NSInteger i = array.count; i > 0; i--) {
		NSInteger index = 1;// index=1原因是因为排序算法的稳定性考虑
		for (NSInteger j = 0; j < i - 1 ; j++) {
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
}

// 2、选择排序：(每一趟遍历找到最大值，与数组最后元素进行交换)
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


// 3-1、插入排序
void insertSort1(NSArray *arr,CWTimeTool *timeT)
{
	NSMutableArray *array = arr.mutableCopy;
	for (NSInteger i = 1; i < array.count; i++) {
		NSInteger cur = i;
//		while (i > 0 && [array[i] integerValue] < [array[i - 1] integerValue]) {
		while (i > 0 && [timeT compare:array[i - 1] value2:array[i]]) {
			[timeT exchangeValue];
			NSString *temp = array[i];
			array[i] = array[i - 1];
			array[i - 1] = temp;
			i--;
		}
		i = cur;
	}
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:array]);
}


// 3-2、插入排序
void insertSort2(NSArray *arr,CWTimeTool *timeT)
{
	NSMutableArray *array = arr.mutableCopy;
	for (NSInteger i = 1; i < array.count; i++) {
		NSInteger cur = i;
//		while (i > 0 && [array[i] integerValue] < [array[i - 1] integerValue]) {
		while (i > 0 && [timeT compare:array[i - 1] value2:array[i]]) {
			[timeT exchangeValue];
			NSString *temp = array[i];
			array[i] = array[i - 1];
			array[i - 1] = temp;
			i--;
		}
		i = cur;
	}
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:array]);
}

// 3-3、插入排序
void insertSort3(NSArray *arr,CWTimeTool *timeT)
{
	NSMutableArray *array = arr.mutableCopy;
	for (NSInteger i = 1; i < array.count; i++) {
		NSInteger cur = i;
		while (i > 0 && [timeT compare:array[i - 1] value2:array[i]]) {
			[timeT exchangeValue];
			NSString *temp = array[i];
			array[i] = array[i - 1];
			array[i - 1] = temp;
			i--;
		}
		i = cur;
	}
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:array]);
}

NSInteger binarySearch(NSArray *arr,CWTimeTool *timeT,NSInteger value)
{
	NSInteger begin = 0;
	NSInteger end = arr.count;
	while (begin < end) {
		NSInteger mid = (begin + end) >> 1;
		if (value > [arr[mid] integerValue]) {
			end = mid;
		}else if(value < [arr[mid] integerValue]){
			begin = mid + 1;
		}else{
			return mid;
		}
	}
	return -1;
}

NSInteger good_binarySearch(NSArray *arr,CWTimeTool *timeT,NSInteger value)
{
	NSInteger begin = 0;
	NSInteger end = arr.count;
	while (begin < end) {
		NSInteger mid = (begin + end) >> 1;
		if(value < [arr[mid] integerValue]){
			begin = mid + 1;
		}else{
			end = mid;
		}
	}
	return -1;
}

// 4、归并排序 -- 合并
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
		if ((rb < re) && [time compare:_backArray[tb] value2:_sortArray[rb]]) {
			[time exchangeValue];
			_sortArray[lb++] = _sortArray[rb++];
		}else{
			[time exchangeValue];
			_sortArray[lb++] = _backArray[tb++];
		}
	}
	
//	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:_sortArray]);
}

// 4、归并排序 -- 分拆、合并
void devide(NSInteger begin,NSInteger end,CWTimeTool *time)
{
	if(end - begin < 2) return;
	NSInteger mid = (end + begin) >> 1;
	devide(begin,mid,time);
	devide(mid, end,time);
	merge(begin, mid, end,time);
	
}

// 4、归并排序
void mergeSort(NSMutableArray *sortArray,CWTimeTool *time)
{
	// 备份数组（原始数组的一般长度）
	_backArray = [NSMutableArray arrayWithCapacity:_sortArray.count];
	devide(0,_sortArray.count,time);
//	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:sortArray]);
}




// 5、快速排序-确定轴点w元素
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

// 5、快速排序
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

// 6、希尔排序步长序列2
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
	return array;
}

// 6、希尔排序
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

// 6、希尔排序
void shellSort(CWTimeTool *time)
{
//	NSMutableArray *array = stepSequence();
	NSMutableArray *array = stepSequence2();
	for (int i = 0; i < array.count; i++) {
		sort([array[i] integerValue],time);
	}
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:_sortArray]);
}

// 7、计数排序
void countingSort(CWTimeTool *time)
{
	// 1-1、寻找最大值
	NSString *max = _sortArray[0];
	for (int i = 1; i < _sortArray.count; i++) {
//		if([max integerValue] < [_sortArray[i] integerValue]){
		if([time compare:_sortArray[i] value2:max]){
			max = _sortArray[i];
		}
	}
	
	// 1-2、统计数值出现的个数
	// 数组占位
	NSMutableArray *counts = [NSMutableArray arrayWithCapacity:max.intValue + 1];
	for (int i = 0; i < max.intValue + 1; i++) {
		[counts addObject:[NSString stringWithFormat:@"%d",0]];
	}
	// 数组
	NSInteger temp;
	for (int i = 0; i < _sortArray.count; i++) {
		int count = [_sortArray[i] intValue];
		temp = [counts[count] integerValue];
		counts[count] = [NSString stringWithFormat:@"%ld",++temp];
	}
	
	// 1-3、输出排好序的数据
	NSMutableArray *results = [NSMutableArray arrayWithCapacity:_sortArray.count];
	for (int i = 0; i < counts.count; i++) {
		NSInteger temp = [counts[i] integerValue];
		while (temp-- > 0) {
			[results addObject:[NSString stringWithFormat:@"%d",i]];
		}
	}
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:results]);
}

// 7、计数排序优化(开辟空间优化由max减少到max-min+1)
void countingSort2(CWTimeTool *time)
{
	// 1-1、寻找最大值、最小值
	NSString *max = _sortArray[0];
	NSString *min = _sortArray[0];
	for (int i = 1; i < _sortArray.count; i++) {
//		if([max integerValue] < [_sortArray[i] integerValue]){
		if([time compare:_sortArray[i] value2:max]){
			max = _sortArray[i];
		}
		
//		if ([min integerValue] > [_sortArray[i] integerValue]) {
		if ([time compare:min value2:_sortArray[i]]) {
			min = _sortArray[i];
		}
	}
	
	// 1-2、统计数值出现的个数
	// 数组占位
	NSMutableArray *counts = [NSMutableArray arrayWithCapacity:max.intValue - min.intValue + 1];
	for (int i = 0; i < max.intValue - min.intValue + 1; i++) {
		[counts addObject:[NSString stringWithFormat:@"%d",0]];
	}
	// 数组
	NSInteger temp;
	for (int i = 0; i < _sortArray.count; i++) {
		int count = [_sortArray[i] intValue];
		temp = [counts[count - min.intValue] integerValue];
		counts[count - min.intValue] = [NSString stringWithFormat:@"%ld",++temp];
	}
	
	// 1-3、输出排好序的数据
	NSMutableArray *results = [NSMutableArray arrayWithCapacity:_sortArray.count];
	for (int i = 0; i < counts.count; i++) {
		NSInteger temp = [counts[i] integerValue];
		while (temp-- > 0) {
			[results addObject:[NSString stringWithFormat:@"%d",i + min.intValue]];
		}
	}
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:results]);
}

// 8、基数排序
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




int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
		NSMutableArray *array = [NSMutableArray array];
		for (int i = 0; i < 10000; i++) {
			[array addObject:[NSString stringWithFormat:@"%d",arc4random() % (10000+1)]];
		}
		// 1、冒泡排序
		NSLog(@"===========冒泡排序===========");
		CWTimeTool *time1_1 = [[CWTimeTool alloc] init];
		[time1_1 executeTimesForFunction:^{
			sort1(array.copy, time1_1);
		}];
		CWTimeTool *time1_2 = [[CWTimeTool alloc] init];
		[time1_2 executeTimesForFunction:^{
			sort1(array.copy, time1_2);
		}];
		CWTimeTool *time1_3 = [[CWTimeTool alloc] init];
		[time1_3 executeTimesForFunction:^{
			sort1(array.copy, time1_3);
		}];
		
		// 2、选择排序
		NSLog(@"===========选择排序===========");
		CWTimeTool *time2_1 = [[CWTimeTool alloc] init];
        [time2_1 executeTimesForFunction:^{
            selectSort1(array.mutableCopy,time2_1);
        }];
        
        CWTimeTool *time2_2 = [[CWTimeTool alloc] init];
        [time2_2 executeTimesForFunction:^{
            selectSort2(array.mutableCopy,time2_2);
        }];
		
		// 3、插入排序
		NSLog(@"===========插入排序===========");
		CWTimeTool *time3 = [[CWTimeTool alloc] init];
		[time3 executeTimesForFunction:^{
			insertSort1(array.copy,time3) ;
		}];
		
		// 4、归并排序
		NSLog(@"===========归并排序===========");
		_sortArray = array.mutableCopy;
		CWTimeTool *time4 = [[CWTimeTool alloc] init];
		[time4 executeTimesForFunction:^{
			mergeSort(_sortArray,time4);
		}];
		
		// 5、快速排序
		NSLog(@"===========快速排序===========");
		_sortArray = array.mutableCopy;
		CWTimeTool *time5 = [[CWTimeTool alloc] init];
		[time5 executeTimesForFunction:^{
			quickSort(0,_sortArray.count,time5);
		}];
		NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:_sortArray]);
		
		// 6、希尔排序
		NSLog(@"===========希尔排序===========");
		_sortArray = array.mutableCopy;
		CWTimeTool *time6 = [[CWTimeTool alloc] init];
		[time6 executeTimesForFunction:^{
			shellSort(time6);
		}];
		NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:_sortArray]);
		
		// 7、计数排序
		NSLog(@"===========计数排序===========");
		_sortArray = array.mutableCopy;
		CWTimeTool *time7 = [[CWTimeTool alloc] init];
		[time7 executeTimesForFunction:^{
			countingSort2(time7);
		}];
		
		// 8、基数排序
		NSLog(@"===========基数排序===========");
		_sortArray = array.mutableCopy;
		CWTimeTool *time8 = [[CWTimeTool alloc] init];
		[time8 executeTimesForFunction:^{
			redixSort();
		}];
		
		
		
	}
	return 0;
}



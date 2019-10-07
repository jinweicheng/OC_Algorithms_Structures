# Algorithms-and-Structures


* 一、冒泡排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/01-冒泡排序(Bubble%20Sort)>
* 二、选择排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/02-选择排序(Selection%20Sort)>
* 三、插入排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/03-插入排序(Insert%20Sort)>
* 四、归并排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/04-归并排序(Merge%20Sort)>
* 五、快速排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/05-快速排序(QuickSort)>
* 六、希尔排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/06-希尔排序(ShellSort)>
* 七、计数排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/07-计数排序(CountingSort)>
* 八、基数排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/08-基数排序(RedixSort)>
* 九、桶排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/09-桶排序(BucketSort)>



性能分析
```
大量测试数据
NSMutableArray *array = [NSMutableArray array];
for (int i = 0; i < 10000; i++) {
    [array addObject:[NSString stringWithFormat:@"%d",arc4random() % (10000+1)]];
}
一、冒泡排序
2019-10-07 12:11:58.190553+0800 00-冒泡排序(Sort)[41361:7021690] 
       [开始:2019-10-07 12:11:33 956]
       [结束:2019-10-07 12:11:58 190]
       [耗时:24.23s]
       [比较次数:4999.5000万]
       [交换次数:2494.2753万]       
 2019-10-07 12:12:25.380284+0800 00-冒泡排序2(Sort)[41361:7021690] 
       [开始:2019-10-07 12:11:58 191]
       [结束:2019-10-07 12:12:25 380]
       [耗时:27.19s]
       [比较次数:4999.5000万]
       [交换次数:2494.2753万]      
 2019-10-07 12:12:48.345920+0800 00-冒泡排序3(Sort)[41361:7021690] 
       [开始:2019-10-07 12:12:25 380]
       [结束:2019-10-07 12:12:48 346]
       [耗时:22.97s]
       [比较次数:4999.5000万]
       [交换次数:2494.2753万]
二、选择排序
2019-10-07 12:13:19.221827+0800 00-选择排序(Sort)[41361:7021690] 
       [开始:2019-10-07 12:12:48 346]
       [结束:2019-10-07 12:13:19 222]
       [耗时:30.88s]
       [比较次数:4999.5000万]
       [交换次数:0]
堆排序       
2019-10-07 12:13:19.341608+0800 00-堆排序(Sort)[41361:7021690] 
       [开始:2019-10-07 12:13:19 222]
       [结束:2019-10-07 12:13:19 341]
       [耗时:0.12s]
       [比较次数:0]
       [交换次数:9999]
       
三、插入排序
2019-10-07 12:13:34.317047+0800 00-插入排序(Sort)[41361:7021690] 
       [开始:2019-10-07 12:13:19 342]
       [结束:2019-10-07 12:13:34 317]
       [耗时:14.98s]
       [比较次数:2495.2745万]
       [交换次数:2494.2753万]
四、归并排序
2019-10-07 12:14:19.234172+0800 00-归并排序(Sort)[41361:7021690] 
       [开始:2019-10-07 12:13:34 317]
       [结束:2019-10-07 12:14:19 234]
       [耗时:44.92s]
       [比较次数:12.0352万]
       [交换次数:19.0651万]
五、快速排序
2019-10-07 12:14:19.305483+0800 00-快速排序(Sort)[41361:7021690] 
       [开始:2019-10-07 12:14:19 234]
       [结束:2019-10-07 12:14:19 305]
       [耗时:0.07s]
       [比较次数:15.0756万]
       [交换次数:0]
六、希尔排序
2019-10-07 12:14:19.415699+0800 00-希尔排序(Sort)[41361:7021690] 
       [开始:2019-10-07 12:14:19 311]
       [结束:2019-10-07 12:14:19 416]
       [耗时:0.10s]
       [比较次数:19.4201万]
       [交换次数:10.5884万]

七、计数排序
2019-10-07 12:14:19.478353+0800 00-计数排序(Sort)[41361:7021690] 
       [开始:2019-10-07 12:14:19 420]
       [结束:2019-10-07 12:14:19 478]
       [耗时:0.06s]
       [比较次数:1.9998万]
       [交换次数:0]
八、基数排序
2019-10-07 12:14:19.655705+0800 00-基数排序(Sort)[41361:7021690] 
       [开始:2019-10-07 12:14:19 479]
       [结束:2019-10-07 12:14:19 656]
       [耗时:0.18s]
       [比较次数:0]
       [交换次数:0]
```
----------  

### 排序算法
#### 一、冒泡排序 

* 1-1、冒泡排序关键代码

```
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
```

> 冒泡排序2，优化:如果都是排好序的，直接停止排序(查看详细代码)

```
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
```

> 冒泡排序3（尾有序），优化:后面部分已经排好序，记录排好序的下标，下次循环最后位置为记录好的下标(查看详细代码)
```
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
```
----------

#### 二、选择排序 


* 2-1、选择排序：(每一趟遍历找到最大值，与数组最后元素进行交换)

```
void selectSort1(NSMutableArray *arr)
{
  NSMutableArray *array = arr.mutableCopy;
  for(NSInteger i = array.count - 1;i > 0;i--){
  NSInteger maxIndex = 0;
  NSString *max = array[0];
  for (NSInteger j = 1; j < i + 1; j++) {
    // 1、查找最大值下标
    if ([max integerValue] < [array[j] integerValue]) {
    max = array[j];
    maxIndex = j;
  }
}
  // 2、与最后元素交换最大值
  NSString *temp = array[maxIndex];
  array[maxIndex] = array[i];
  array[i] = temp;
  }
  NSLog(@"desc=%d\nasc=%d",[CWTimeTool isDescOrderArray:array],[CWTimeTool isAscOrderArray:array]);    
}
```

* 2-2、选择排序：（使用最大堆，简化搜索最大值过程）

```
void selectSort2(NSMutableArray *arr)
{
  // 1、批量建堆
  CWMaxBinaryHeap *maxHeap = [[CWMaxBinaryHeap alloc] init];
  [maxHeap batchHeaps:arr];

  // 2、交换
  while (maxHeap.size > 1) {
  // 2-1、交换
  NSString *temp = maxHeap.binaryHeaps[0];
  maxHeap.binaryHeaps[0] = maxHeap.binaryHeaps[maxHeap.size-1];
  maxHeap.binaryHeaps[maxHeap.size-1] = temp;
  //2-2、heap_size
  maxHeap.size--;
  // 2-3、下滤
  [maxHeap afterRemove:0];
  }
  NSLog(@"desc=%d\nasc=%d",[CWTimeTool isDescOrderArray:maxHeap.binaryHeaps],[CWTimeTool isAscOrderArray:maxHeap.binaryHeaps]);
}
```
----------

#### 三、插入排序 

* 3-1、关键代码

```
// 插入排序
void insertSort1(NSArray *arr,CWTimeTool *timeT)
{
  NSMutableArray *array = arr.mutableCopy;
  for (NSInteger i = 1; i < array.count; i++) {
    NSInteger cur = i;
    while (cur > 0 && (![timeT compare:array[cur] value2:array[cur - 1]])) {
      [timeT exchangeValue];
      NSString *temp = array[cur];
      array[cur] = array[cur - 1];
      array[cur - 1] = temp;
      cur--;
    }
  }
  NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:array]);
}
```

* 插入排序优化(替换的代码量减少，参考详细代码)
```
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
```
* 3-3、插入排序优化(前半部分二分查找，参考详细代码)
```
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
```
----------


#### 四、归并排序 

* 4-1、关键代码

```
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
```

```
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
    if ((rb < re) && [time compare:_backArray[tb] value2:_sortArray[rb]]) {
      [time exchangeValue];
      _sortArray[lb++] = _sortArray[rb++];
      }else{
      [time exchangeValue];
      _sortArray[lb++] = _backArray[tb++];
    }
  }

}
```

```
* 4-2、难点分析（递归调用流程分析）

================================
begin=0 mid=4 end=8
================================
begin=0 mid=2 end=4
================================
begin=0 mid=1 end=2
--------------------------------
mid=1 end=2
????????????????????????????????
begin=0 mid=1 end=2                           ([8]  [8,7]) —>[7,8]
--------------------------------
mid=2 end=4
================================
begin=2 mid=3 end=4
--------------------------------
mid=3 end=4
????????????????????????????????
begin=2 mid=3 end=4                         ([6]  [6,5]) —>[5,6]
????????????????????????????????
begin=0 mid=2 end=4                        ([7,8]  7,8,5,6]) —>[5,6,7,8]
--------------------------------
mid=4 end=8
================================
begin=4 mid=6 end=8
================================
begin=4 mid=5 end=6
--------------------------------
mid=5 end=6
????????????????????????????????
begin=4 mid=5 end=6                         ([4]  [4,3]) —>[3,4]
--------------------------------
mid=6 end=8
================================
begin=6 mid=7 end=8
--------------------------------
mid=7 end=8
????????????????????????????????
begin=6 mid=7 end=8                         ([2]  [2,1]) —>[1,2]
????????????????????????????????
begin=4 mid=6 end=8                        ([3,4]  [3,4,1,2]) —>[1,2,3,4]
????????????????????????????????
begin=0 mid=4 end=8                        ([5,6,7,8]   [5,6,7,8,1,2,3,4]) —>[1,2,3,4,5,6,7,8]
```

----------

#### 五、快速排序 

* 5-1、关键代码

```
void quickSort(int begin,int end,CWTimeTool *time)
{
	if (end - begin < 2) {
		return;
	}
	int pivot = pivotIndex(begin, end,time);
	quickSort(begin, pivot,time);
	quickSort(pivot + 1, end,time);
}

// 快速排序-确定轴点w元素
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
```

#### 六、希尔排序 

* 6-1、关键代码

```
// 希尔排序
void shellSort(CWTimeTool *time)
{
//	NSMutableArray *array = stepSequence();
	NSMutableArray *array = stepSequence2();
	for (int i = 0; i < array.count; i++) {
		sort([array[i] integerValue],time);
	}
	NSLog(@"asc=%d",[CWTimeTool isAscOrderArray:_sortArray]);
}
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
	return array;
}

// 希尔排序
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
```
#### 七、计数排序 

* 7-1、关键代码

```
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
```

#### 八、基数排序 

* 8-1、关键代码

```
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
```

#### 九、桶排序 

* 9-1、关键代码

```
// 桶排序(针对s容器d内的数组元素值较小)
void bucketSort()
{
	// 9-1、创建桶数组
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
	
	// 9-2、对桶内的数据进行排序
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
	// 9-3、完成排序
	NSMutableArray *results = [NSMutableArray arrayWithCapacity:length];
	for (int i = 0; i < buckets.count; i++) {
		NSMutableArray *array = buckets[i];
		for (int j = 0; j < array.count; j++) {
			[results addObject:array[j]];
		}
	}
	NSLog(@"%@",results);	
}
```



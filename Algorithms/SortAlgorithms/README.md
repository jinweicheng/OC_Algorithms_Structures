# Algorithms-and-Structures

```
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

* 一、冒泡排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/01-冒泡排序(Bubble%20Sort)>
* 二、选择排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/02-选择排序(Selection%20Sort)>
* 三、插入排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/03-插入排序(Insert%20Sort)>
* 四、归并排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/04-归并排序(Merge%20Sort)>
* 五、快速排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/04-归并排序(Merge%20Sort)>
* 六、希尔排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/04-归并排序(Merge%20Sort)>
* 七、计数排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/04-归并排序(Merge%20Sort)>
* 八、基数排序 <https://github.com/jinweicheng/OC_Algorithms_Structures/tree/master/Algorithms/SortAlgorithms/04-归并排序(Merge%20Sort)>

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

> 冒泡排序3（尾有序），优化:后面部分已经排好序，记录排好序的下标，下次循环最后位置为记录好的下标(查看详细代码)



* 1-2、测试代码

```
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
```

* 1-3、性能分析

![Image text](https://github.com/jinweicheng/OC_Algorithms_Structures/blob/master/Algorithms/SortAlgorithms/Resource/BubbleSortResult.jpg)

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

* 2-3、测试数据
```
NSMutableArray *array = [NSMutableArray array];
for (int i = 0; i < 10000; i++) {
[array addObject:[NSString stringWithFormat:@"%d",arc4random() % (10000+1)]];
}
CWTimeTool *timeblcok1 = [[CWTimeTool alloc] init];
[timeblcok1 executeTimesForFunction:^{
selectSort1(array.mutableCopy);
}];

[timeblcok1 executeTimesForFunction:^{
selectSort2(array.mutableCopy);
}];
```
* 2-4、性能分析

![Image text](https://github.com/jinweicheng/OC_Algorithms_Structures/blob/master/Algorithms/SortAlgorithms/Resource/SelectSortResult.jpg)
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
* 插入排序优化(前半部分二分查找，参考详细代码)

* 3-2、性能分析

![Image text](https://github.com/jinweicheng/OC_Algorithms_Structures/blob/master/Algorithms/SortAlgorithms/Resource/InsertSortResult.jpg)
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


* 4-3、性能分析

![Image text](https://github.com/jinweicheng/OC_Algorithms_Structures/blob/master/Algorithms/SortAlgorithms/Resource/MergeSortResult.jpg)
----------

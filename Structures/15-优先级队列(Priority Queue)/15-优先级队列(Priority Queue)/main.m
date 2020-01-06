//
//  main.m
//  15-优先级队列(Priority Queue)
//
//  Created by mac on 2019/7/5.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWPriorityQueue.h"
#import "CWPriorityQueueModel.h"
int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
		
		
		
		// 一、比较年龄字符串
		NSLog(@"--------------------一、比较年龄字符串、--------------------");
		CWPriorityQueue *queueStr = [[CWPriorityQueue alloc] init];
		queueStr.compareType = CWPriorityMaxAgeQueue;
		NSArray *datas = [NSArray arrayWithObjects:@"10",@"100",@"90",@"20",@"15",@"30",@"95",@"60",@"50",@"5",nil];
		for (int i = 0; i < datas.count; i++) {
			[queueStr enQueue:datas[i]];
		}
//		NSLog(@"%@",queueStr.arrays);
		
		// 一、比较年龄-----2、出队
//		for (int i = 0; i < datas.count; i++) {
//			[queueStr deQueue];
//			NSLog(@"%@",queueStr.arrays);
//		}
		
		
		
		// 二、比较年龄model
		NSLog(@"--------------------二、比较年龄model、--------------------");
		CWPriorityQueue *queueModel = [[CWPriorityQueue alloc] init];
		queueModel.compareType = CWPriorityMaxAgeQueue;
		NSArray *dataAge = [NSArray arrayWithObjects:@"10",@"100",@"90",@"20",@"15",@"30",@"95",@"60",@"50",@"5",nil];
		NSArray *dataName = [NSArray arrayWithObjects:@"jack",@"mark",@"make",@"que",@"cjw",@"sanshi",@"jiayou",@"yiqi",@"ceshi",@"test",nil];
		for (int i = 0; i < dataAge.count; i++) {
			
			CWPriorityQueueModel *model = [[CWPriorityQueueModel alloc] initWithName:dataName[i] age:[dataAge[i] integerValue] dateStr:@""];
			[queueModel enQueue:model];
			
		}
//		NSLog(@"%@",queueModel.arrays);
//		for (int i = 0; i < dataAge.count; i++) {
//			[queueModel deQueue];
//			NSLog(@"%@",queueModel.arrays);
//		}

		NSLog(@"--------------------三、比较添加入队时间、--------------------");
		
		
		// 三、比较添加时间早晚
		CWPriorityQueue *queueDate = [[CWPriorityQueue alloc] init];
		queueDate.compareType = CWPriorityDateQueue;
		NSArray *dataAge2 = [NSArray arrayWithObjects:@"10",@"100",@"80",@"102",@"20",@"15",nil];
		NSArray *dataName2 = [NSArray arrayWithObjects:@"jack",@"mark",@"que",@"cjw",@"sanshi",@"jiayou",nil];
		for (int i = 0; i < dataAge2.count; i++) {
			
			sleep(1.0);
			// 换算时间格式
			NSDate *date = [NSDate date];
			NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
			[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
			NSString *dateStr = [formatter stringFromDate:date];
			
			CWPriorityQueueModel *model = [[CWPriorityQueueModel alloc] initWithName:dataName2[i] age:[dataAge2[i] integerValue] dateStr:dateStr];
			[queueDate enQueue:model];
			
		}
		NSLog(@"%@",queueDate.arrays);
		for (int i = 0; i < dataAge2.count; i++) {
			[queueDate deQueue];
			NSLog(@"%@",queueDate.arrays);
		}

		
		
		
	}
	return 0;
}

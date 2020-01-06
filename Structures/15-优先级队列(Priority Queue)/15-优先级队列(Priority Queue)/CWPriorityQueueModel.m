//
//  CWPriorityQueueModel.m
//  15-优先级队列(Priority Queue)
//
//  Created by mac on 2019/7/5.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWPriorityQueueModel.h"

@implementation CWPriorityQueueModel

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age dateStr:(NSString *)dateStr
{
    if (self = [super init]) {
        self.name = name;
        self.age = age;
		self.dateStr = dateStr;
    }
    return self;
}

- (NSString *)description
{
	
    return [NSString stringWithFormat:@"%@_%ld  date:%@",self.name,self.age,self.dateStr];
}

@end

//
//  CWPriorityQueueModel.h
//  15-优先级队列(Priority Queue)
//
//  Created by mac on 2019/7/5.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWPriorityQueueModel : NSObject

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age dateStr:(NSString *)dateStr;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign)  NSInteger age;
@property (nonatomic,copy)NSString *dateStr;

@end

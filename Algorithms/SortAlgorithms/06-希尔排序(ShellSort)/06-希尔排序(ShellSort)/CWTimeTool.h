//
//  CWTimeTool.h
//  01-复杂度
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ExecuteBlock)(void);

@interface CWTimeTool : NSObject
// 1、 执行任务消耗的时间（ task consume ）
- (void)executeTimesForFunction:(ExecuteBlock)block;
@property (nonatomic,copy) ExecuteBlock block;

// 2、判断是否为降序数组
+ (BOOL)isDescOrderArray:(NSArray *)array;
// 3、判断是否为正序数组
+ (BOOL)isAscOrderArray:(NSArray *)array;
// 4、比较方法
- (BOOL)compare:(NSString *)value1 value2:(NSString *)value2;
// 5、交换次数
- (void)exchangeValue;

@end

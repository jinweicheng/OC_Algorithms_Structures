//
//  CWTimeTool.h
//  01-复杂度
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
/**< block */
typedef void(^ExecuteBlock)(void);

@interface CWTimeTool : NSObject
/**< 执行任务消耗的时间（ task consume ）*/
- (void)executeTimesForFunction:(ExecuteBlock)block;

@property (nonatomic,copy) ExecuteBlock block;

// 判断是否为降序数组
+ (BOOL)isDescOrderArray:(NSArray *)array;
// 判断是否为正序数组
+ (BOOL)isAscOrderArray:(NSArray *)array;

@end

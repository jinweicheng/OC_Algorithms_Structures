//
//  CWNumsQueue2.h
//  NumsQueue(回溯)
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWNumsQueue2 : NSObject

// 1、初始化
- (instancetype)initWithNumber:(int)number;
// 2、计算皇后总方法
- (void)placeQueues;

@end

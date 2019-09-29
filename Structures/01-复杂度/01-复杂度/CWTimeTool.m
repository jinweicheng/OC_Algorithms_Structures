//
//  CWTimeTool.m
//  01-复杂度
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWTimeTool.h"

@implementation CWTimeTool

- (void)executeTimesForFunction:(ExecuteBlock)block
{
    
    _block = block;
    if (_block) {
        // 1、开始时间
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"];
        [formatter setTimeZone:timeZone];
        NSDate *dateS = [NSDate date];
        NSString *tempS = [formatter stringFromDate:dateS];
        double timeS = (long)([dateS timeIntervalSince1970]*10000);
        
        // 2、task执行
        _block();
        
        // 3、结束时间
        NSDate *dateE = [NSDate date];
        NSString *tempE = [formatter stringFromDate:dateE];
        double timeE = (long)([dateE timeIntervalSince1970]*10000);
        
        // 4、耗时计算
        double consume = timeE - timeS;
        NSLog(@"\n       [开始:%@]\n       [结束:%@]\n       [耗时:%.2fs]\n",tempS,tempE,consume/10000);
    }
}

@end

//
//  main.m
//  06-栈
//
//  Created by 程金伟 on 2019/5/15.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWStackList.h"
int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
//        CWStackList *stack = [[CWStackList alloc] init];
//        [stack cw_push:@"1"];
//        [stack cw_push:@"2"];
//        [stack cw_push:@"3"];
//        [stack cw_push:@"4"];
//
//        while (!stack.cw_isEmpty) {
//            NSLog(@"%@",[stack cw_pop]);
//        }
//
//        [stack cw_push:@"5"];
//        [stack cw_push:@"6"];
//        [stack cw_push:@"7"];
//        [stack cw_push:@"8"];
//
//        NSLog(@"top:%@",[stack cw_top]);
        
        
        
        CWStackList *stack2 = [[CWStackList alloc] init];
//        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2",@"1",@"+",@"3",@"*", nil];
//        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2",@"4",@"-",@"3",@"*", nil];
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"10", @"6", @"9", @"3", @"+", @"-11", @"*", @"/", @"*", @"17", @"+", @"5", @"+", nil];
        for (int i = 0; i < array.count ; i++) {
            if ([array[i] isEqualToString:@"+"] || [array[i] isEqualToString:@"-"] ||
                [array[i] isEqualToString:@"*"] || [array[i] isEqualToString:@"/"]) {
                
                NSString *top1 = [stack2 cw_pop];
                NSString *top2 = [stack2 cw_pop];
                if ([array[i] isEqualToString:@"+"]) {
                    NSInteger result = [top2 integerValue] + [top1 integerValue];
                    [stack2 cw_push:[NSString stringWithFormat:@"%ld",result]];
                }else if ([array[i] isEqualToString:@"-"]){
                    NSInteger result = [top2 integerValue] - [top1 integerValue];
                    [stack2 cw_push:[NSString stringWithFormat:@"%ld",result]];
                }else if ([array[i] isEqualToString:@"*"]){
                    NSInteger result = [top2 integerValue] * [top1 integerValue];
                    [stack2 cw_push:[NSString stringWithFormat:@"%ld",result]];
                }else if ([array[i] isEqualToString:@"/"]){
                    NSInteger result = [top2 integerValue] / [top1 integerValue];
                    [stack2 cw_push:[NSString stringWithFormat:@"%ld",result]];
                }
            }else{
                [stack2 cw_push:array[i]];
            }
        }
        NSLog(@"result=%@",[stack2 cw_pop]);
	}
	return 0;
}

//
//  main.m
//  DivideConquer(分治)
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWDivideConquer.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // -2、1、-3、4、-1、2、1、-5、4
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"-2",@"1",@"-3",@"4",@"-1",@"2",@"1",@"-5",@"4", nil];
        CWDivideConquer *divide = [[CWDivideConquer alloc] init];
        [divide maxSubString1:array.copy];
        [divide maxSubString2:array.copy];
        [divide maxSubStrForDivideConquer:array.copy];
        // NSLog(@"%@",results);
    }
    return 0;
}

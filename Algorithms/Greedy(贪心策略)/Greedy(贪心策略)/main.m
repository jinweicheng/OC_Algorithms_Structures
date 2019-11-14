//
//  main.m
//  Greedy(贪心策略)
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWGreedy.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CWGreedy *greedy = [[CWGreedy alloc] init];
//        [greedy greedyMethod:41];
//        [greedy greedyMethod:26];
//        [greedy greedyMethod:81];
        
        // 2、找零钱：此时的方案，并不一定是最优解（2*20+1*1）
//        [greedy greedyMethod2:41];
		
		
		// 3、背包问题
        [greedy greedyMethod3:@"以价格为主导"];
        [greedy greedyMethod3:@"以体重为主导"];
		[greedy greedyMethod3:@"以价格密度为主导"];
    }
    return 0;
}

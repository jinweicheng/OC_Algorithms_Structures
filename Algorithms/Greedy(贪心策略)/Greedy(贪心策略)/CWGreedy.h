//
//  CWGreedy.h
//  Greedy(贪心策略)
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWGreedy : NSObject
// 贪心应用1需求：硬币25、10、5、1，总共需要找41、81，总共需要找最少的硬币的方案
- (void)greedyMethod:(int)sum;

// 贪心应用2需求：硬币25、20、5、1，总共需要找41、81，总共需要找最少的硬币的方案
- (void)greedyMethod2:(int)sum;

// 贪心应用3需求：背包0-1问题
- (void)greedyMethod3:(NSString *)title;

@end


@interface CWBackpack:NSObject

@property(nonatomic,assign)CGFloat weight;
@property(nonatomic,assign)CGFloat price;
@property(nonatomic,assign)CGFloat priceDensity;
// 初始化
- (instancetype)initWithWeight:(CGFloat)weight price:(CGFloat)price;
@end

//
//  CWGreedy.m
//  Greedy(贪心策略)
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWGreedy.h"

@interface CWGreedy(){
    NSMutableArray *_coins;
}
@end

@implementation CWGreedy


#pragma mark - init

- (instancetype)init
{
    if (self = [super init]) {
        _coins = [NSMutableArray arrayWithObjects:@"25",@"10",@"5",@"1", nil];
    }
    return self;
}


#pragma mark -贪心应用1

- (void)greedyMethod:(int)sum{
    
    for (int i = 0; i < _coins.count; i++) {
        int value =  [_coins[i] intValue];
        if (sum >= value) {
            sum -= [_coins[i] intValue];
            NSLog(@"%@", _coins[i]);
        }
        if (sum > value) {
            i--;
        }
    }
}


#pragma mark -贪心应用2:找零钱

- (void)greedyMethod2:(int)sum{
    
    NSArray *array = [NSArray arrayWithObjects:@"25",@"20",@"5",@"1", nil];
    for (int i = 0; i < array.count; i++) {
        int value =  [array[i] intValue];
        if (sum >= value) {
            sum -= [array[i] intValue];
            NSLog(@"%@", array[i]);
        }
        if (sum > value) {
            i--;
        }
    }
}


#pragma mark -贪心应用3:背包问题

- (void)greedyMethod3:(NSString *)title{
	
    NSLog(@"====================%@====================",title);
	// 3-1、初始化数组并排序
	NSMutableArray <CWBackpack *>*array = [NSMutableArray array];
	CWBackpack *item1 = [[CWBackpack alloc] initWithWeight:35 price:10];
	CWBackpack *item2 = [[CWBackpack alloc] initWithWeight:30 price:40];
	CWBackpack *item3 = [[CWBackpack alloc] initWithWeight:60 price:30];
	CWBackpack *item4 = [[CWBackpack alloc] initWithWeight:50 price:50];
	CWBackpack *item5 = [[CWBackpack alloc] initWithWeight:40 price:35];
	CWBackpack *item6 = [[CWBackpack alloc] initWithWeight:10 price:40];
	CWBackpack *item7 = [[CWBackpack alloc] initWithWeight:25 price:30];
	[array addObject:item1];
	[array addObject:item2];
	[array addObject:item3];
	[array addObject:item4];
	[array addObject:item5];
	[array addObject:item6];
	[array addObject:item7];
	
	NSArray <CWBackpack *>*sortArray = [array sortedArrayUsingComparator:^NSComparisonResult(CWBackpack *obj1, CWBackpack *obj2) {
		if ([title containsString:@"以体重为主导"]) {
			return [@(obj1.weight) compare:@(obj2.weight)];
		}else if ([title containsString:@"以价格为主导"]){
			return [@(obj2.price) compare:@(obj1.price)];
		}else if ([title containsString:@"以价格密度为主导"]){
			return [@(obj2.priceDensity) compare:@(obj1.priceDensity)];
		}
		return [@(obj2.priceDensity) compare:@(obj1.priceDensity)];
	}];
	
	
	// 3-2、求解
    NSMutableArray *result = [NSMutableArray array];
	CGFloat sumPrice = 0.0,sumWeight = 150.0,backPackW = 0.0;
    for (int i = 0; i < sortArray.count; i++) {
        CWBackpack *item = sortArray[i];
        if (sumWeight >= item.weight) {
            sumWeight -= item.weight;
			sumPrice += item.price;
            backPackW += item.weight;
            [result addObject:item];
            NSLog(@"重量:%.2f--价格:%.2f--价格密度:%.2f",item.weight,item.price,item.priceDensity);
        }
        
    }
    NSLog(@"总价格:%.2f  --  总重量:%2f",sumPrice,backPackW);
}

@end



@implementation CWBackpack

- (instancetype)initWithWeight:(CGFloat)weight price:(CGFloat)price
{
	if (self  = [super init]) {
		self.weight = weight;
		self.price = price;
		self.priceDensity = price / weight;
	}
	return self;
}

@end

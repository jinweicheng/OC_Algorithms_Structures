//
//  CWRecursive.h
//  Recursive
//
//  Created by 程金伟 on 2019/11/7.
//  Copyright © 2019 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CWRecursive : NSObject

// 1、上楼梯
- (int)climbStair:(int)num;

- (int)good_climbStair:(int)num;


// 2、汉诺塔
- (void)hanoi:(int)num A:(NSString *)A B:(NSString *)B C:(NSString *)C;

@end

NS_ASSUME_NONNULL_END

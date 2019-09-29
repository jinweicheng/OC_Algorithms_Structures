//
//  CWHashMapCompare.m
//  13-哈希值(hash)
//
//  Created by mac on 2019/6/12.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import "CWHashMapCompare.h"
#import "CWHashMapModel.h"

@implementation CWHashMapCompare

/**< 1、比较方法 */
- (int)compareValue:(id)oldN oldValue:(id)newN
{
    // 1、具备可比较行
    if ([oldN isKindOfClass:[CWHashMapModel class]]) {
        CWHashMapModel *oldC = oldN;
        CWHashMapModel *newC = newN;
        return (int)(oldC.hashV - newC.hashV);
    }
    // 2、NSString
    else if ([oldN isKindOfClass:[NSString class]])
    {
        NSString *oldValue = oldN;
        NSString *newValue = newN;
        return [newValue compare:oldValue];
    }else{
        return (int)newN - (int)oldN;
    }
}


@end

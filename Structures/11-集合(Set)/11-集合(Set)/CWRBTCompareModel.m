//
//  CWRBTCompareModel.m
//  10-RBT红黑树(RedBlackTree)
//
//  Created by mac on 2019/6/3.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWRBTCompareModel.h"

@implementation CWRBTCompareModel

- (int)compareValue:(id)pareterNode oldValue:(id)newNode
{
    // 1、具备可比较行
    if ([pareterNode isKindOfClass:[CWRBTCompareModel class]]) {
        CWRBTCompareModel *parCompare = pareterNode;
        CWRBTCompareModel *newCompare = newNode;
        return newCompare.age - parCompare.age;
    }
    
    // 2、NSString
    else if ([pareterNode isKindOfClass:[NSString class]])
    {
        NSString *pareterValue = pareterNode;
        NSString *newValue = newNode;
        //NSLog(@"new:%d,prareter:%d,value:%d",newValue.intValue,pareterValue.intValue,newValue.intValue-pareterValue.intValue);
        return newValue.intValue - pareterValue.intValue;
    }else{
        return (int)newNode - (int)pareterNode;
    }
    
}


@end

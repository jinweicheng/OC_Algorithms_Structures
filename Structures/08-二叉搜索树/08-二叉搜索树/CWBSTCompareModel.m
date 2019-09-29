//
//  CWBSTCompareModel.m
//  08-二叉搜索树
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWBSTCompareModel.h"

@implementation CWBSTCompareModel

- (int)compareValue:(id)pareterNode oldValue:(id)newNode
{
    // 1、具备可比较行
    if ([pareterNode isKindOfClass:[CWBSTCompareModel class]]) {
        CWBSTCompareModel *parCompare = pareterNode;
        CWBSTCompareModel *newCompare = newNode;
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

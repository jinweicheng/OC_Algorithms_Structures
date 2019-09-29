//
//  CWAVLCompareModel.m
//  09-AVL平衡树
//
//  Created by mac on 2019/5/30.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWAVLCompareModel.h"

@implementation CWAVLCompareModel

- (int)compareValue:(id)pareterNode oldValue:(id)newNode
{
    // 1、具备可比较行
    if ([pareterNode isKindOfClass:[CWAVLCompareModel class]]) {
        CWAVLCompareModel *parCompare = pareterNode;
        CWAVLCompareModel *newCompare = newNode;
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

//
//  CWRBTreeCompare.m
//  12-映射(Map)
//
//  Created by 程金伟 on 2019/6/7.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import "CWRBTreeCompare.h"

@implementation CWRBTreeCompare

- (int)compareValue:(id)oldN oldValue:(id)newN
{
	// 1、具备可比较行
	if ([oldN isKindOfClass:[CWRBTreeCompare class]]) {
		CWRBTreeCompare *oldC = oldN;
		CWRBTreeCompare *newC = newN;
		return oldC.age - newC.age;
	}
	
	// 2、NSString
	else if ([oldN isKindOfClass:[NSString class]])
	{
		NSString *oldValue = oldN;
		NSString *newValue = newN;
		return [newValue compare:oldValue];
		//return newValue.intValue - oldValue.intValue;
	}else{
		return (int)newN - (int)oldN;
	}
	
}

@end

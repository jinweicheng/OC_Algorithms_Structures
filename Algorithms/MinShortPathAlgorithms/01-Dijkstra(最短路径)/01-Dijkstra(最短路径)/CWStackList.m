//
//  CWStackList.m
//  06-栈
//
//  Created by 程金伟 on 2019/5/15.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import "CWStackList.h"

@interface CWStackList()
@property (nonatomic,strong)  NSMutableArray *array; /**< 数组 */
@end

@implementation CWStackList

- (instancetype)init{
	if (self = [super init]) {
		self.array = [NSMutableArray array];
		self.size = 0;
	}
	return self;
}

/**
 1、数组的大小
 */
- (int)cw_size
{
	return  self.size;
}

/**
 2、数组是否为空
 */
- (BOOL)cw_isEmpty
{
	return self.size == 0;
}

/**
 3、新增某元素
 */
- (void)cw_push:(id)E
{
	[self.array addObject:E];
	self.size++;
}

/**
 4、新增某元素
 */
- (id)cw_pop
{
	id object = self.array[self.size-1];
	[self.array removeObjectAtIndex:self.size-1];
	self.size--;
	return object;
}

/**
 5、新增某元素
 */
- (id)cw_top
{
	id object = self.array[self.size-1];
	return object;
}


@end

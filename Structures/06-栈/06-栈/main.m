//
//  main.m
//  06-栈
//
//  Created by 程金伟 on 2019/5/15.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWStackList.h"
int main(int argc, const char * argv[]) {
	@autoreleasepool {

	    NSLog(@"Hello, World!");
		
		CWStackList *stack = [[CWStackList alloc] init];
		[stack cw_push:@"1"];
		[stack cw_push:@"2"];
		[stack cw_push:@"3"];
		[stack cw_push:@"4"];
		
		while (!stack.cw_isEmpty) {
			NSLog(@"%@",[stack cw_pop]);
		}
		
		[stack cw_push:@"5"];
		[stack cw_push:@"6"];
		[stack cw_push:@"7"];
		[stack cw_push:@"8"];
		
		NSLog(@"top:%@",[stack cw_top]);
	}
	return 0;
}

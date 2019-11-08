//
//  main.m
//  Recursive
//
//  Created by 程金伟 on 2019/11/7.
//  Copyright © 2019 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWRecursive.h"
int main(int argc, const char * argv[]) {
	@autoreleasepool {
		CWRecursive *recursive = [[CWRecursive alloc] init];
		
		NSLog(@"%d-%d",[recursive climbStair:4],[recursive good_climbStair:4]);
	}
	return 0;
}

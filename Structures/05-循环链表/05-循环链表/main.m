//
//  main.m
//  05-循环链表
//
//  Created by mac on 2019/5/13.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWSingleCycleNode.h"
#import "CWDoubleCycleNode.h"

void single()
{
	// SingleCycleNode  1、add
	CWSingleCycleNode *node = [[CWSingleCycleNode alloc] init];
	for (int i = 1; i < 10; i++) {
		[node cw_addE:[NSString stringWithFormat:@"%d",i]];
	}
	// 1、2、3、4、5、6、7、8、9
	NSLog(@"%@",node);
	
	[node cw_addE:@"0" index:0];
	NSLog(@"%@",node);
	[node cw_addE:@"10"];
	NSLog(@"%@",node);
	
	
	// SingleCycleNode  2、remove
	[node cw_removeIndex:0];
	// 1、2、3、4、5、6、7、8、9、10
	NSLog(@"%@",node);
	
	[node cw_removeIndex:7];
	// 1、2、3、4、5、6、7、8、9、10
	NSLog(@"%@",node);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
		
		// SingleCycleNode  1、add
		CWDoubleCycleNode *node = [[CWDoubleCycleNode alloc] init];
		for (int i = 1; i < 10; i++) {
			[node cw_addE:[NSString stringWithFormat:@"%d",i]];
		}
		// 1、2、3、4、5、6、7、8、9
		NSLog(@"%@",node);
		
		[node cw_addE:@"10"];
		[node cw_addE:@"5555" index:5];
		[node cw_addE:@"0" index:0];
		NSLog(@"%@",node);
		
		
		// remove
		[node cw_removeE:@"0"];
		NSLog(@"%@",node);
		[node cw_removeIndex:10];
		[node cw_removeE:@"5555"];
		NSLog(@"%@",node);
		
    }
    return 0;
}

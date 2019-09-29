//
//  main.m
//  12-映射(Map)
//
//  Created by 程金伟 on 2019/6/7.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWRBTreeMap.h"
#import "MJBinaryTrees.h"
int main(int argc, const char * argv[]) {
	@autoreleasepool {

		CWRBTreeMap *map = [[CWRBTreeMap alloc] init];
//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"a",@"b",@"c",nil];
//		for (int i = 0; i < array.count; i ++) {
//			[map cw_addE:array[i]];
//		}
		
		[map cw_addNodeWithKey:@"a" value:@"18"];
		[map cw_addNodeWithKey:@"b" value:@"28"];
		[map cw_addNodeWithKey:@"c" value:@"32"];
		[map cw_addNodeWithKey:@"c" value:@"80"];
		
		[MJBinaryTrees println:map];
		
		//[map cw_traversal:map];
		
		//CWRBTreeMap *one = [[CWRBTreeMap alloc] init];
		NSLog(@"contain:%d",[map isContainValue:@"80"]);
		
		CWRBTreeMap *two = [map getNodeWithKey:@"a"];
		

	}
	return 0;
}

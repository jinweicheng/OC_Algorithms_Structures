//
//  main.m
//  10-RBT红黑树(RedBlackTree)
//
//  Created by mac on 2019/6/3.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJBinaryTrees.h"
#import "CWRBTree.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
//        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"age", @"ward", @"car",nil];
//        CWRBTree *rb = [[CWRBTree alloc] init];
//        for (int i = 0; i < array.count; i ++) {
//            [rb cw_addE:array[i]];
//            [MJBinaryTrees println:rb];
//            NSLog(@"------------------");
//        }
		
        
        CWRBTree *rb2 = [[CWRBTree alloc] init];
        for (int i = 0; i < 10; i ++) {
            [rb2 cw_addE:[NSString stringWithFormat:@"a%d",i+1]];
            [MJBinaryTrees println:rb2];
            NSLog(@"------------------");
        }
//        [MJBinaryTrees println:rb2];
//        NSLog(@"------------------");
//
//        [rb2 cw_removeE:@"29"];
//        [MJBinaryTrees println:rb2];
//        NSLog(@"------------------");
		
        

        
    }
    return 0;
}

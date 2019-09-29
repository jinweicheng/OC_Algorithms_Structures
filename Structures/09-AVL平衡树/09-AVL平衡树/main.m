//
//  main.m
//  09-AVL平衡树
//
//  Created by mac on 2019/5/30.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWAVLBalanceTree.h"
#import "MJBinaryTrees.h"


void test ()
{
    // 1、二叉树节点
    //        CWAVLBalanceTree *tree = [[CWAVLBalanceTree alloc] init];
    //        NSArray *array = [[NSArray alloc] initWithObjects:@"5",@"3",@"8",@"1",@"4",@"6",@"9",@"2",@"7",nil];
    //        for (int i = 0; i < array.count; i ++) {
    //            [tree cw_addE:array[i]];
    //        }
    //
    //        [MJBinaryTrees println:tree];
    
    
    CWAVLBalanceTree *tree = [[CWAVLBalanceTree alloc] init];
    //NSArray *array = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",nil];
    //NSArray *array = [[NSArray alloc] initWithObjects:@"10",@"9",@"8",@"7",@"6",nil];
    NSArray *array = [[NSArray alloc] initWithObjects:@"13",@"14",@"15",@"12",@"11",@"17",@"16",@"8",@"9",@"1",nil];
    for (int i = 0; i < array.count; i ++) {
        [tree cw_addE:array[i]];
        //[MJBinaryTrees println:tree];
        //NSLog(@"-----------------------");
    }
    [MJBinaryTrees println:tree];
    NSLog(@"-----------------------");
    
    [tree cw_removeE:@"14"];
    [MJBinaryTrees println:tree];
    NSLog(@"-----------------------");
    
    
    [tree cw_removeE:@"8"];
    [MJBinaryTrees println:tree];
    NSLog(@"-----------------------");
    
    [tree cw_removeE:@"1"];
    [MJBinaryTrees println:tree];
    NSLog(@"-----------------------");
    
    [tree cw_removeE:@"16"];
    [MJBinaryTrees println:tree];
    NSLog(@"-----------------------");
    
    [tree cw_removeBST:tree.root.left];
    [MJBinaryTrees println:tree];
    NSLog(@"-----------------------");
    
    
    [tree cw_removeBST:tree.root.left.right];
    [MJBinaryTrees println:tree];
    NSLog(@"-----------------------");
    
    [tree cw_removeBST:tree.root.right.right];
    [MJBinaryTrees println:tree];
    NSLog(@"-----------------------");
    
    [tree cw_removeE:@"13"];
    [MJBinaryTrees println:tree];
    NSLog(@"-----------------------");
    
    [tree cw_removeBST:tree.root];
    [MJBinaryTrees println:tree];
    NSLog(@"-----------------------");
    
    [tree cw_removeE:@"15"];
    NSLog(@"-----------------------%@",tree.root);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        CWAVLBalanceTree *tree = [[CWAVLBalanceTree alloc] init];
        NSArray *array = [[NSArray alloc] initWithObjects:@"13",@"10",@"8",@"7",@"6",@"5",@"4",@"3",@"2",@"1",nil];
        for (int i = 0; i < array.count; i ++) {
            [tree cw_addE:array[i]];
            [MJBinaryTrees println:tree];
            NSLog(@"-----------------------");
        }
//        for (int i = 0; i < 10; i ++) {
//            [tree cw_addE:[NSString stringWithFormat:@"%d",i+1]];
//            [MJBinaryTrees println:tree];
//            NSLog(@"-----------------------");
//        }
        
        
//        [MJBinaryTrees println:tree];
//        NSLog(@"-----------------------");
//        [tree cw_removeE:@"10"];
//        [MJBinaryTrees println:tree];
//        NSLog(@"-----------------------");
//        
//        [tree cw_removeE:@"3"];
//        [MJBinaryTrees println:tree];
//        NSLog(@"-----------------------");
        
    }
    return 0;
}

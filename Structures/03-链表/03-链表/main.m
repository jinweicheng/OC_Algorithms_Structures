//
//  main.m
//  03-链表
//
//  Created by mac on 2019/5/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWListNode.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 1、反转node
        CWListNode *node = [[CWListNode alloc] init];
        [node cw_addE:@"1"];
        [node cw_addE:@"2"];
        [node cw_addE:@"3"];
        [node cw_addE:@"4"];
        [node cw_addE:@"5"];
        [node cw_addE:@"8" index:2];
        NSLog(@"%@",node);
        
        NSLog(@"%@",[node cw_reverseListNode:node]);
        
        
    }
    return 0;
}



// 链表设置
void listNode()
{
    CWListNode *node = [[CWListNode alloc] init];
    // 1、新增node
    [node cw_addE:@"1"];
    [node cw_addE:@"2"];
    [node cw_addE:@"3"];
    [node cw_addE:@"4"];
    [node cw_addE:@"5"];
    [node cw_addE:@"8" index:2];
    NSLog(@"%@",node);
    
    
    //        NSLog(@"%d",[node cw_indexOf:@"5"]);
    //        NSLog(@"%d",[node cw_isContainE:@"5"]);
    //        NSLog(@"%@",[node cw_getIndex:0]);
    
    NSLog(@"------------------------------------");
    
    
    // 2、删除node
    [node cw_removeE:@"1"];
    [node cw_removeE:@"2"];
    NSLog(@"%@",node);
    //        [node cw_removeE:@"3"];
    //        [node cw_removeE:@"4"];
    //        [node cw_removeE:@"5"];
    [node cw_removeIndex:0];
    [node cw_removeIndex:2];
    NSLog(@"%@",node);
}

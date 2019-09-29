//
//  main.m
//  04-双向链表
//
//  Created by 程金伟 on 2019/5/12.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWListNode.h"


// 1、添加add
void add (){
    
    CWListNode *node = [[CWListNode alloc] init];
    for (int i = 0; i < 6; i ++) {
        [node cw_addE:[NSString stringWithFormat:@"%d",i]];
    }
    // 0、1、2、3、4、5、6
    [node cw_addE:@"6"];
    NSLog(@"%@",node);
    // 0、1、2、8、3、4、5、6
    [node cw_addE:@"8" index:2];
    NSLog(@"%@",node);
    // 10、0、1、2、8、3、4、5、6
    [node cw_addE:@"10" index:0];
    NSLog(@"%@",node);
    // 10、0、1、2、8、3、4、5、6、20
    [node cw_addE:@"20" index:9];
    NSLog(@"%@",node);
}

// 2、delect
void delect(){
    
    //        CWListNode *node = [[CWListNode alloc] init];
    //        for (int i = 0; i < 6; i ++) {
    //            [node cw_addE:[NSString stringWithFormat:@"%d",i]];
    //        }
    //        // 0、1、2、3、4、5
    //        NSLog(@"%@",node);
    //        // 1、2、3、4、5
    //        [node cw_removeIndex:0];
    //        NSLog(@"%@",node);
    //        // 1、2、3、4
    //        [node cw_removeIndex:4];
    //        NSLog(@"%@",node);
    //
    //        [node cw_removeIndex:3];
    //        [node cw_removeIndex:2];
    //        [node cw_removeIndex:1];
    //        // 1
    //        NSLog(@"%@",node);
    //        [node cw_removeIndex:0];
    //        // 1
    //        NSLog(@"%@",node);
    
    
    
    CWListNode *node = [[CWListNode alloc] init];
    for (int i = 0; i < 6; i ++) {
        [node cw_addE:[NSString stringWithFormat:@"%d",i]];
    }
    // 0、1、2、3、4、5
    NSLog(@"%@",node);
    // 0、1、2、3、4、5
    [node cw_removeE:@"0"];
    [node cw_removeE:@"5"];
    // 1、2、3、4
    NSLog(@"%@",node);
    
    // 1、2、3、4
    [node cw_removeE:@"1"];
    [node cw_removeE:@"4"];
    [node cw_removeE:@"2"];
    [node cw_removeE:@"3"];
    // 【】
    NSLog(@"%@",node);
}


int main(int argc, const char * argv[]) {
	@autoreleasepool {

        // 1、add
        //add();
        
        // 2、remove
        //delect();
        
	}
	return 0;
}



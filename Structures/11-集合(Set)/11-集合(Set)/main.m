//
//  main.m
//  11-集合(Set)
//
//  Created by mac on 2019/6/6.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWRBSet.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        // 集合：去除重复数据
        
        CWRBSet *set = [[CWRBSet alloc] init];
        for (int i = 0; i < 10; i ++) {
            [set cw_addE:[NSString stringWithFormat:@"%d",i+1]];
        }
        
        for (int i = 0; i < 10; i ++) {
            [set cw_addE:[NSString stringWithFormat:@"%d",i+1]];
        }
        
        [set cw_traversal:set];
    }
    return 0;
}

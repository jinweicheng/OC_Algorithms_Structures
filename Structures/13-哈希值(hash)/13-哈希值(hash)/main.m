//
//  main.m
//  13-哈希值(hash)
//
//  Created by 程金伟 on 2019/6/9.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWHashMapModel.h"
#import "CWHashMap.h"
int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
        CWHashMapModel *hash1 = [[CWHashMapModel alloc] initWithAge:10 height:20.0 name:@"one"];
        CWHashMapModel *hash2 = [[CWHashMapModel alloc] initWithAge:30 height:30.0 name:@"two"];
        CWHashMapModel *hash3 = [[CWHashMapModel alloc] initWithAge:40 height:40.0 name:@"three"];
        CWHashMapModel *hash4 = [[CWHashMapModel alloc] initWithAge:40 height:40.0 name:@"four"];
        CWHashMapModel *hash5 = [[CWHashMapModel alloc] initWithAge:50 height:40.0 name:@"five"];
        CWHashMapModel *hash6 = [[CWHashMapModel alloc] initWithAge:60 height:40.0 name:@"six"];
		CWHashMapModel *hash7 = [[CWHashMapModel alloc] initWithAge:70 height:20.0 name:@"seven"];
		CWHashMapModel *hash8 = [[CWHashMapModel alloc] initWithAge:80 height:30.0 name:@"eight"];
		CWHashMapModel *hash9 = [[CWHashMapModel alloc] initWithAge:90 height:40.0 name:@"nine"];
		CWHashMapModel *hash10 = [[CWHashMapModel alloc] initWithAge:100 height:40.0 name:@"ten"];
		CWHashMapModel *hash11 = [[CWHashMapModel alloc] initWithAge:110 height:40.0 name:@"eleven"];
		CWHashMapModel *hash12 = [[CWHashMapModel alloc] initWithAge:120 height:40.0 name:@"twelve"];
        

        
        CWHashMap *hashM = [[CWHashMap alloc] init];
        [hashM cw_addNodeWithKey:@"1" value:hash1];
        [hashM cw_addNodeWithKey:@"2" value:hash2];
        [hashM cw_addNodeWithKey:@"3" value:hash3];
        [hashM cw_addNodeWithKey:@"4" value:hash4];
        [hashM cw_addNodeWithKey:@"5" value:hash5];
        [hashM cw_addNodeWithKey:@"6" value:hash6];
        [hashM cw_addNodeWithKey:@"7" value:hash7];
        [hashM cw_addNodeWithKey:@"8" value:hash8];
        [hashM cw_addNodeWithKey:@"9" value:hash9];
        [hashM cw_addNodeWithKey:@"10" value:hash10];
        [hashM cw_addNodeWithKey:@"11" value:hash11];
        [hashM cw_addNodeWithKey:@"12" value:hash12];
        [hashM cw_addNodeWithKey:@"13" value:@"ceshi1"];
        [hashM cw_addNodeWithKey:@"14" value:@"ceshi2"];
        [hashM traversal];
        [hashM getNodeWithKey:@"12"];
        NSLog(@"contain:%d",[hashM isContainValue:@"20" key:@"20"]);
        NSLog(@"contain:%d",[hashM isContainValue:hash5 key:@"5"]);
        NSLog(@"contain:%d",[hashM isContainValue:@"ceshi1" key:@"13"]);
        
        
        [hashM cw_removeForKey:@"1"];
        [hashM cw_removeForKey:@"11"];
        NSLog(@"------------------------------");
        [hashM traversal];
        
        
        
//        CWHashMap *hashM2 = [[CWHashMap alloc] init];
//        [hashM2 cw_addNodeWithKey:hash1 value:@"1"];
//        [hashM2 cw_addNodeWithKey:hash2 value:@"2"];
//        [hashM2 cw_addNodeWithKey:hash3 value:@"3"];
//        [hashM2 cw_addNodeWithKey:hash4 value:@"4"];
//        [hashM2 cw_addNodeWithKey:hash5 value:@"5"];
//        [hashM2 cw_addNodeWithKey:hash6 value:@"6"];
//        [hashM2 cw_addNodeWithKey:hash7 value:@"7"];
//        [hashM2 cw_addNodeWithKey:hash8 value:@"8"];
//        [hashM2 cw_addNodeWithKey:hash9 value:@"9"];
//        [hashM2 cw_addNodeWithKey:hash10 value:@"10"];
//        [hashM2 cw_addNodeWithKey:hash11 value:@"11"];
//        [hashM2 cw_addNodeWithKey:hash12 value:@"12"];
//        [hashM2 cw_addNodeWithKey:@"ceshi1" value:@"13"];
//        [hashM2 cw_addNodeWithKey:@"ceshi2" value:@"14"];
//        [hashM2 traversal];
        
        //[hashM getNodeWithKey:@"8"];
        
        
        
	}
	return 0;
}

//
//  main.m
//  17-并查集(UnionFind)
//
//  Created by mac on 2019/10/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWUnionFindSet.h"
#import "CWGoodUnionFind.h"
#import "CWTimeTool.h"


void test()
{
	// 1、合并所属集合
	//        CWUnionFindSet *unionSet = [[CWUnionFindSet alloc] initWithSetCount:5];
	//        NSLog(@"%@",unionSet);
	//
	//        [unionSet unionSet:0 value2:2];
	//        NSLog(@"%@",unionSet);
	//
	//        [unionSet unionSet:3 value2:2];
	//        NSLog(@"%@",unionSet);
	//
	//        [unionSet unionSet:4 value2:2];
	//        NSLog(@"%@",unionSet);
	//
	//        [unionSet unionSet:1 value2:2];
	//        NSLog(@"%@",unionSet);
			
			
			// 2、合并所属集合
			// 0-->0,1-->1,2-->2,3-->3,4-->4,
			CWUnionFindSet *unionSet2 = [[CWUnionFindSet alloc] initWithSetCount:5];
			NSLog(@"%@",unionSet2);
			// 0-->2,1-->1,2-->2,3-->3,4-->4,
			[unionSet2 unionSet:0 value2:2];
			NSLog(@"%@",unionSet2);
			// 0-->2,1-->1,2-->2,3-->2,4-->4,
			[unionSet2 unionSet:3 value2:2];
			NSLog(@"%@",unionSet2);
			// 0-->2,1-->1,2-->2,3-->2,4-->2,
			[unionSet2 unionSet:4 value2:2];
			NSLog(@"%@",unionSet2);
			// 0-->2,1-->2,2-->2,3-->2,4-->2,
			[unionSet2 unionSet:1 value2:2];
			NSLog(@"%@",unionSet2);
}

void test1()
{
    NSLog(@"----------------1、并查集普通方法----------------");
    int count = 5;
    // 0-0 1-1 2-2 3-3 4-4
    CWUnionFindSet *unionSet1 = [[CWUnionFindSet alloc] initWithSetCount:count];
    [unionSet1 unionSet:1 value2:0];
    // 0-0 1-0 2-2 3-3 4-4
    NSLog(@"unionSet1=%@",unionSet1);
    [unionSet1 unionSet:1 value2:2];
    // 0-2 1-2 2-2 3-3 4-4
    NSLog(@"unionSet1=%@",unionSet1);
    [unionSet1 unionSet:3 value2:4];
    // 0-2 1-2 2-2 3-4 4-4
    NSLog(@"unionSet1=%@",unionSet1);
    [unionSet1 unionSet:0 value2:3];
    // 0-4 1-4 2-4 3-4 4-4
    NSLog(@"unionSet1=%@",unionSet1);
}

void test2()
{
    NSLog(@"----------------2、并查集快速方法----------------");
    int count = 5;
    // 0-0 1-1 2-2 3-3 4-4
    CWUnionFindSet *unionSet2 = [[CWUnionFindSet alloc] initWithSetCount:count];
    [unionSet2 unionSet2:1 value2:0];
    // 0-0 1-0 2-2 3-3 4-4
    NSLog(@"unionSet2=%@",unionSet2);
    [unionSet2 unionSet2:1 value2:2];
    // 0-2 1-0 2-2 3-3 4-4
    NSLog(@"unionSet2=%@",unionSet2);
    [unionSet2 unionSet2:3 value2:4];
    // 0-2 1-0 2-2 3-4 4-4
    NSLog(@"unionSet2=%@",unionSet2);
    [unionSet2 unionSet2:3 value2:1];
    // 0-2 1-0 2-2 3-4 4-2
    NSLog(@"unionSet2=%@",unionSet2);
}


void test3()
{
    NSLog(@"----------------3、并查集（基于size优化）方法----------------");
    int count = 5;
    // 0-0 1-1 2-2 3-3 4-4
    CWUnionFindSet *unionSet3 = [[CWUnionFindSet alloc] initWithSetCount:count];
    [unionSet3 unionSet3:1 value2:0];
    // 0-0 1-0 2-2 3-3 4-4
    NSLog(@"unionSet3=%@",unionSet3);
    [unionSet3 unionSet3:1 value2:2];
    // 0-2 1-0 2-0 3-3 4-4
    NSLog(@"unionSet3=%@",unionSet3);
    [unionSet3 unionSet3:3 value2:4];
    // 0-2 1-0 2-2 3-4 4-4
    NSLog(@"unionSet3=%@",unionSet3);
    [unionSet3 unionSet3:1 value2:3];
    // 0-2 1-0 2-2 3-4 4-0
    NSLog(@"unionSet3=%@",unionSet3);
}

void test4()
{
    NSLog(@"----------------4、并查集（基于rank优化）方法----------------");
    int count = 6;
    // 0-0 1-1 2-2 3-3 4-4 5-5
    CWUnionFindSet *unionSet4 = [[CWUnionFindSet alloc] initWithSetCount:count];
    [unionSet4 unionSet4:1 value2:0];
    // 0-0 1-0 2-2 3-3 4-4 5-5
    NSLog(@"unionSet4=%@",unionSet4);
    
    [unionSet4 unionSet4:1 value2:2];
    // 0-0 1-0 2-0 3-3 4-4 5-5
    NSLog(@"unionSet4=%@",unionSet4);
    
    [unionSet4 unionSet4:3 value2:4];
    // 0-0 1-0 2-0 3-4 4-4 5-5
    NSLog(@"unionSet4=%@",unionSet4);
    
    [unionSet4 unionSet4:4 value2:5];
    // 0-0 1-0 2-0 3-4 4-4 5-4
    NSLog(@"unionSet4=%@",unionSet4);
    
    [unionSet4 unionSet4:3 value2:1];
    // 0-0 1-0 2-0 3-4 4-0 5-4
    NSLog(@"unionSet4=%@",unionSet4);
}

void test5()
{
    NSLog(@"----------------5、并查集（压缩路径）方法----------------");
    int count = 6;
    // 0-0 1-1 2-2 3-3 4-4 5-5
    CWUnionFindSet *unionSet5 = [[CWUnionFindSet alloc] initWithSetCount:count];
    [unionSet5 unionSet5:1 value2:0];
    // 0-0 1-0 2-2 3-3 4-4 5-5
    NSLog(@"unionSet5=%@",unionSet5);
    
    [unionSet5 unionSet5:1 value2:2];
    // 0-0 1-0 2-0 3-3 4-4 5-5
    NSLog(@"unionSet5=%@",unionSet5);
    
    [unionSet5 unionSet5:3 value2:4];
    // 0-0 1-0 2-0 3-4 4-4 5-5
    NSLog(@"unionSet5=%@",unionSet5);
    
    [unionSet5 unionSet5:4 value2:5];
    // 0-0 1-0 2-0 3-4 4-4 5-4
    NSLog(@"unionSet5=%@",unionSet5);
    
    [unionSet5 unionSet5:3 value2:1];
    // 0-0 1-0 2-0 3-4 4-0 5-4
    NSLog(@"unionSet5=%@",unionSet5);
}

void test6()
{
    NSLog(@"----------------6、并查集（路径分裂）方法----------------");
    int count = 8;
    // 0-0 1-1 2-2 3-3 4-4 5-5 6-6 7-7
    CWUnionFindSet *unionSet6 = [[CWUnionFindSet alloc] initWithSetCount:count];
    // NSMutableArray *array = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"", nil]
    NSLog(@"unionSet6=%@",unionSet6);
    [unionSet6 findSet6:0];
    // 0-2 1-3 2-4 3-5 4-6 5-7 6-7 7-7
    NSLog(@"unionSet6=%@",unionSet6);
}

void test8()
{
    NSLog(@"----------------8、并查集model方法----------------");
	int count = 5;
	NSMutableArray *array1 = [NSMutableArray array];
	NSMutableArray *array2 = [NSMutableArray array];
	for (int i = 0; i < count; i++) {
		[array1 addObject:[NSString stringWithFormat:@"%d",arc4random() % (count)]];
		[array2 addObject:[NSString stringWithFormat:@"%d",arc4random() % (count)]];
	}
	CWGoodUnionFind *goodUF = [[CWGoodUnionFind alloc] initWithSetCount:count];
	
	
	[goodUF unionSet:[NSString stringWithFormat:@"value_%@",array1[0]] value2:[NSString stringWithFormat:@"value_%@",array1[1]]];
	
	[goodUF unionSet:[NSString stringWithFormat:@"value_%@",array1[2]] value2:[NSString stringWithFormat:@"value_%@",array1[4]]];
	
	[goodUF unionSet:[NSString stringWithFormat:@"value_%@",array1[3]] value2:[NSString stringWithFormat:@"value_%@",array1[0]]];
	
	
	for (CWItem *item in goodUF.dicItems) {
		CWItem *item1 = [goodUF.dicItems objectForKey:item];
		NSLog(@"value=%@----rank=%ld----name=%@----parent=%@",item1.value,item1.rank,item1.name,item1.parent.value);
	}
			
			
	
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        test1();
//        test2();
//        test3();
//        test4();
//        test5();
//        test6();
        
//		test8();
        
//		return 0;
        
        CWTimeTool *time = [[CWTimeTool alloc] init];
        int count = 5000;
        CWUnionFindSet *unionSet1 = [[CWUnionFindSet alloc] initWithSetCount:count];
        CWUnionFindSet *unionSet2 = [[CWUnionFindSet alloc] initWithSetCount:count];
        CWUnionFindSet *unionSet3 = [[CWUnionFindSet alloc] initWithSetCount:count];
        CWUnionFindSet *unionSet4 = [[CWUnionFindSet alloc] initWithSetCount:count];
        CWUnionFindSet *unionSet5 = [[CWUnionFindSet alloc] initWithSetCount:count];
        CWUnionFindSet *unionSet6 = [[CWUnionFindSet alloc] initWithSetCount:count];
        CWUnionFindSet *unionSet7 = [[CWUnionFindSet alloc] initWithSetCount:count];

		NSMutableArray *array1 = [NSMutableArray array];
		NSMutableArray *array2 = [NSMutableArray array];
		NSMutableArray *array3 = [NSMutableArray array];
		NSMutableArray *array4 = [NSMutableArray array];
		for (int i = 0; i < count; i++) {
			[array1 addObject:[NSString stringWithFormat:@"%d",arc4random() % (count)]];
			[array2 addObject:[NSString stringWithFormat:@"%d",arc4random() % (count)]];
		}

		for (int i = 0; i < count; i++) {
			[array3 addObject:[NSString stringWithFormat:@"%d",arc4random() % (count)]];
			[array4 addObject:[NSString stringWithFormat:@"%d",arc4random() % (count)]];
		}
		
         
		// 1、普通的并查集
        NSLog(@"\n1、普通的并查集");
        [time executeTimesForFunction:^{
            for (int i = 0; i < count; i++) {
                [unionSet1 unionSet:[array1[i] intValue] value2:[array2[i] intValue]];
            }

            for (int i = 0; i < count; i++) {
                [unionSet1 isSameSet:[array3[i] intValue] value2:[array4[i] intValue]];
            }
        }];
		
		// 2、快速的并查集的实现
        NSLog(@"\n2、快速的并查集的实现");
        [time executeTimesForFunction:^{
            for (int i = 0; i < count; i++) {
                [unionSet2 unionSet2:[array1[i] intValue] value2:[array2[i] intValue]];
            }

            for (int i = 0; i < count; i++) {
                [unionSet2 isSameSet2:[array3[i] intValue] value2:[array4[i] intValue]];
            }
        }];

        // 3、并查集的实现（基于size的优化）
        NSLog(@"\n3、并查集的实现（基于size的优化）");
        [time executeTimesForFunction:^{
            for (int i = 0; i < count; i++) {
                [unionSet3 unionSet3:[array1[i] intValue] value2:[array2[i] intValue]];
            }

            for (int i = 0; i < count; i++) {
                [unionSet3 isSameSet3:[array3[i] intValue] value2:[array4[i] intValue]];
            }
        }];

        // 4、并查集的实现（基于rank的优化）
        NSLog(@"\n4、并查集的实现（基于rank的优化）");
        [time executeTimesForFunction:^{
            for (int i = 0; i < count; i++) {
                [unionSet4 unionSet4:[array1[i] intValue] value2:[array2[i] intValue]];
            }

            for (int i = 0; i < count; i++) {
                [unionSet4 isSameSet4:[array3[i] intValue] value2:[array4[i] intValue]];
            }
        }];

        // 5、并查集的实现（路径压缩,使得所有节点都指向跟节点）
        NSLog(@"\n5、并查集的实现（路径压缩,使得所有节点都指向跟节点）");
        [time executeTimesForFunction:^{
            for (int i = 0; i < count; i++) {
                [unionSet5 unionSet5:[array1[i] intValue] value2:[array2[i] intValue]];
            }

            for (int i = 0; i < count; i++) {
                [unionSet5 isSameSet5:[array3[i] intValue] value2:[array4[i] intValue]];
            }
        }];

        // 6、并查集的实现（路径分裂Path Spliting）
        NSLog(@"\n6、并查集的实现（路径分裂Path Spliting）");
        [time executeTimesForFunction:^{
            for (int i = 0; i < count; i++) {
                [unionSet6 unionSet6:[array1[i] intValue] value2:[array2[i] intValue]];
            }

            for (int i = 0; i < count; i++) {
                [unionSet6 isSameSet6:[array3[i] intValue] value2:[array4[i] intValue]];
            }
        }];

        // 7、并查集的实现（路径减半）
        NSLog(@"\n7、并查集的实现（路径减半）");
        [time executeTimesForFunction:^{
            for (int i = 0; i < count; i++) {
                [unionSet7 unionSet7:[array1[i] intValue] value2:[array2[i] intValue]];
            }

            for (int i = 0; i < count; i++) {
                [unionSet7 isSameSet7:[array3[i] intValue] value2:[array4[i] intValue]];
            }
        }];
		
		
		
		// 8、并查集的model测试
		CWGoodUnionFind *goodUF = [[CWGoodUnionFind alloc] initWithSetCount:count];
		NSLog(@"\n8、并查集的model实现");
        [time executeTimesForFunction:^{
            for (int i = 0; i < count; i++) {
                [goodUF unionSet:[NSString stringWithFormat:@"value_%@",array1[i]] value2:[NSString stringWithFormat:@"value_%@",array2[i]]];
            }

            for (int i = 0; i < count; i++) {
                [goodUF isSameSet:[NSString stringWithFormat:@"value_%@",array3[i]] value2:[NSString stringWithFormat:@"value_%@",array4[i]]];
            }
        }];
		
		
		
		
		
		
		
		
    }
    return 0;
}

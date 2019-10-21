//
//  main.m
//  18-图(Graph)
//
//  Created by 程金伟 on 2019/10/20.
//  Copyright © 2019 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWGraph.h"

// 1、图的基本测试
void test()
{
    CWGraph *graph = [[CWGraph alloc] init];
    [graph addEdgeFrom:@"v1" to:@"v0" value:@"9"];
    [graph addEdgeFrom:@"v1" to:@"v2" value:@"3"];
    [graph addEdgeFrom:@"v2" to:@"v3" value:@"5"];
    [graph addEdgeFrom:@"v2" to:@"v0" value:@"2"];
    [graph addEdgeFrom:@"v3" to:@"v4" value:@"1"];
    [graph addEdgeFrom:@"v4" to:@"v0" value:@"6"];
    NSLog(@"%@",graph);
    
    // 删除边
    [graph removeEdgeFrom:@"v4" to:@"v0"];
    NSLog(@"%@",graph);
    // 删除顶点
    [graph removeVertex:@"v0"];
    NSLog(@"%@",graph);
}

// 2、广度优化搜索
void BreadthSearch()
{
    CWGraph *graph2 = [[CWGraph alloc] init];
    [graph2 addEdgeFrom:@"0" to:@"1" value:@""];
    [graph2 addEdgeFrom:@"1" to:@"2" value:@""];
    [graph2 addEdgeFrom:@"2" to:@"0" value:@""];
    [graph2 addEdgeFrom:@"0" to:@"4" value:@""];
    
    [graph2 addEdgeFrom:@"2" to:@"4" value:@""];
    [graph2 addEdgeFrom:@"3" to:@"1" value:@""];
    [graph2 addEdgeFrom:@"2" to:@"5" value:@""];
    
    [graph2 addEdgeFrom:@"5" to:@"3" value:@""];
    [graph2 addEdgeFrom:@"5" to:@"7" value:@""];
    
    [graph2 addEdgeFrom:@"6" to:@"2" value:@""];
    [graph2 addEdgeFrom:@"4" to:@"6" value:@""];
    [graph2 addEdgeFrom:@"6" to:@"7" value:@""];
    [graph2 addEdgeFrom:@"4" to:@"7" value:@""];
    
    [graph2 breadthSearch:@"0"];
    NSLog(@"==============");
    
    
    CWGraph *graph3 = [[CWGraph alloc] init];
    [graph3 addEdgeFrom:@"A" to:@"B" value:@""];
    [graph3 addEdgeFrom:@"B" to:@"A" value:@""];
    [graph3 addEdgeFrom:@"A" to:@"C" value:@""];
    [graph3 addEdgeFrom:@"C" to:@"A" value:@""];
    [graph3 addEdgeFrom:@"B" to:@"C" value:@""];
    [graph3 addEdgeFrom:@"C" to:@"B" value:@""];
    [graph3 breadthSearch:@"A"];
    NSLog(@"==============");
}

// 3、深度优化搜索
void depthSearch ()
{
    CWGraph *graph4 = [[CWGraph alloc] init];
    [graph4 addEdgeFrom:@"A" to:@"B" value:@""];
    [graph4 addEdgeFrom:@"B" to:@"A" value:@""];
    [graph4 addEdgeFrom:@"A" to:@"C" value:@""];
    [graph4 addEdgeFrom:@"C" to:@"A" value:@""];
    [graph4 addEdgeFrom:@"B" to:@"C" value:@""];
    [graph4 addEdgeFrom:@"C" to:@"B" value:@""];
    [graph4 depthSearch2:@"A"];
    NSLog(@"==============");
    
    
    CWGraph *graph4_2 = [[CWGraph alloc] init];
    // 1 0
    [graph4_2 addEdgeFrom:@"1" to:@"0" value:@""];
    [graph4_2 addEdgeFrom:@"0" to:@"1" value:@""];
    // 1 2 4
    [graph4_2 addEdgeFrom:@"1" to:@"2" value:@""];
    [graph4_2 addEdgeFrom:@"2" to:@"1" value:@""];
    [graph4_2 addEdgeFrom:@"2" to:@"4" value:@""];
    [graph4_2 addEdgeFrom:@"4" to:@"2" value:@""];
    // 1 6
    [graph4_2 addEdgeFrom:@"1" to:@"6" value:@""];
    [graph4_2 addEdgeFrom:@"6" to:@"1" value:@""];
    // 1 5
    [graph4_2 addEdgeFrom:@"1" to:@"5" value:@""];
    [graph4_2 addEdgeFrom:@"5" to:@"1" value:@""];
    // 1 3 5
    [graph4_2 addEdgeFrom:@"1" to:@"3" value:@""];
    [graph4_2 addEdgeFrom:@"3" to:@"1" value:@""];
    [graph4_2 addEdgeFrom:@"3" to:@"7" value:@""];
    [graph4_2 addEdgeFrom:@"7" to:@"3" value:@""];
    
    [graph4_2 depthSearch:@"1"];
    NSLog(@"==============");
    [graph4_2 depthSearch2:@"1"];
    NSLog(@"==============");
    
    
}

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    
        
        // test();
        // BreadthSearch();
        depthSearch();
        

		
		
	}
	return 0;
}

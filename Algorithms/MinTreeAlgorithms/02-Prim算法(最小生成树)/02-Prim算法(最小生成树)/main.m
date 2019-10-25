//
//  main.m
//  02-Prim算法(最小生成树)
//
//  Created by mac on 2019/10/25.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CWBinaryHeap.h"
#import "CWGoodUnionFind.h"
#import "CWGraph.h"

void prim()
{
    // 0、测试的图结构--参考图1
//    CWGraph *graph = [[CWGraph alloc] init];
//    [graph addEdgeFrom:@"A" to:@"B" value:@"4"];
//    [graph addEdgeFrom:@"B" to:@"A" value:@"4"];
//    [graph addEdgeFrom:@"B" to:@"C" value:@"8"];
//    [graph addEdgeFrom:@"C" to:@"B" value:@"8"];
//    [graph addEdgeFrom:@"C" to:@"D" value:@"7"];
//    [graph addEdgeFrom:@"D" to:@"C" value:@"7"];
//    [graph addEdgeFrom:@"D" to:@"E" value:@"9"];
//    [graph addEdgeFrom:@"E" to:@"D" value:@"9"];
//    [graph addEdgeFrom:@"E" to:@"F" value:@"10"];
//    [graph addEdgeFrom:@"F" to:@"E" value:@"10"];
//    [graph addEdgeFrom:@"F" to:@"G" value:@"2"];
//    [graph addEdgeFrom:@"G" to:@"F" value:@"2"];
//    [graph addEdgeFrom:@"G" to:@"H" value:@"1"];
//    [graph addEdgeFrom:@"H" to:@"G" value:@"1"];
//
//
//    [graph addEdgeFrom:@"G" to:@"I" value:@"6"];
//    [graph addEdgeFrom:@"I" to:@"G" value:@"6"];
//    [graph addEdgeFrom:@"H" to:@"I" value:@"7"];
//    [graph addEdgeFrom:@"I" to:@"H" value:@"7"];
//
//    [graph addEdgeFrom:@"I" to:@"C" value:@"2"];
//    [graph addEdgeFrom:@"C" to:@"I" value:@"2"];
//    [graph addEdgeFrom:@"B" to:@"H" value:@"11"];
//    [graph addEdgeFrom:@"H" to:@"B" value:@"11"];
//    [graph addEdgeFrom:@"A" to:@"H" value:@"8"];
//    [graph addEdgeFrom:@"H" to:@"A" value:@"8"];
//
//    [graph addEdgeFrom:@"F" to:@"D" value:@"14"];
//    [graph addEdgeFrom:@"D" to:@"F" value:@"14"];
//    [graph addEdgeFrom:@"F" to:@"C" value:@"4"];
//    [graph addEdgeFrom:@"C" to:@"F" value:@"4"];
	
	
	// 参考图2
	CWGraph *graph = [[CWGraph alloc] init];
    [graph addEdgeFrom:@"A" to:@"B" value:@"17"];
    [graph addEdgeFrom:@"B" to:@"A" value:@"17"];
    [graph addEdgeFrom:@"B" to:@"C" value:@"6"];
    [graph addEdgeFrom:@"C" to:@"B" value:@"6"];
    [graph addEdgeFrom:@"C" to:@"D" value:@"10"];
    [graph addEdgeFrom:@"D" to:@"C" value:@"10"];
	
    [graph addEdgeFrom:@"D" to:@"E" value:@"4"];
    [graph addEdgeFrom:@"E" to:@"D" value:@"4"];
    [graph addEdgeFrom:@"E" to:@"A" value:@"16"];
    [graph addEdgeFrom:@"A" to:@"E" value:@"16"];
	
	[graph addEdgeFrom:@"A" to:@"F" value:@"1"];
    [graph addEdgeFrom:@"F" to:@"A" value:@"1"];
    [graph addEdgeFrom:@"B" to:@"F" value:@"11"];
    [graph addEdgeFrom:@"F" to:@"B" value:@"11"];
	[graph addEdgeFrom:@"D" to:@"F" value:@"14"];
    [graph addEdgeFrom:@"F" to:@"D" value:@"14"];
	[graph addEdgeFrom:@"E" to:@"F" value:@"33"];
    [graph addEdgeFrom:@"F" to:@"E" value:@"33"];
	
    [graph addEdgeFrom:@"B" to:@"D" value:@"5"];
    [graph addEdgeFrom:@"D" to:@"B" value:@"5"];
	
	
    
    // 1、获取一个随机顶点
    NSMutableArray *vertexArray = [NSMutableArray array];
    for (CWVertex *vertex in graph.graphVertexSets) {
        [vertexArray addObject:vertex];
        break;
    }
    
    // 2、已经添加的顶点
    NSMutableArray *visitedArray = [NSMutableArray array];
    [visitedArray addObject:vertexArray[0]];
    
    // 3、使用二叉堆取最小的数据
    CWBinaryHeap *heap = [[CWBinaryHeap alloc] init];
    // 添加边
    NSMutableArray *edgeArray = [NSMutableArray array];
    NSString *key = vertexArray[0];
    CWVertex *vertex = graph.graphVertexSets[key];
    for (CWEdge *edge in vertex.outEdges) {
        [edgeArray addObject:edge];
    }
    NSInteger size = graph.graphVertexSets.count - 1;
    [heap batchHeaps:edgeArray];
    
    CWGraph *minGraph = [[CWGraph alloc] init];
    while(!heap.isEmpty && minGraph.edgeSizes < size){
        CWEdge *edge = [heap removeTop];
        if([visitedArray containsObject:edge.toVertex.valueV]){
            continue;
        }
		// 是否访问过顶点
		[visitedArray addObject:edge.toVertex.valueV];
		// 添加新的边值
		for (CWEdge *edge1 in edge.toVertex.outEdges) {
            [heap addEle:edge1];
        }
		// 添加最小生成树的边
		[minGraph addEdgeFrom:edge.fromVertex.valueV to:edge.toVertex.valueV value:edge.valueE];
        NSLog(@"%@-%@",edge.fromVertex.valueV,edge.toVertex.valueV);
        
    }
    
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"================prim算法================");
        prim();
        
    return 0;
    }
}

//
//  main.m
//  01-Kruskal算法(最小生成树)
//
//  Created by 程金伟 on 2019/10/22.
//  Copyright © 2019 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWBinaryHeap.h"
#import "CWGoodUnionFind.h"
#import "CWGraph.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    
		
		
		// 1、kruskal算法-生成最小树的实现
		
		// 测试的图结构
		CWGraph *graph = [[CWGraph alloc] init];
		[graph addEdgeFrom:@"A" to:@"B" value:@"4"];
		[graph addEdgeFrom:@"B" to:@"A" value:@"4"];
		[graph addEdgeFrom:@"B" to:@"C" value:@"8"];
		[graph addEdgeFrom:@"C" to:@"B" value:@"8"];
		[graph addEdgeFrom:@"C" to:@"D" value:@"7"];
		[graph addEdgeFrom:@"D" to:@"C" value:@"7"];
		[graph addEdgeFrom:@"D" to:@"E" value:@"9"];
		[graph addEdgeFrom:@"E" to:@"D" value:@"9"];
		[graph addEdgeFrom:@"E" to:@"F" value:@"10"];
		[graph addEdgeFrom:@"F" to:@"E" value:@"10"];
		[graph addEdgeFrom:@"F" to:@"G" value:@"2"];
		[graph addEdgeFrom:@"G" to:@"F" value:@"2"];
		[graph addEdgeFrom:@"G" to:@"H" value:@"1"];
		[graph addEdgeFrom:@"H" to:@"G" value:@"1"];
        
        
		[graph addEdgeFrom:@"G" to:@"I" value:@"6"];
		[graph addEdgeFrom:@"I" to:@"G" value:@"6"];
		[graph addEdgeFrom:@"H" to:@"I" value:@"7"];
		[graph addEdgeFrom:@"I" to:@"H" value:@"7"];
        
		[graph addEdgeFrom:@"I" to:@"C" value:@"2"];
		[graph addEdgeFrom:@"C" to:@"I" value:@"2"];
		[graph addEdgeFrom:@"B" to:@"H" value:@"11"];
		[graph addEdgeFrom:@"H" to:@"B" value:@"11"];
		[graph addEdgeFrom:@"A" to:@"H" value:@"8"];
		[graph addEdgeFrom:@"H" to:@"A" value:@"8"];
        
		[graph addEdgeFrom:@"F" to:@"D" value:@"14"];
		[graph addEdgeFrom:@"D" to:@"F" value:@"14"];
		[graph addEdgeFrom:@"F" to:@"C" value:@"4"];
		[graph addEdgeFrom:@"C" to:@"F" value:@"4"];
        
        // NSLog(@"add==%@",graph);
        
        // 1、添加顶点
        NSMutableArray *vertexArray = [NSMutableArray array];
        for (CWVertex *vertex in graph.graphVertexSets) {
            [vertexArray addObject:vertex];
        }
        // 添加边
        NSMutableArray *edgeArray = [NSMutableArray array];
        for (CWEdge *edge in graph.graphEdgeSets) {
            [edgeArray addObject:edge];
        }

		// 2、使用并查集判断是否出现环
		CWGoodUnionFind *unionF = [[CWGoodUnionFind alloc] initWithSetCount:vertexArray.copy];
       
        // 3、使用二叉堆取最小的数据
		CWBinaryHeap *heap = [[CWBinaryHeap alloc] init];
		NSInteger size = graph.graphVertexSets.count - 1;
		[heap batchHeaps:edgeArray];
		CWGraph *minGraph = [[CWGraph alloc] init];
		while(!heap.isEmpty && minGraph.edgeSizes < size){
			CWEdge *edge = [heap removeTop];
			if([unionF isSameSet:edge.fromVertex.valueV value2:edge.toVertex.valueV]){
				continue;
			}
            
            NSLog(@"%@-%@",edge.fromVertex.valueV,edge.toVertex.valueV);
			[minGraph addEdgeFrom:edge.fromVertex.valueV to:edge.toVertex.valueV value:edge.valueE];
            [unionF unionSet:edge.fromVertex.valueV value2:edge.toVertex.valueV];
		}
	}
	return 0;
}

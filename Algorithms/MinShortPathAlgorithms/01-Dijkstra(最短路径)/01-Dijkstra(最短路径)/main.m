//
//  main.m
//  01-Dijkstra(最短路径)
//
//  Created by 程金伟 on 2019/10/27.
//  Copyright © 2019 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWBinaryHeap.h"
#import "CWGraph.h"

NSMutableArray * minShortVertexs(NSString *begin,CWGraph *graph,CWVertex *vertex)
{
	NSMutableArray *array = [NSMutableArray array];
	while(vertex.inEdges.count != 0)  {


		for (CWEdge *edge in vertex.inEdges) {
			[array addObject:edge.fromVertex];
		}
		
	}
	
	return array;
}

void dijkstra(NSString *beginKey)
{
	// 参考图
	CWGraph *graph = [[CWGraph alloc] init];
    [graph addEdgeFrom:@"A" to:@"E" value:@"100"];
    [graph addEdgeFrom:@"A" to:@"D" value:@"30"];
    [graph addEdgeFrom:@"A" to:@"B" value:@"10"];
    [graph addEdgeFrom:@"B" to:@"C" value:@"50"];
    [graph addEdgeFrom:@"C" to:@"E" value:@"10"];
    [graph addEdgeFrom:@"D" to:@"C" value:@"20"];
		
		
	// 1、获取所有的顶点
	NSMutableArray *vertexArray = [NSMutableArray array];
	for (NSString *vertex in graph.graphVertexdDics) {
		[vertexArray addObject:graph.graphVertexdDics[vertex]];
	}
	
	// 2、begin的顶点到其他的顶点最短路径集合
	NSMutableDictionary *sumDic = [NSMutableDictionary dictionary];
	NSMutableDictionary *visitedDic = [NSMutableDictionary dictionary];
	for (int i = 0; i < vertexArray.count; i++) {
		CWVertex *vertex = vertexArray[i];
		if (![vertex.valueV isEqualToString:beginKey]) {
			NSMutableArray *vertexArray = minShortVertexs(beginKey,graph,vertex);
			[sumDic setValue:vertexArray forKey:vertex.valueV];
		}
	}
	
	// 3、使用二叉堆取最小的数据
	CWBinaryHeap *heap = [[CWBinaryHeap alloc] init];
	// 添加边
	NSMutableArray *edgeArray = [NSMutableArray array];
	NSString *key = vertexArray[0];
	CWVertex *vertex = graph.graphVertexdDics[key];
	for (CWEdge *edge in vertex.outEdges) {
		[edgeArray addObject:edge];
	}
	NSInteger size = graph.graphVertexdDics.count - 1;
	[heap batchHeaps:edgeArray];
	
	CWGraph *minGraph = [[CWGraph alloc] init];
	while(!heap.isEmpty && minGraph.edgeSizes < size){
		CWEdge *edge = [heap removeTop];
		
	}
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"================dijkstra算法================");
        dijkstra(@"A");
        
    return 0;
    }
}

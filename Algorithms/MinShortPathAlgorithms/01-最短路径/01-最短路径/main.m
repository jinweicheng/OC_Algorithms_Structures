//
//  main.m
//  01-最短路径
//
//  Created by mac on 2019/10/31.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWBinaryHeap.h"
#import "CWGraph.h"


#pragma mark - 1、Dijkstra算法

// 1-1、寻找权值最小的边
CWPathInfo * minShortPaths(NSMutableDictionary *paths)
{
    if (paths.count == 0) {
        return nil;
    }
    
    // 赋值个最小值
    CWPathInfo *minPath;
    for (NSString *key in paths) {
        minPath = paths[key];
        break;
    }
    
    // 遍历查找最小权值path
    for (NSString *key in paths) {
        CWPathInfo *path = paths[key];
        if ((path.weight.integerValue < minPath.weight.integerValue)) {
            minPath = path;
        }
    }
    return minPath;
}

// 1-2、松弛操作
void relaxForDijkstra(NSMutableDictionary *paths,CWPathInfo *minPath,CWEdge *edge)
{
    // 获取最新的权值
    NSInteger newWeight = minPath.weight.integerValue + edge.weight.integerValue;
    // 获取之前的权值
    CWPathInfo *oldPath = paths[edge.toVertex.valueV];
    NSInteger oldWeight = oldPath.weight.integerValue;
    if (oldPath != nil && newWeight >= oldWeight) {
        return;
    }
    
    // 顶点之前对应的没有值
    if (oldPath == nil) {
        CWPathInfo *newPath = [[CWPathInfo alloc] init];
        newPath.weight = [NSString stringWithFormat:@"%ld",newWeight];
        [newPath.pathsInfo addObjectsFromArray:minPath.pathsInfo];
        [newPath.pathsInfo addObject:edge];
        [paths setObject:newPath forKey:edge.toVertex.valueV];
    }
    // 得到最新最短的路径值
    else{
        [oldPath.pathsInfo removeAllObjects];
        oldPath.weight = [NSString stringWithFormat:@"%ld",newWeight];
        [oldPath.pathsInfo addObjectsFromArray:minPath.pathsInfo];
        [oldPath.pathsInfo addObject:edge];
        //        [paths setObject:oldPath forKey:edge.toVertex.valueV];
    }
}

// 1-3、dijkstra实现
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
    
    // 1、获取起点的vertex
    CWVertex *beginVertex = graph.graphVertexdDics[beginKey];
    if (beginVertex == nil) {
        return;
    }
    
    // 2、初始化set集合
    NSMutableDictionary *paths = [NSMutableDictionary dictionary];
    NSMutableDictionary *selectPaths = [NSMutableDictionary dictionary];
    for (CWEdge *edge in beginVertex.outEdges) {
        CWPathInfo *pathInfo = [[CWPathInfo alloc] init];
        pathInfo.weight = edge.weight;
        [pathInfo.pathsInfo addObject:edge];
        [paths setObject:pathInfo forKey:edge.toVertex.valueV];
    }
    
    // 3、遍历paths的最小值，进行松弛操作
    while (paths.count != 0) {
        CWPathInfo *minPath = minShortPaths(paths);
        CWEdge *lastEdge = minPath.pathsInfo.lastObject;
        [selectPaths setObject:minPath forKey:lastEdge.toVertex.valueV];
        [paths removeObjectForKey:lastEdge.toVertex.valueV];
        
        // 松弛操作
        for (CWEdge *edge in lastEdge.toVertex.outEdges) {
            if ([selectPaths.allKeys containsObject:edge.toVertex.valueV]) {
                continue;
            }
            relaxForDijkstra(paths,minPath,edge);
        }
    }
    [selectPaths removeObjectForKey:beginKey];
    
    
    // 4、打印结果值
    for (NSString *key in selectPaths) {
        CWPathInfo *minPath = selectPaths[key];
        NSString *printPaths = @"";
        NSString *printWeight = minPath.weight;
        for (int i = 0; i < minPath.pathsInfo.count; i++) {
            CWEdge *edge = minPath.pathsInfo[i];
            if (i == minPath.pathsInfo.count - 1) {
                printPaths = [printPaths stringByAppendingFormat:@"[%@->%@]",edge.fromVertex.valueV,edge.toVertex.valueV];
            }else{
                printPaths = [printPaths stringByAppendingFormat:@"[%@->%@] ->",edge.fromVertex.valueV,edge.toVertex.valueV];
            }
        }
        NSLog(@"%@ - weight:%@ - paths:%@",key,printWeight,printPaths);
    }
    
    
    // 3、使用二叉堆取最小的数据
    //    CWBinaryHeap *heap = [[CWBinaryHeap alloc] init];
    //    // 添加边
    //    NSMutableArray *edgeArray = [NSMutableArray array];
    //    NSString *key = vertexArray[0];
    //    CWVertex *vertex = graph.graphVertexdDics[key];
    //    for (CWEdge *edge in vertex.outEdges) {
    //        [edgeArray addObject:edge];
    //    }
    //    NSInteger size = graph.graphVertexdDics.count - 1;
    //    [heap batchHeaps:edgeArray];
    //
    //    CWGraph *minGraph = [[CWGraph alloc] init];
    //    while(!heap.isEmpty && minGraph.edgeSizes < size){
    //        CWEdge *edge = [heap removeTop];
    //
    //    }
}


#pragma mark - 2、Bellman-Ford算法

// 2-1、松弛操作
BOOL relaxForBellman(NSMutableDictionary *paths,CWPathInfo *minPath,CWEdge *edge)
{
    // 获取最新的权值
    NSInteger newWeight = minPath.weight.integerValue + edge.weight.integerValue;
    // 获取之前的权值
    CWPathInfo *oldPath = paths[edge.toVertex.valueV];
    NSInteger oldWeight = oldPath.weight.integerValue;
    if (oldPath != nil && newWeight >= oldWeight) {
        return false;
    }
    
    // 顶点之前对应的没有值
    if (oldPath == nil) {
        CWPathInfo *newPath = [[CWPathInfo alloc] init];
        newPath.weight = [NSString stringWithFormat:@"%ld",newWeight];
        [newPath.pathsInfo addObjectsFromArray:minPath.pathsInfo];
        [newPath.pathsInfo addObject:edge];
        [paths setObject:newPath forKey:edge.toVertex.valueV];
    }
    // 得到最新最短的路径值
    else{
        [oldPath.pathsInfo removeAllObjects];
        oldPath.weight = [NSString stringWithFormat:@"%ld",newWeight];
        [oldPath.pathsInfo addObjectsFromArray:minPath.pathsInfo];
        [oldPath.pathsInfo addObject:edge];
    }
    return true;
}

// 2-2
void bellman_Ford(NSString *beginKey)
{
    // 参考图
    CWGraph *graph = [[CWGraph alloc] init];
    [graph addEdgeFrom:@"A" to:@"B" value:@"10"];
    [graph addEdgeFrom:@"A" to:@"E" value:@"8"];
    [graph addEdgeFrom:@"B" to:@"C" value:@"8"];
    [graph addEdgeFrom:@"B" to:@"E" value:@"-5"];
    
    [graph addEdgeFrom:@"E" to:@"D" value:@"7"];
    [graph addEdgeFrom:@"E" to:@"F" value:@"3"];
    [graph addEdgeFrom:@"D" to:@"C" value:@"2"];
    [graph addEdgeFrom:@"D" to:@"F" value:@"6"];
    
    // 1、获取起点的vertex
    CWVertex *beginVertex = graph.graphVertexdDics[beginKey];
    if (beginVertex == nil) {
        return;
    }
    
    // 2、进行松弛操作
    NSMutableDictionary *selectPaths = [NSMutableDictionary dictionary];
    CWPathInfo *pathInfo = [[CWPathInfo alloc] init];
    pathInfo.weight = @"0";
    [selectPaths setObject:pathInfo forKey:beginKey];
    
    NSUInteger size = graph.graphVertexdDics.count - 1;
    for (int i = 0; i < size; i++) { // 对每条边进行v - 1次
        for (CWEdge *edge in graph.graphEdgeSets) {
            CWPathInfo *path = selectPaths[edge.fromVertex.valueV];
            if (path == nil) {
                continue;
            }
            relaxForBellman(selectPaths, path,edge);
        }
    }
    [selectPaths removeObjectForKey:beginKey];
    
    // 3、打印
    for (NSString *key in selectPaths) {
        CWPathInfo *minPath = selectPaths[key];
        NSString *printPaths = @"";
        NSString *printWeight = minPath.weight;
        for (int i = 0; i < minPath.pathsInfo.count; i++) {
            CWEdge *edge = minPath.pathsInfo[i];
            if (i == minPath.pathsInfo.count - 1) {
                printPaths = [printPaths stringByAppendingFormat:@"[%@->%@]",edge.fromVertex.valueV,edge.toVertex.valueV];
            }else{
                printPaths = [printPaths stringByAppendingFormat:@"[%@->%@] ->",edge.fromVertex.valueV,edge.toVertex.valueV];
            }
        }
        NSLog(@"%@ - weight:%@ - paths:%@",key,printWeight,printPaths);
    }
    
}


#pragma mark - 3、Floyd算法(多源最短路径算法)
void floyd()
{
    // 0、参考图
    CWGraph *graph = [[CWGraph alloc] init];
    [graph addEdgeFrom:@"A" to:@"B" value:@"10"];
    [graph addEdgeFrom:@"A" to:@"E" value:@"8"];
    [graph addEdgeFrom:@"B" to:@"C" value:@"8"];
    [graph addEdgeFrom:@"B" to:@"E" value:@"-5"];
    
    [graph addEdgeFrom:@"E" to:@"D" value:@"7"];
    [graph addEdgeFrom:@"E" to:@"F" value:@"3"];
    [graph addEdgeFrom:@"D" to:@"C" value:@"2"];
    [graph addEdgeFrom:@"D" to:@"F" value:@"6"];
    
    // 1、初始化集合
    NSMutableDictionary *paths = [NSMutableDictionary dictionary];
    for (CWEdge *edge in graph.graphEdgeSets) {
        NSMutableDictionary *pathDic = paths[edge.fromVertex.valueV];
        if(pathDic == nil){
            pathDic = [NSMutableDictionary dictionary];
			[paths setObject:pathDic forKey:edge.fromVertex.valueV];
        }
        
        CWPathInfo *path = pathDic[edge.toVertex.valueV];
        if(path == nil){
            path = [[CWPathInfo alloc] init];
        }
        path.weight = edge.weight;
        [path.pathsInfo addObject:edge];
        [pathDic setObject:path forKey:edge.toVertex.valueV];
        
    }
    
    
    // 2、遍历计算新的最短路径
    for (NSString *v2 in graph.graphVertexdDics) {
        for (NSString *v1 in graph.graphVertexdDics) {
            for (NSString *v3 in graph.graphVertexdDics) {
                if([v1 isEqualToString:v2] || [v2 isEqualToString:v3] || [v1 isEqualToString:v3]){
                    continue;
                }
                // v1 - v2
                CWPathInfo *path12 = paths[v1][v2];
                if(path12 == nil){
                    continue;
                }
                // v2 - v3
                CWPathInfo *path23 = paths[v2][v3];
                if(path23 == nil){
                    continue;
                }
                // v1 - v3
                CWPathInfo *path13 = paths[v1][v3];
                
                // 获取最新的权值
                NSInteger newWeight = path12.weight.integerValue + path23.weight.integerValue;
                // 获取之前的权值
                NSInteger oldWeight = path13.weight.integerValue;
                if (path13 != nil && newWeight >= oldWeight) {
                    continue;
                }
                
                if (path13 == nil) {
                    path13 = [[CWPathInfo alloc] init];
                    // 重新设置path的最短路径
                    [paths[v1] setObject:path13 forKey:v3];
                }
				
                // 得到最新最短的路径值
                else{
					[path13.pathsInfo removeAllObjects];
                }
                path13.weight = [NSString stringWithFormat:@"%ld",newWeight];
                [path13.pathsInfo addObjectsFromArray:path12.pathsInfo];
                [path13.pathsInfo addObjectsFromArray:path23.pathsInfo];
            }
        }
    }
	
	
	// 3、打印遍历结果
	for (NSString *key in paths) {
		NSMutableDictionary *pathDic = paths[key];
        NSLog(@"--------------------%@--------------------",key);
		for (NSString *pathKey in pathDic) {
			CWPathInfo *pathInfo = pathDic[pathKey];
			NSString *printPaths = @"";
			for (int i = 0; i < pathInfo.pathsInfo.count; i++) {
				CWEdge *edge = pathInfo.pathsInfo[i];
				if (i == pathInfo.pathsInfo.count - 1) {
					printPaths = [printPaths stringByAppendingFormat:@"[%@->%@]",edge.fromVertex.valueV,edge.toVertex.valueV];
				}else{
					printPaths = [printPaths stringByAppendingFormat:@"[%@->%@] ->",edge.fromVertex.valueV,edge.toVertex.valueV];
				}
			}
			NSLog(@"%@ - weight:%@ - paths:%@",pathKey,pathInfo.weight,printPaths);
			
		}
	}
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"================Dijkstra算法================");
        dijkstra(@"A");
        NSLog(@"================Bellman_Ford算法================");
        bellman_Ford(@"A");
        NSLog(@"================Floyd算法================");
		floyd();
        return 0;
    }
}


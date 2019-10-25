# Algorithms-拓扑排序

> ## 一、拓扑排序关键代码

```

    // 使用队列保存入度为0的vertex
    CWQueueList *queue = [[CWQueueList alloc] init];
    // 使用map维护一个入度不为0的列表
    NSMutableDictionary *inMaps = [NSMutableDictionary dictionary];
    // 存放最终的结果
    NSMutableArray *results = [NSMutableArray array];

    // 1、初始化配置入度的列表集合
    for (NSString *key in self.graphVertexSets) {
        CWVertex *ver = [self.graphVertexSets objectForKey:key];
        NSInteger size = ver.inEdges.count;
        if (size == 0) {
            [queue cw_enQueue:ver];
        }else{
            [inMaps setObject:[NSString stringWithFormat:@"%ld",size] forKey:ver.valueV];
        }
    }

    // 2、从queue中取值设置vertex,遍历outEdges里面的值，使得edge的toVertex入度值减1
    while (!queue.cw_isEmpty) {
        CWVertex *ver = [queue cw_deQueue];
        [results addObject:ver.valueV];

        for (CWEdge *edge in ver.outEdges) {
            // 注意事项：需要获取顶点的入度列表的最新值
            NSInteger count = [[inMaps objectForKey:edge.toVertex.valueV] integerValue];
            NSInteger size = count - 1;
            if (size == 0) {
                [queue cw_enQueue:edge.toVertex];
                [inMaps removeObjectForKey:edge.toVertex.valueV];
            }else{
                [inMaps setObject:[NSString stringWithFormat:@"%ld",size] forKey:edge.toVertex.valueV];
            }
        }
}
NSLog(@"%@",results);


```


>## 二、Kruskal算法

```
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

```

>## 三、Prim算法

```

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

```

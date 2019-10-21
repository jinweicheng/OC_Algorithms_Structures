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

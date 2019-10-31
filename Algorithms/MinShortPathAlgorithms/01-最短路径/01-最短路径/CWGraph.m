//
//  CWGraph.m
//  18-图(Graph)
//
//  Created by 程金伟 on 2019/10/20.
//  Copyright © 2019 cjw. All rights reserved.
//

#import "CWGraph.h"
#import "CWQueueList.h"
#import "CWStackList.h"
@interface CWGraph()

@end

@implementation CWGraph

- (instancetype)init
{
	if (self  = [super init]) {
		self.graphVertexdDics = [NSMutableDictionary dictionary];
		self.graphEdgeSets = [NSMutableSet set];
	}
	return self;
}

// 1、添加顶点
- (void)addVertex:(NSString *)vertexKey
{
	CWVertex *vertex = [self.graphVertexdDics objectForKey:vertexKey];
	if(vertex != nil){
		return;
	}
	vertex = [[CWVertex alloc] initWithValue:vertexKey];
	[self.graphVertexdDics setObject:vertex forKey:vertexKey];
}
// 2、添加边
- (void)addEdgeFrom:(NSString *)fromVertexKey to:(NSString *)toVertexKey value:(NSString *)value
{
	// from 顶点
	CWVertex *fromVertex = [self.graphVertexdDics objectForKey:fromVertexKey];
	if (fromVertex == nil) {
		fromVertex = [[CWVertex alloc] initWithValue:fromVertexKey];
		[self.graphVertexdDics setObject:fromVertex forKey:fromVertexKey];
	}
	
	// to 顶点
	CWVertex *toVertex = [self.graphVertexdDics objectForKey:toVertexKey];
	if (toVertex == nil) {
		toVertex = [[CWVertex alloc] initWithValue:toVertexKey];
		[self.graphVertexdDics setObject:toVertex forKey:toVertexKey];
	}
	
	// 添加边
	CWEdge *newEdge  = [[CWEdge alloc] initWithVertex:fromVertex to:toVertex valueE:value];
	if ([fromVertex.outEdges containsObject:newEdge]) {
		[fromVertex.outEdges removeObject:newEdge];
		[toVertex.inEdges removeObject:newEdge];
		[self.graphEdgeSets removeObject:newEdge];
	}
	[fromVertex.outEdges addObject:newEdge];
	[toVertex.inEdges addObject:newEdge];
	[self.graphEdgeSets addObject:newEdge];
	
}
- (void)addEdgeFrom:(NSString *)fromVertexKey to:(NSString *)toVertexKey
{
	[self addEdgeFrom:fromVertexKey to:toVertexKey value:@""];
}
// 3、删除顶点
- (void)removeVertex:(NSString *)vertexKey
{
	CWVertex *vertex = [self.graphVertexdDics objectForKey:vertexKey];
	if (vertex == nil) {
		return;
	}
	
	
	[vertex.outEdges enumerateObjectsUsingBlock:^(CWEdge *obj, BOOL * _Nonnull stop) {
		if ([vertex isEqual:obj.fromVertex]) {
			[vertex.outEdges removeObject:obj];
			[self.graphEdgeSets removeObject:obj];
		}

	}];
	[vertex.inEdges enumerateObjectsUsingBlock:^(CWEdge *obj, BOOL * _Nonnull stop) {
		if ([vertex isEqual:obj.toVertex]) {
			[vertex.inEdges removeObject:obj];
			[self.graphEdgeSets removeObject:obj];
		}
	}];
	
}
// 4、删除边
- (void)removeEdgeFrom:(NSString *)fromVertexKey to:(NSString *)toEdgeKey
{
	CWVertex *fromVertex = [self.graphVertexdDics objectForKey:fromVertexKey];
	if (fromVertex == nil) {
		return;
	}
	
	CWVertex *toVertex = [self.graphVertexdDics objectForKey:toEdgeKey];
	if (toVertex == nil) {
		return;
	}
	
	CWEdge *edge = [[CWEdge alloc] initWithVertex:fromVertex to:toVertex valueE:@""];
	[fromVertex.outEdges removeObject:edge];
	[toVertex.inEdges removeObject:edge];
	[self.graphEdgeSets removeObject:edge];
	
}
// 5、边、顶点的size
- (NSUInteger)edgeSizes
{
	return self.graphEdgeSets.count;
}
- (NSUInteger)vertexSizes
{
	return self.graphVertexdDics.count;
}


// 6、广度优先搜索
- (void)breadthSearch:(NSString *)beginKey
{
	NSMutableArray *visiteds = [NSMutableArray array];
	CWQueueList *queue = [[CWQueueList alloc] init];
	CWVertex *vertex = [self.graphVertexdDics objectForKey:beginKey];
	[queue cw_enQueue:vertex];
	[visiteds addObject:vertex];
	
	while (!queue.cw_isEmpty) {
		CWVertex *ver = [queue cw_deQueue];
		NSLog(@"%@",ver.valueV);
		
		for (CWEdge *edge in ver.outEdges) {
			if ([visiteds containsObject:edge.toVertex]) {
				continue;
			}
			[queue cw_enQueue:edge.toVertex];
			[visiteds addObject:edge.toVertex];
			
		}
	}
}

// 7、深度优先搜索
- (void)depthSearch:(NSString *)beginKey
{
	CWVertex *vertex = [self.graphVertexdDics objectForKey:beginKey];
	if (vertex == nil) {
		return;
	}
    NSMutableArray *visiteds = [NSMutableArray array];
	[self dfs:vertex visiteds:visiteds];
}

- (void)dfs:(CWVertex *)vertex visiteds:(NSMutableArray *)visiteds
{
	NSLog(@"%@",vertex.valueV);
	[visiteds addObject:vertex.valueV];
	for (CWEdge *edge in vertex.outEdges) {
		if ([visiteds containsObject:edge.toVertex.valueV]) {
			continue;
		}
		[self dfs:edge.toVertex visiteds:visiteds];
	}
}

// 7-2、深度优先搜索(非递归实现)
- (void)depthSearch2:(NSString *)beginKey
{
	CWVertex *vertex = [self.graphVertexdDics objectForKey:beginKey];
	NSMutableArray *visiteds = [NSMutableArray array];
	CWStackList *stack = [[CWStackList alloc] init];
	[stack cw_push:vertex];
	[visiteds addObject:vertex.valueV];
	NSLog(@"%@",vertex.valueV);
	while (!stack.cw_isEmpty) {
		CWVertex *ver = [stack cw_pop];
		
		for (CWEdge *edge in ver.outEdges) {
			if ([visiteds containsObject:edge.toVertex.valueV]) {
				continue;
			}
			[stack cw_push:ver];
			[stack cw_push:edge.toVertex];
			[visiteds addObject:edge.toVertex.valueV];
			NSLog(@"%@",edge.toVertex.valueV);
			break;
		}
	}
}

- (NSString *)description
{
	NSString *str = [NSString string];
	for (CWEdge *edge in self.graphEdgeSets) {
		str = [str stringByAppendingFormat:@"\nfromV=%@    toV=%@    value=%@\n",edge.fromVertex.valueV,edge.toVertex.valueV,edge.weight];
	}
	return str;
}

@end


@implementation CWVertex

- (instancetype)initWithValue:(NSString *)value
{
	if (self  = [super init]) {
		self.inEdges = [NSMutableSet set];
		self.outEdges = [NSMutableSet set];
		self.valueV = value;
	}
	return self;
}
- (BOOL)isEqual:(CWVertex *)object
{
	return [self.valueV isEqualToString: object.valueV];
}

@end

@implementation CWEdge

- (instancetype)initWithVertex:(CWVertex *)fromVertex to:(CWVertex *)toVertex valueE:(NSString *)value
{
	if (self  = [super init]) {
		self.fromVertex = fromVertex;
		self.toVertex = toVertex;;
		self.weight = value;
	}
	return self;
}

- (BOOL)isEqual:(CWEdge *)object
{
    return [object.fromVertex isEqual:self.fromVertex] && [object.toVertex isEqual: self.toVertex];
}

@end


@implementation CWPathInfo

- (instancetype)init
{
    if (self = [super init]) {
        self.pathsInfo = [NSMutableArray array];
    }
    return self;
}

@end

//
//  CWGraph.h
//  18-图(Graph)
//
//  Created by 程金伟 on 2019/10/20.
//  Copyright © 2019 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CWVertex,CWEdge;

@interface CWGraph : NSObject

// 1、添加顶点
- (void)addVertex:(NSString *)vertexKey;
// 2、添加边
- (void)addEdgeFrom:(NSString *)fromVertexKey to:(NSString *)toVertexKey value:(NSString *)value;
- (void)addEdgeFrom:(NSString *)fromVertexKey to:(NSString *)toVertexKey;
// 3、删除顶点
- (void)removeVertex:(NSString *)vertexKey;
// 4、删除边
- (void)removeEdgeFrom:(NSString *)fromVertexKey to:(NSString *)toEdgeKey;
// 5、边、顶点的size
- (NSUInteger)edgeSizes;
- (NSUInteger)vertexSizes;

// 6、广度优先搜索
- (void)breadthSearch:(NSString *)beginKey;
// 7、深度优先搜索
- (void)depthSearch:(NSString *)beginKey;
// 7-2、深度优先搜索(非递归实现)
- (void)depthSearch2:(NSString *)beginKey;


@end


// 顶点
@interface CWVertex : NSObject
- (instancetype)initWithValue:(NSString *)value;
@property(nonatomic,copy)NSString *valueV;
@property (nonatomic,strong)NSMutableSet *inEdges;
@property (nonatomic,strong)NSMutableSet *outEdges;

@end


// 边
@interface CWEdge : NSObject
- (instancetype)initWithVertex:(CWVertex *)fromVertex to:(CWVertex *)toVertex valueE:(NSString *)value;
@property(nonatomic,strong)CWVertex *fromVertex;
@property(nonatomic,strong)CWVertex *toVertex;
@property(nonatomic,copy)NSString *valueE;

@end

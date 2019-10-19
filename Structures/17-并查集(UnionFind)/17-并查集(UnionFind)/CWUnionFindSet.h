//
//  CWUnionFindSet.h
//  16-并查集(UnionFind)
//
//  Created by mac on 2019/10/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWUnionFindSet : NSObject

@property (nonatomic,assign)  int count;

// 初始化配置
- (instancetype)initWithSetCount:(int)count;

// 1、普通的并查集的实现
- (int)findSet:(int)value;
- (void)unionSet:(int)value1 value2:(int)value2;
- (BOOL) isSameSet:(int)value1 value2:(int)value2;


// 2、快速的并查集的实现
- (int)findSet2:(int)value;
- (void)unionSet2:(int)value1 value2:(int)value2;
- (BOOL) isSameSet2:(int)value1 value2:(int)value2;


// 3、并查集的实现（基于size的优化）
- (int)findSet3:(int)value;
- (void)unionSet3:(int)value1 value2:(int)value2;
- (BOOL) isSameSet3:(int)value1 value2:(int)value2;

// 4、并查集的实现（基于rank的优化）
- (int)findSet4:(int)value;
- (void)unionSet4:(int)value1 value2:(int)value2;
- (BOOL) isSameSet4:(int)value1 value2:(int)value2;


// 5、并查集的实现（路径压缩,使得所有节点都指向跟节点）
- (int)findSet5:(int)value;
- (void)unionSet5:(int)value1 value2:(int)value2;
- (BOOL) isSameSet5:(int)value1 value2:(int)value2;

// 6、并查集的实现（路径分裂Path Spliting）
- (int)findSet6:(int)value;
- (void)unionSet6:(int)value1 value2:(int)value2;
- (BOOL) isSameSet6:(int)value1 value2:(int)value2;

// 7、并查集的实现（路径减半）
- (int)findSet7:(int)value;
- (void)unionSet7:(int)value1 value2:(int)value2;
- (BOOL) isSameSet7:(int)value1 value2:(int)value2;


@end

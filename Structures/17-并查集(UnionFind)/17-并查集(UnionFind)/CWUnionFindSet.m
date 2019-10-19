//
//  CWUnionFindSet.m
//  16-并查集(UnionFind)
//
//  Created by mac on 2019/10/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWUnionFindSet.h"

@interface CWUnionFindSet()
/**< 父节点集合 */
@property (nonatomic,strong)  NSMutableArray *parents;
@property (nonatomic,strong)  NSMutableArray *sizes;
@property (nonatomic,strong)  NSMutableArray *ranks;
@end

@implementation CWUnionFindSet

- (instancetype)initWithSetCount:(int)count
{
    if (self = [super init]) {
        self.count = count;
        self.parents = [NSMutableArray arrayWithCapacity:self.count];
        self.sizes = [NSMutableArray arrayWithCapacity:self.count];
        self.ranks = [NSMutableArray arrayWithCapacity:self.count];
        for (int i = 0; i < count; i++) {
            [self.parents addObject: [NSString stringWithFormat:@"%d",i]];
            [self.sizes addObject:[NSString stringWithFormat:@"%d",1]];
            [self.ranks addObject:[NSString stringWithFormat:@"%d",1]];
        }
    }
    return self;
}


#pragma mark - 1、普通并查集的实现

// 1-1、查找value所属的集合
- (int)findSet:(int)value
{
    return [self.parents[value] intValue];
}
// 1-2、合并value1、value2所属的集合
- (void)unionSet:(int)value1 value2:(int)value2
{
    int v1 = [self findSet:value1];
    int v2 = [self findSet:value2];
    
    if (v1 == v2) {
        return;
    }
    for (int i = 0; i < self.count; i++) {
        if (v1 == [self.parents[i] intValue]) {
            self.parents[i] = [NSString stringWithFormat:@"%d",v2];
        }
    }
}
// 1-3、判断所属的集合是否相同
- (BOOL) isSameSet:(int)value1 value2:(int)value2
{
    return [self findSet:value1] == [self findSet:value2];
}


#pragma mark - 2、快速的并查集的实现（合并时间复杂度O(n)优化至O(logn)）

- (int)findSet2:(int)value
{
    int v = value;
    while(v != [self.parents[v] intValue]){
        v = [self.parents[v] intValue];
    }
    return v;
}
- (void)unionSet2:(int)value1 value2:(int)value2
{
    int v1 = [self findSet2:value1];
    int v2 = [self findSet2:value2];
    
    if(v1 == v2){
        return;
    }
    self.parents[v1] = [NSString stringWithFormat:@"%d",v2];

    
}
- (BOOL) isSameSet2:(int)value1 value2:(int)value2
{
    return [self findSet2:value1] == [self findSet2:value2];
}


#pragma mark - 3、并查集的实现（基于size的优化）

- (int)findSet3:(int)value
{
    int v = value;
    while(v != [self.parents[v] intValue]){
        v = [self.parents[v] intValue];
    }
    return v;
}

- (void)unionSet3:(int)value1 value2:(int)value2
{
    int v1 = [self findSet3:value1];
    int v2 = [self findSet3:value2];
    if(v1 == v2) return;
    
    if (self.sizes[v1] > self.sizes[v2]) {
        self.parents[v2] = [NSString stringWithFormat:@"%d",v1];
        int count = [self.sizes[v1] intValue] + [self.sizes[v2] intValue];
        self.sizes[v1] = [NSString stringWithFormat:@"%d",count];
        
    }else{
        // v1的parent是v2
        self.parents[v1] = [NSString stringWithFormat:@"%d",v2];
        int count = [self.sizes[v1] intValue] + [self.sizes[v2] intValue];
        self.sizes[v2] = [NSString stringWithFormat:@"%d",count];
    }
}

- (BOOL) isSameSet3:(int)value1 value2:(int)value2
{
    return [self findSet3:value1] == [self findSet3:value2];
}


#pragma mark - 4、并查集的实现（基于rank的优化）

- (int)findSet4:(int)value
{
    int v = value;
    while(v != [self.parents[v] intValue]){
        v = [self.parents[v] intValue];
    }
    return v;
}
- (void)unionSet4:(int)value1 value2:(int)value2
{
    int v1 = [self findSet4:value1];
    int v2 = [self findSet4:value2];
    if(v1 == v2) return;
    
    if (self.ranks[v1] > self.ranks[v2]) {
        self.parents[v2] = [NSString stringWithFormat:@"%d",v1];
    }else if (self.ranks[v1] < self.ranks[v2]){
        self.parents[v1] = [NSString stringWithFormat:@"%d",v2];
    }else{
        self.parents[v1] = [NSString stringWithFormat:@"%d",v2];
        int height = [self.ranks[v1] intValue] + 1;
        self.ranks[v2] = [NSString stringWithFormat:@"%d",height];
    }
}
- (BOOL) isSameSet4:(int)value1 value2:(int)value2
{
    return [self findSet4:value1] == [self findSet4:value2];
}


#pragma mark - 5、并查集的实现（路径压缩,使得所有节点都指向跟节点）

- (int)findSet5:(int)value
{
    while([self.parents[value] intValue] != value){
		int temp = [self findSet5:[self.parents[value] intValue]];
        self.parents[value] = [NSString stringWithFormat:@"%d",temp];
    }
    return [self.parents[value] intValue];
}

- (int)findUnionSet5_2:(int)value
{
    int v = value;
    while(v != [self.parents[v] intValue]){
        v = [self.parents[v] intValue];
    }
    return v;
}
- (void)unionSet5:(int)value1 value2:(int)value2
{
    int v1 = [self findUnionSet5_2:value1];
    int v2 = [self findUnionSet5_2:value2];
    if(v1 == v2) return;

    if (self.ranks[v1] > self.ranks[v2]) {
        self.parents[v2] = [NSString stringWithFormat:@"%d",v1];
    }else if (self.ranks[v1] < self.ranks[v2]){
        self.parents[v1] = [NSString stringWithFormat:@"%d",v2];
    }else{
        self.parents[v1] = [NSString stringWithFormat:@"%d",v2];
        int height = [self.ranks[v1] intValue] + 1;
        self.ranks[v2] = [NSString stringWithFormat:@"%d",height];
    }
}
- (BOOL) isSameSet5:(int)value1 value2:(int)value2
{
    return [self findUnionSet5_2:value1] == [self findUnionSet5_2:value2];
}


#pragma mark - 6、并查集的实现（基于rank优化，路径分裂Path Spliting）

- (int)findSet6:(int)value
{
    while(value != [self.parents[value] intValue]){
		int parent = [self.parents[value] intValue];
		int pp = [self.parents[parent] intValue];
		self.parents[value] = [NSString stringWithFormat:@"%d",pp];
		value = parent;
    }
    return value;
}
- (int)findUnionSet6_2:(int)value
{
    int v = value;
    while(v != [self.parents[v] intValue]){
        v = [self.parents[v] intValue];
    }
    return v;
}
- (void)unionSet6:(int)value1 value2:(int)value2
{
    int v1 = [self findUnionSet6_2:value1];
    int v2 = [self findUnionSet6_2:value2];
    if(v1 == v2) return;

    if (self.ranks[v1] > self.ranks[v2]) {
        self.parents[v2] = [NSString stringWithFormat:@"%d",v1];
    }else if (self.ranks[v1] < self.ranks[v2]){
        self.parents[v1] = [NSString stringWithFormat:@"%d",v2];
    }else{
        self.parents[v1] = [NSString stringWithFormat:@"%d",v2];
        int height = [self.ranks[v1] intValue] + 1;
        self.ranks[v2] = [NSString stringWithFormat:@"%d",height];
    }
}
- (BOOL) isSameSet6:(int)value1 value2:(int)value2
{
    return [self findUnionSet6_2:value1] == [self findUnionSet6_2:value2];
}

#pragma mark - 7、并查集的实现（基于rank的优化方案：路径减半）

- (int)findSet7:(int)value
{
    while(value != [self.parents[value] intValue]){
		int parent = [self.parents[value] intValue];
		int pp = [self.parents[parent] intValue];
		self.parents[value] = [NSString stringWithFormat:@"%d",pp];
		value = [self.parents[value] intValue];
    }
    return value;
}
- (int)findUnionSet7_2:(int)value
{
    int v = value;
    while(v != [self.parents[v] intValue]){
        v = [self.parents[v] intValue];
    }
    return v;
}
- (void)unionSet7:(int)value1 value2:(int)value2
{
    int v1 = [self findUnionSet7_2:value1];
    int v2 = [self findUnionSet7_2:value2];
    if(v1 == v2) return;

    if (self.ranks[v1] > self.ranks[v2]) {
        self.parents[v2] = [NSString stringWithFormat:@"%d",v1];
    }else if (self.ranks[v1] < self.ranks[v2]){
        self.parents[v1] = [NSString stringWithFormat:@"%d",v2];
    }else{
        self.parents[v1] = [NSString stringWithFormat:@"%d",v2];
        int height = [self.ranks[v1] intValue] + 1;
        self.ranks[v2] = [NSString stringWithFormat:@"%d",height];
    }
}
- (BOOL) isSameSet7:(int)value1 value2:(int)value2
{
    return [self findUnionSet7_2:value1] == [self findUnionSet7_2:value2];
}


- (NSString *)description
{
    NSString *printstr = [[NSMutableString alloc] init];
    for (int i = 0; i < self.parents.count; i++) {
        printstr = [printstr stringByAppendingFormat:@"%d-->%@,",i,self.parents[i]];
    }
    return printstr;
}
@end

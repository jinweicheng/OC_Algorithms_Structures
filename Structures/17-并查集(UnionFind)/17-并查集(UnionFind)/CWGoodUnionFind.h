//
//  CWGoodUnionFind.h
//  16-并查集(UnionFind)
//
//  Created by 程金伟 on 2019/10/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CWItem;
@interface CWGoodUnionFind : NSObject
@property (nonatomic,assign)  int count;
@property (nonatomic,strong)  NSMutableDictionary *dicItems;
// 初始化配置
- (instancetype)initWithSetCount:(int)count;
// 1、并查集的效率较好的实现方法（基于路径减半方法）
- (CWItem *)findSet:(NSString *)value;
- (void)unionSet:(NSString *)value1 value2:(NSString *)value2;
- (BOOL)isSameSet:(NSString *)value1 value2:(NSString *)value2;

@end


@interface CWItem:NSObject
// 可以考虑使用数组，但是进行赋值的时候需要对index进行特殊处理，不能覆盖。
@property(nonatomic,strong)CWItem *parent;
@property(nonatomic,copy)NSString *value;
@property(nonatomic,assign)NSInteger rank;
@property(nonatomic,copy)NSString *name;
@end



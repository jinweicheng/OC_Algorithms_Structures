//
//  CWGoodUnionFind.m
//  16-并查集(UnionFind)
//
//  Created by 程金伟 on 2019/10/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import "CWGoodUnionFind.h"

@interface CWGoodUnionFind()

@end

@implementation CWGoodUnionFind


#pragma mark - initWithSetCount

- (instancetype)initWithSetCount:(int)count
{
	if (self  = [super init]) {
		self.dicItems = [NSMutableDictionary dictionary];
		for (int i = 0; i < count; i++) {
			CWItem *item = [[CWItem alloc] init];
			item.value = [NSString stringWithFormat:@"value_%d",i];
			item.name = [NSString stringWithFormat:@"name_%d",i];
			[self.dicItems setObject:item forKey:item.value];
		}
	}
	return self;
}


#pragma mark - unionFind_find

- (CWItem *)findSet:(NSString *)value
{
	CWItem *item = self.dicItems[value];
	if (item == nil) {
		return NULL;
	}
	
    while(![item.value isEqual:item.parent.value]){
		item.parent = item.parent.parent;
		item = item.parent;
    }
    return item;
}


- (CWItem *)findUnionSet2:(NSString *)value
{
    CWItem *item = self.dicItems[value];
    if (item == nil) {
        return NULL;
    }
    
    while(![item.name isEqualToString:item.parent.name]){
        item = item.parent;
    }
    return item;
}

#pragma mark - unionFind_union

- (void)unionSet:(NSString *)value1 value2:(NSString *)value2
{
	CWItem *v1 = [self findUnionSet2:value1];
    CWItem *v2 = [self findUnionSet2:value2];
    if([v1 isEqual:v2]) return;

    if (v1.rank > v2.rank) {
		v2.parent = v1;
    }else if (v1.rank < v2.rank){
        v1.parent = v2;
    }else{
        v1.parent = v2;
		v2.rank +=1;
    }
}


#pragma mark - unionFind_same

- (BOOL)isSameSet:(NSString *)value1 value2:(NSString *)value2
{
    return [value1 isEqual:value2];
}

@end


#pragma mark - model

@implementation CWItem
- (instancetype)init
{
	if (self  = [super init]) {
		self.rank = 1;
		self.parent = self;
	}
	return self;
}

@end

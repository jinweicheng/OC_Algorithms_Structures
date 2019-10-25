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

- (instancetype)init
{
    if (self  = [super init]) {
        self.dicItems = [NSMutableDictionary dictionary];
    }
    return self;
}

- (instancetype)initWithSetCount:(NSArray *)array
{
	if (self  = [super init]) {
		self.dicItems = [NSMutableDictionary dictionary];
		for (int i = 0; i < array.count; i++) {
			CWItem *item = [[CWItem alloc] init];
            NSString *key = array[i];
			item.value = [NSString stringWithFormat:@"value_%@",key];
			item.name = [NSString stringWithFormat:@"name_%@",key];
            item.key = key;
            item.parent = item;
			[self.dicItems setObject:item forKey:key];
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
	
    while(![item.name isEqual:item.parent.name]){
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
//    CWItem *v1 = self.dicItems[value1];
//    CWItem *v2 = self.dicItems[value2];
    
	CWItem *v1 = [self findUnionSet2:value1];
    CWItem *v2 = [self findUnionSet2:value2];
    if([v1.name isEqualToString:v2.name]) return;

    if (v1.rank > v2.rank) {
        v2.parent = v1;
        v2.parent.key = v1.key;
        v2.parent.name = v1.name;
        v2.parent.value = v1.value;
    }else if (v1.rank < v2.rank){
        v1.parent = v2;
        v1.parent.key = v2.key;
        v1.parent.name = v2.name;
        v1.parent.value = v2.value;
    }else{
        v1.rank +=1;
        v1.parent = v2;
        v1.parent.key = v2.key;
        v1.parent.name = v2.name;
        v1.parent.value = v2.value;
    }
}


#pragma mark - unionFind_same

- (BOOL)isSameSet:(NSString *)value1 value2:(NSString *)value2
{
    CWItem *item1 = [self findUnionSet2:value1];
    CWItem *item2 = [self findUnionSet2:value2];
    return [item1.name isEqualToString:item2.name];
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

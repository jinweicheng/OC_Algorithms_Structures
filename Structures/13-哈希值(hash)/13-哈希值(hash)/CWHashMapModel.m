//
//  CWHashModel.m
//  13-哈希值(hash)
//
//  Created by mac on 2019/6/10.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import "CWHashMapModel.h"
/**< 打印类 */
#import "MJBinaryTreeInfo.h"
#import "MJBinaryTrees.h"

@implementation CWHashMapModel

- (instancetype)init{
    if (self = [super init]) {
        self.size = 0;
        self->_root = nil;
        _compare = [CWHashMapCompare new];
    }
    return self;
}

/**< 1、初始化配置 */
- (instancetype)initWithAge:(int)age height:(CGFloat)height name:(NSString *)name
{
    if (self == [super init]) {
        self.age = age;
        self.height = height;
        self.name = name;
        //self.hashV = [self hash];
    }
    return self;
}

/**< 2、model赋值 */
- (void)configNodeValue:(id)value key:(id)key
{
    
    if ([value isKindOfClass:[CWHashMapModel class]]) {
        CWHashMapModel *nvalue = value;
        self.name = nvalue.name;
        self.age  = nvalue.age;
        self.height = nvalue.height;
        self.key = key;
        _value = nvalue->_value;
    }else if([value isKindOfClass:[NSString class]]){
        self.name = [NSString stringWithFormat:@"%@",value];
        self.key = key;
    }
}


/**< private、自定哈希计算：用于计算出存放数组的下标 */
- (NSUInteger)hash
{
    NSUInteger hashValue = 0;
    NSString *ageHash = [NSString stringWithFormat:@"%d",self.age];
    NSString *heightHash = [NSString stringWithFormat:@"%0.f",self.height];
    hashValue = hashValue * 31 + [ageHash hash];
    hashValue = hashValue * 31 + [heightHash hash];
    hashValue = hashValue * 31 + [self.name hash];
    return hashValue;
}

/**< private、自定义key值比较：用于解决哈希冲突 */
- (BOOL)isEqual:(id)object
{
    if ([object isEqual:[NSNull null]]) {
        return false;
    }
    
    if (![object isKindOfClass:[CWHashMapModel class]]) {
        return false;
    }
    
    CWHashMapModel *model = object;
    if (self.age == model.age &&
        self.height == model.height &&
        [self.name isEqualToString:model.name]) {
        return  true;
    }
    return false;
}

- (NSString *)description
{
    if ([self->_value isKindOfClass:[CWHashMapModel class]]) {
        return [NSString stringWithFormat:@"%@",self.name];
    }else{
        return [NSString stringWithFormat:@"%@",self.name];
    }
}


#pragma mark - 打印工具

- (id)left:(CWHashMapModel *)node {
    return node.left;
}

- (id)right:(CWHashMapModel *)node {
    return node.right;
}

- (id)string:(CWHashMapModel *)node {
    
    if ([node->_value isKindOfClass:[CWHashMapModel class]]) {
        return [NSString stringWithFormat:@"%@_%@%@",node->_key,node.name,node.color == CWHashMapColorBlack?@"":@"_R"];
    }else{
        return [NSString stringWithFormat:@"%@_%@%@",node->_key,node.name,node.color == CWHashMapColorBlack?@"":@"_R"];
        //return [NSString stringWithFormat:@"%@_%@_%d_%0.f",node->_key,node.name,node.age,node.height];
    }
}

- (id)root {
    return self->_root;
}


@end

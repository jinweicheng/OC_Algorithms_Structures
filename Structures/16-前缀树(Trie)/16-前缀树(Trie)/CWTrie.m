//
//  CWTrie.m
//  16-前缀树(Trie)
//
//  Created by 程金伟 on 2019/7/6.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import "CWTrie.h"

@interface CWTrie (){
    CWTrie *_root;                                               // 跟节点
}
@property (nonatomic,strong)  CWTrie *parent;                    // 父节点
@property (nonatomic,strong)  NSMutableDictionary *childrens;    // 存放子节点
@property (nonatomic,copy)    NSString *value;                   // 完整的单词
@property (nonatomic,assign)    char c;                          // 节点的值
@property (nonatomic,assign)  BOOL word;                         // 是否单词
@end

@implementation CWTrie

- (instancetype)initWithParent:(CWTrie *)parent;
{
    if(self = [super init]){
        self.parent = parent;
    }
    return self;
}

/**
 1、前缀树添加元素
 */
- (id)addKey:(NSString *)key value:(NSString *)value
{
    if(self->_root == nil){
        _root = [[CWTrie alloc] initWithParent:nil];
    }
    

    CWTrie *nodep = self->_root;
    for(int i = 0;i < key.length;i++){
        char c = [key characterAtIndex:i];
        BOOL empty = nodep.childrens.count == 0;
        CWTrie *childNode = empty ? nil:(CWTrie *)[nodep.childrens objectForKey:[NSString stringWithFormat:@"%c",c]];
        if(childNode == nil){
            childNode = [[CWTrie alloc] initWithParent:nodep];
            childNode.c = c;
            nodep.childrens = empty ? [NSMutableDictionary dictionary]:nodep.childrens;
            [nodep.childrens setObject:childNode forKey:[NSString stringWithFormat:@"%c",c]];
        }
        nodep = childNode;
    }
    
    // 已经存在单词处理
    if(nodep.word){
        id old = nodep.value;
        nodep.value = value;
        return old;
    }
    
    
    // 新增一个单词
    nodep.word = true;
    nodep.value = value;
    self.size++;
    return nil;
    
}

/**
 2、前缀树删除单词元素
 */
- (id)delectKey:(NSString *)key
{
    // 获取最后的字符
    CWTrie *node = [self getNodeByKey:key];
    if(node == nil || !node.word) return nil;
    
    self.size--;
    id old = node.value;
    
    
    // 如果有子节点
    if(node.childrens != nil && node.childrens.count != 0){
        node.word = false;
        node.value = nil;
        return old;
    }
    
    // 如果没有节点
    CWTrie *parent = nil;
    while ((parent = node.parent) != nil) {
        [parent.childrens removeObjectForKey:[NSString stringWithFormat:@"%c",node.c]];
        if(parent.word || parent.childrens.count != 0)break;
        node = parent;
    }
	return old;
}

/**
 3、是否以某个前缀字符串开头
 */
- (BOOL)starWithStr:(NSString *)prefix
{
    CWTrie *node = [self getNodeByKey:prefix];
	return node != nil;
}

/**
 4、是否包含某个字符串
 */
- (BOOL)contains:(NSString *)str
{
    CWTrie *node = [self getNodeByKey:str];
	return node != nil && node.word;
}

/**
 5、前缀树的size
 */
- (int)trie_size
{
	return self.size;
}

/**
 6、前缀树是否为空
 */
- (BOOL)trie_isEmpty
{
	return self.size == 0;
}

/**
 7、前缀树的的清空
 */
- (void)trie_clear
{
	self.size = 0;
    self->_root = nil;
}

- (NSString *)get:(NSString *)key
{
    CWTrie *node = [self getNodeByKey:key];
    return node != nil && node.word ? node.value:nil;
}

- (CWTrie *)getNodeByKey:(NSString *)key
{
    CWTrie *node = self->_root;
    for (int i = 0; i < key.length && node != nil; i ++) {
        if (node == nil || node.childrens == nil || node.childrens.count == 0) {
            return nil;
        }
        NSString *c1 = [NSString stringWithFormat:@"%c",[key characterAtIndex:i]];
        CWTrie *childNode = [node.childrens objectForKey:c1];
        if(childNode == nil){
            return nil;
        }else{
           node = childNode;
        }
    }
    return node;
}
//-(NSString *)description
//{
//    return [NSString stringWithFormat:@"%@_%@",self->_value,self->_childrens];
//}

@end

//
//  CWTrie.h
//  16-前缀树(Trie)
//
//  Created by 程金伟 on 2019/7/6.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWTrie : NSObject

@property(nonatomic,assign)int size;

- (instancetype)initWithParent:(CWTrie *)parent;

/**
 1、前缀树添加元素
 */
- (id)addKey:(NSString *)key value:(NSString *)value;

/**
 2、前缀树删除元素
 */
- (id)delectKey:(NSString *)key;

/**
 3、是否以某个前缀字符串开头
 */
- (BOOL)starWithStr:(NSString *)prefix;

/**
 4、是否包含某个字符串
 */
- (BOOL)contains:(NSString *)str;

/**
 5、前缀树的size
 */
- (int)trie_size;

/**
 6、前缀树是否为空
 */
- (BOOL)trie_isEmpty;

/**
 7、前缀树的的清空
 */
- (void)trie_clear;

@end

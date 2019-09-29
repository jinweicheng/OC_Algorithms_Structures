//
//  main.m
//  16-前缀树(Trie)
//
//  Created by 程金伟 on 2019/7/6.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWTrie.h"
int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    
        CWTrie *trie = [CWTrie new];
        // 1、添加CWTrie
        [trie addKey:@"cat" value:@"1"];
        [trie addKey:@"dog" value:@"2"];
        [trie addKey:@"person" value:@"3"];
        [trie addKey:@"doggy" value:@"4"];
        
        NSLog(@"--------------------是否为前缀--------------------");
        NSLog(@"%d",[trie starWithStr:@"ca"]);
        NSLog(@"%d",[trie starWithStr:@"do"]);
        NSLog(@"%d",[trie starWithStr:@"dogg"]);
        NSLog(@"%d",[trie starWithStr:@"perso"]);
        
        NSLog(@"--------------------是否为单词--------------------");
        NSLog(@"%d",[trie starWithStr:@"cat"]);
        NSLog(@"%d",[trie starWithStr:@"dog"]);
        NSLog(@"%d",[trie starWithStr:@"doggy"]);
        NSLog(@"%d",[trie starWithStr:@"person"]);
        
        NSLog(@"--------------------是否为前缀--------------------");
        NSLog(@"%d",[trie starWithStr:@"catt"]);
        NSLog(@"%d",[trie starWithStr:@"persons"]);
        NSLog(@"%d",[trie starWithStr:@"aa"]);
        NSLog(@"%d",[trie starWithStr:@"oo"]);
        
        
        NSLog(@"%d",[trie trie_isEmpty]);
        NSLog(@"%d",[trie contains:@"dog"]);
        NSLog(@"%d",[trie trie_size]);
        
        // 2、删除
        NSLog(@"--------------------删除节点--------------------");
        NSLog(@"%@",[trie delectKey:@"cat"]);
        NSLog(@"%d",[trie trie_size]);
        NSLog(@"%@",[trie delectKey:@"doggy"]);
        NSLog(@"%d",[trie trie_size]);
	}
	return 0;
}

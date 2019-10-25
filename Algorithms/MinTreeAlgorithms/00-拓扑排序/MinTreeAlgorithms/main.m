//
//  main.m
//  MinTreeAlgorithms
//
//  Created by mac on 2019/10/21.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWGraph.h"



// 1、拓扑排序
void topologicalSort ()
{
    
    CWGraph *graph1 = [[CWGraph alloc] init];
    // A -> B
    [graph1 addEdgeFrom:@"A" to:@"B" value:@""];
    // B -> C  B -> E  B -> E
    [graph1 addEdgeFrom:@"B" to:@"C" value:@""];
    [graph1 addEdgeFrom:@"B" to:@"D" value:@""];
    [graph1 addEdgeFrom:@"B" to:@"E" value:@""];
    // C -> E  D -> E
    [graph1 addEdgeFrom:@"C" to:@"E" value:@""];
    [graph1 addEdgeFrom:@"D" to:@"E" value:@""];
    // E -> F
    [graph1 addEdgeFrom:@"E" to:@"F" value:@""];
    
//    NSLog(@"%@",graph1);
    // 打印数据
    [graph1 topologicalSort:@"A"];
    NSLog(@"==============");

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        topologicalSort();
        
        
        
        
    }
    return 0;
}

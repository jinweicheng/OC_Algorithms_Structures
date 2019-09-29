//
//  main.m
//  02-动态数组(Dynamic)
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWArrayList.h"
#import "CWArrayListEModel.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
        
        
        CWArrayList *array = [[CWArrayList alloc] init];
        
        // 1、add
        
        CWArrayListEModel *model1 = [[CWArrayListEModel alloc] init];
        model1.age = 10;
        model1.name = @"c";
        CWArrayListEModel *model2 = [[CWArrayListEModel alloc] init];
        model2.age = 20;
        model2.name = @"j";
        CWArrayListEModel *model3 = [[CWArrayListEModel alloc] init];
        model3.age = 30;
        model3.name = @"w";
        [array cw_addE:model1];
        [array cw_addE:model2];
        [array cw_addE:model3];
        
        [array cw_addE:@"123"];
        
        NSLog(@"%@",array);
        
        
        
//        id test1 = @"888888";
//        id test2 = [[CWArrayListEModel alloc] init];
//        if ([test1 isKindOfClass:[CWArrayListEModel class]]) {
//            NSLog(@"CWArrayListEModel");
//        }
        
    }
    return 0;
}

void test1()
{
    CWArrayList *array = [[CWArrayList alloc] init];
    
    // 1、add
    [array cw_addE:@"1"];
    [array cw_addE:@"2"];
    [array cw_addE:@"3"];
    //NSLog(@"array:%@",array);
    
    // 2、clear
    //        [array cw_clear];
    //NSLog(@"array:%@",array);
    
    [array cw_addE:@"4"];
    [array cw_addE:@"5"];
    [array cw_addE:@"6"];
    
    //NSLog(@"array:%@",array);
    
    // 3、size
    //NSLog(@"size:%d",array.cw_size);
    
    // 4、isEmpty
    //NSLog(@"isEmpty:%d",array.cw_isEmpty);
    //[array cw_clear];
    //NSLog(@"isEmpty:%d",array.cw_isEmpty);
    
    
    //NSLog(@"array:%@",array);
    // 5、isContainE
    //NSLog(@"isContainE:%d",[array cw_isContainE:@"1"]);
    
    // 6、cw_getIndex
    //NSLog(@"%@ %@",[array cw_getIndex:0],[array cw_getIndex:5]);
    
    // 7、cw_setE
    //[array cw_setE:0 E:@"0"];
    //[array cw_setE:5 E:@"6"];
    //NSLog(@"%@",array);
    
    // 8、 cw_removeE
    //        [array cw_addE:@"8" index:0];
    //        NSLog(@"%@",array);
    //        [array cw_addE:@"10" index:7];
    //        NSLog(@"%@",array);
    //
    //        [array cw_removeE:0];
    //        NSLog(@"%@",array);
    //        [array cw_removeE:6];
    //        NSLog(@"%@",array);
    //        [array cw_removeE:2];
    //        NSLog(@"%@",array);
    
    
    
    // 9、扩容
    [array cw_addE:@"7"];
    [array cw_addE:@"8"];
    [array cw_addE:@"9"];
    NSLog(@"%@",array);
    [array cw_addE:@"10"];
    NSLog(@"%@",array);
    
    [array cw_addE:@"11"];
    NSLog(@"%@",array);
    
    // 10、降容
    [array cw_removeE:0];
    [array cw_removeE:0];
    [array cw_removeE:0];
    [array cw_removeE:0];
    NSLog(@"%@",array);
}

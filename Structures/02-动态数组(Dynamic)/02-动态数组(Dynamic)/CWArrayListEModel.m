//
//  CWArrayListEModel.m
//  02-动态数组(Dynamic)
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWArrayListEModel.h"

@implementation CWArrayListEModel

-(NSString *)description
{
    return [NSString stringWithFormat:@"age:%ld name:%@",_age,_name];
}

- (void)dealloc
{
    NSLog(@"Model-dealloc");
}
@end

//
//  CWRBTreeCompare.h
//  12-映射(Map)
//
//  Created by 程金伟 on 2019/6/7.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWRBTreeCompare : NSObject

@property (nonatomic,assign)  int age;
@property (nonatomic,copy) NSString *name;

- (int)compareValue:(id)oldN oldValue:(id)newN;

@end

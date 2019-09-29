//
//  CWRBTCompareModel.h
//  10-RBT红黑树(RedBlackTree)
//
//  Created by mac on 2019/6/3.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWRBTCompareModel : NSObject

@property (nonatomic,assign)  int age;
@property (nonatomic,copy) NSString *name;

- (int)compareValue:(id)pareterNode oldValue:(id)newNode;

@end

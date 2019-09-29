//
//  CWBSTCompareModel.h
//  08-二叉搜索树
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWBSTCompareModel : NSObject

@property (nonatomic,assign)  int age;
@property (nonatomic,copy) NSString *name;

- (int)compareValue:(id)pareterNode oldValue:(id)newNode;

@end

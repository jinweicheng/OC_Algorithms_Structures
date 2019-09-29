//
//  CWAVLCompareModel.h
//  09-AVL平衡树
//
//  Created by mac on 2019/5/30.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWAVLCompareModel : NSObject

@property (nonatomic,assign)  int age;
@property (nonatomic,copy) NSString *name;

- (int)compareValue:(id)pareterNode oldValue:(id)newNode;

@end

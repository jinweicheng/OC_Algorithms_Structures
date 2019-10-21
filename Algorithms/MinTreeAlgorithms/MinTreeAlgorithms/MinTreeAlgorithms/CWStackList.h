//
//  CWStackList.h
//  06-栈
//
//  Created by 程金伟 on 2019/5/15.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWStackList : NSObject

@property (nonatomic,assign)  int size;              /**< 数组size */

/**
 1、数组的大小
 */
- (int)cw_size;

/**
 2、数组是否为空
 */
- (BOOL)cw_isEmpty;

/**
 3、新增某元素
 */
- (void)cw_push:(id)E;

/**
 4、新增某元素
 */
- (id)cw_pop;

/**
 5、新增某元素
 */
- (id)cw_top;

@end

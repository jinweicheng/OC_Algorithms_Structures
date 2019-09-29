//
//  CWArrayList.m
//  02-动态数组
//
//  Created by mac on 2019/5/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWArrayList.h"

@implementation CWArrayList

- (instancetype)init{
    if (self = [super init]) {
        self.capacity = 10;
        self.array = [NSMutableArray arrayWithCapacity:self.capacity];
        self.size = 0;
    }
    return self;
}

/**
 1、清空数据数据
 */
- (void)cw_clear
{
    self.size = 0;
    
    // 存放数组对象，内存管理
    for (int i = 0; i < self.size; i++) {
        self.array[i] = nil;
    }
}

/**
 2、数组的大小
 */
- (int)cw_size
{
    return self.size;
}

/**
 3、数组是否为空
 */
- (BOOL)cw_isEmpty
{
    return self.size == 0;
}

/**
 4、是否包含某元素
 */
- (BOOL)cw_isContainE:(id)E
{
    return [self cw_indexOf:E] != -1;
}

/**
 5、根据下标查找某元素
 */
- (id)cw_getIndex:(int)index
{
    [self private_throwException:index];
    return self.array[index];
}

/**
 6、根据下标设置某元素
 */
- (id)cw_setE:(int)index E:(id)E
{
    [self private_throwException:index];
    id obj = self.array[index];
    self.array[index] = E;
    return obj;
}

/**
 7、新增某元素
 */
- (void)cw_addE:(id)E
{
//    self.array[self.cw_size] = E;
//    self.cw_size++;
    
    [self cw_addE:E index:self.size];
}

/**
 8、新增某个index下新增元素
 */
- (void)cw_addE:(id)E index:(int)index
{
    [self private_addThrowException:index];
    [self private_expandCap];
    for (int i = self.size; i > index; i--) {
        self.array[i] = self.array[i-1];
    }
    self.array[index] = E;
    self.size++;
}

/**
 9、移除index元素
 */
- (id)cw_removeIndex:(int)index
{
    [self private_throwException:index];
    [self private_reduceCap];
    id obj = self.array[index];
    
    for (int i = index; i < self.size-1; i++) {
        self.array[i] = self.array[i+1];
    }
    // 数组对象内存管理
    self.array[self.size-1] = nil;
    self.size--;
    return obj;
}


/**
 10、移除index元素
 */
- (id)cw_removeE:(id)E
{
    int index = [self cw_indexOf:E];
    return [self cw_removeIndex:index];
}



/**
 11、根据元素查找下标
 */
- (int)cw_indexOf:(id)E
{
    for (int i = 0;i < self.size;i++) {
        if ([self.array[i] isEqual:E]) {
            return i;
        }
    }
    return -1;
}

/**
  12、异常检测处理
 */
- (void)private_throwException:(int)index
{
    if (index < 0 || index >= self.size) {
        @throw [NSException exceptionWithName:@"array out of bounds" reason:@"index out of bounds" userInfo:nil];
    }
}

/**
 12-2、添加异常检测处理
 */
- (void)private_addThrowException:(int)index
{
    if (index < 0 || index > self.size) {
        @throw [NSException exceptionWithName:@"array out of bounds" reason:@"index out of bounds" userInfo:nil];
    }
}


/**
  13、动态数组的capacity扩容
 */
- (void)private_expandCap
{
    if (self.size == self.capacity) {
        self.capacity = (int)(1.5 * self.capacity);
        NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:self.capacity];
        for (int i = 0; i < self.size; i++) {
            newArray[i] = self.array[i];
        }
        self.array = newArray.mutableCopy;
    }
}

/**
 14、动态数组的capacity降容
 */
- (void)private_reduceCap
{
    if ((int)(self.capacity / 1.5) == self.size) {
        self.capacity = (int)(self.capacity/1.5);
        NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:self.capacity];
        for (int i = 0; i < self.size; i++) {
            newArray[i] = self.array[i];
        }
        self.array = newArray.mutableCopy;
    }
}


/**
 14、打印动态数组元素
 */
- (NSString *)description
{
    NSString *temp = [NSString stringWithFormat:@"capacity=%d,count=%d [",self.capacity,self.size];
    
    for (int i = 0; i < self.size; i ++) {
        if (i == self.size -1) {
            temp = [temp stringByAppendingFormat:@"%d-%@",i,self.array[i]];
        }else{
            temp = [temp stringByAppendingFormat:@"%d-%@, ",i,self.array[i]];
        }
    }
    temp = [temp stringByAppendingString:@"]"];
    return temp;
}


- (void)dealloc
{
    NSLog(@"ArrayList-dealloc");
}


//- (NSString *)description
//{
//    NSString *temp = [NSString stringWithFormat:@"%d [",self.cw_size];
//
//    for (int i = 0; i < self.capacity; i ++) {
//        if (i < self.cw_size) {
//            if (i == self.cw_size -1) {
//                temp = [temp stringByAppendingFormat:@"%d-%@",i,self.array[i]];
//            }else{
//                temp = [temp stringByAppendingFormat:@"%d-%@, ",i,self.array[i]];
//            }
//        }else{
//            temp = [temp stringByAppendingString:@",nul"];
//        }
//
//    }
//    temp = [temp stringByAppendingString:@"]"];
//    return temp;
//}



@end

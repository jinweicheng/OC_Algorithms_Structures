//
//  CWDoubleCycleNode.m
//  05-循环链表
//
//  Created by mac on 2019/5/13.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWDoubleCycleNode.h"

@interface CWDoubleCycleNode (){
    id ele;                                          // 元素
    CWDoubleCycleNode *_first;                       // 头链表
    CWDoubleCycleNode *_last;                        // 尾链表
}
@property(nonatomic,strong)CWDoubleCycleNode *next;  // 头链表
@property (nonatomic,weak) id prev;                  // 尾链表

@end

@implementation CWDoubleCycleNode

/**
 0、初始化node节点
 */
- (instancetype)init{
    if (self = [super init]) {
        self.size = 0;
        self->_first = nil;
        self->_last = nil;
    }
    return self;
}

- (CWDoubleCycleNode *)private_initListNodeNext:(CWDoubleCycleNode *)next prev:(CWDoubleCycleNode *)prev E:(id)E
{
    // 创建新node
    CWDoubleCycleNode *node = [[CWDoubleCycleNode alloc] init];
    node.next = next;
    node.prev = prev;
    node->ele = E;
    node->_first = nil;
    node->_last = nil;
    return node;
}


/**
 1、链表新增某元素
 */
- (void)cw_addE:(id)E
{
    [self cw_addE:E index:self.size];
}

/**
 2、链表新增某个index下新增元素
 */
- (void)cw_addE:(id)E index:(int)index
{
    [self private_addThrowException:index];
    
    // 优化
    // 1、第一个元素和添加最后
    if (index == self.size) {
        CWDoubleCycleNode *lastN = self->_last;
        CWDoubleCycleNode *currenN = nil;
        // 1-1、第一次添加的元素
        if (lastN == nil) {
            currenN = [self private_initListNodeNext:nil prev:nil E:E];
            self->_first = currenN;
            self->_last = currenN;
        }
        // 1-2、往最后位置添加元素
        else{
            currenN = [self private_initListNodeNext:nil prev:lastN E:E];
            lastN.next = currenN;
            self->_last = currenN;
        }
    }
    // 2、往中间位置添加元素（包含头位置）
    else{
        CWDoubleCycleNode *target = [self cw_getIndex:index];
        CWDoubleCycleNode *prevN = target.prev;
        //        CWDoubleCycleNode *nextN = target.next;
        CWDoubleCycleNode *newN = [self private_initListNodeNext:target prev:prevN E:E];
        // 添加index=0位置
        if (prevN == nil) {
            self->_first = newN;
        }else{
            prevN.next = newN;
        }
        
        
    }
    self.size++;
    
}

/**
 3、链表移除index元素
 */
- (id)cw_removeIndex:(int)index
{
    [self private_throwException:index];
    
    CWDoubleCycleNode *node = [self cw_getIndex:index];
    CWDoubleCycleNode *nextN = node.next;
    CWDoubleCycleNode *prevN = node.prev;
    // 删除第一个元素
    if (prevN == nil) {
        self->_first = nextN;
    }else{
        prevN.next = nextN;
    }
    
    // 删除最后一个元素
    if (nextN == nil) {
        self->_last = prevN;
    }else{
        nextN.prev = prevN;
    }
    self.size--;
    return node->ele;
}

/**
 4、链表移除index元素
 */
- (id)cw_removeE:(id)E
{
    int index = [self cw_indexOf:E];
    return [self cw_removeIndex:index];
}

/**
 5、链表根据元素查找下标
 */
- (int)cw_indexOf:(id)E
{
    int index = 0;
    CWDoubleCycleNode *node = self->_first;
    while (node != nil) {
        if ([node->ele isEqual:E]) {
            return index;
        }
        node = node.next;
        index++;
    }
    return -1;
}


/**
 6、清空链表数据
 */
- (void)cw_clear
{
    self.size = 0;
    // 内存管理
    self->_first = nil;
    self->_last = nil;
    
    // iOS开发的内存优化处理
    CWDoubleCycleNode *node = self->_last;
    while (node != nil) {
        node.next = nil;
        node = node.prev;
    }
}

/**
 7、链表的大小
 */
- (int)cw_size
{
    return self.size;
}

/**
 8、链表是否为空
 */
- (BOOL)cw_isEmpty
{
    return self.size == 0;
}

/**
 9、是否包含某元素
 */
- (BOOL)cw_isContainE:(id)E
{
    return [self cw_indexOf:E] != -1;
}

/**
 10、根据下标查找某元素
 */
- (id)cw_getIndex:(int)index
{
    [self private_addThrowException:index];
    CWDoubleCycleNode *node = nil;
    // index处于前半部分
    if (index <= self.size/2) { // 或者self.size >> 1
        node = self->_first;
        for (int i = 0; i < index; i++) {
            node = node.next;
        }
    }
    // index处于后半部分
    else if (index > self.size/2){
        node = self->_last;
        for (int i = self.size - 1; i > index; i--) {
            node = node.prev;
        }
    }
    return node;
}


/**
 11、异常检测处理
 */
- (void)private_throwException:(int)index
{
    if (index < 0 || index >= self.size) {
        @throw [NSException exceptionWithName:@"listNode out of bounds" reason:@"index out of bounds" userInfo:nil];
    }
}

/**
 12、添加异常检测处理
 */
- (void)private_addThrowException:(int)index
{
    if (index < 0 || index > self.size) {
        @throw [NSException exceptionWithName:@"listNode out of bounds" reason:@"index out of bounds" userInfo:nil];
    }
}

/**
 13、打印链表元素
 */
- (NSString *)description
{
    NSString *temp = [NSString stringWithFormat:@"listNode:["];
    CWDoubleCycleNode *node = self->_first;;
    for (int i = 0; i < self.size; i ++) {
        
        if (i == self.size -1) {
            temp = [temp stringByAppendingFormat:@"%@",node->ele];
        }else{
            temp = [temp stringByAppendingFormat:@"%@->",node->ele];
        }
        node = node.next;
        
    }
    temp = [temp stringByAppendingString:@"]"];
    return temp;
}


//- (void)dealloc
//{
//    NSLog(@"ListNode-dealloc");
//}



@end

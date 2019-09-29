//
//  CWSingleCycleNode.m
//  05-循环链表
//
//  Created by mac on 2019/5/13.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWSingleCycleNode.h"

@interface CWSingleCycleNode (){
    id ele;                            // 元素
    CWSingleCycleNode *next;           // 下一个指针
    CWSingleCycleNode *_first;         // first指针
}

@end

@implementation CWSingleCycleNode

/**
 0、初始化node节点
 */
- (instancetype)init{
    if (self = [super init]) {
        self.size = 0;
        self->_first = nil;
    }
    return self;
}

- (CWSingleCycleNode *)private_initListNodeNext:(CWSingleCycleNode *)next E:(id)E
{
    // 创建新node
    CWSingleCycleNode *node = [[CWSingleCycleNode alloc] init];
    node->next = next;
    node->ele = E;
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
    if (index == 0) {// 添加头节点
        CWSingleCycleNode *node = [self private_initListNodeNext:self->_first E:E];
        if (self.size == 0) {
            node->next = node;
        }else{
            CWSingleCycleNode *endN = [self cw_getIndex:self.size-1];
            endN->next = node;
        }
		self->_first = node;
        
    }else{          // 添加中间节点，最后节点
        CWSingleCycleNode *prevN = [self cw_getIndex:index-1];
        CWSingleCycleNode *insertN = [self private_initListNodeNext:prevN->next E:E];
        if (index == self.size - 1) { // 添加最后位置
            insertN->next = self->_first;
        }
        prevN->next = insertN;
    }
    self.size++;
}

/**
 3、链表移除index元素
 */
- (id)cw_removeIndex:(int)index
{
    [self private_throwException:index];
    CWSingleCycleNode *node;
    // 1、删除头节点
    if (index == 0) {
        node = [self cw_getIndex:index];
		
        // 获取最后节点
        CWSingleCycleNode *endN = [self cw_getIndex:self.size - 1];
		self->_first = node->next;
		endN->next = self->_first;
        
    }
    // 2、删除中间节点 ，最后节点
    else{
        //2-1、获取前一节点
        node = [self cw_getIndex:index-1];
        // 2-2、指向当前节点的下一节点
        node->next = node->next->next;
        // 2-3、获取最后节点
        if (index == self.size - 1) {
            node->next = self->_first;
        }
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
    CWSingleCycleNode *node = self->_first;
    while (node != nil) {
        if ([node->ele isEqual:E]) {
            return index;
        }
        node = node->next;
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
    [self private_throwException:index];
    CWSingleCycleNode *node = self->_first;
    while (index) {
        node = node->next;
        index--;
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
    NSString *temp = [NSString stringWithFormat:@"listNode:size-%d,[",self.size];
    
    CWSingleCycleNode *node;
    CWSingleCycleNode *nextN;
    for (int i = 0; i < self.size; i ++) {
        node = [self cw_getIndex:i];
        if (node != nil) {
            nextN = node->next;
        }
        if (i == self.size -1) {
            temp = [temp stringByAppendingFormat:@"%@_%@",node->ele,nextN->ele];
        }else{
            temp = [temp stringByAppendingFormat:@"%@_%@, ",node->ele,nextN->ele];
        }
    }
    temp = [temp stringByAppendingString:@"]"];
    return temp;
}


//- (void)dealloc
//{
//    NSLog(@"ListNode-dealloc");
//}



@end

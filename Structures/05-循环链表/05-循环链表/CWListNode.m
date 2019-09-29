//
//  CWListNode.m
//  03-链表
//
//  Created by mac on 2019/5/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWListNode.h"

@interface CWListNode (){
    id ele;                     // 元素
    CWListNode *next;           // 下一个指针
    CWListNode *_first;         // first指针
}

@end

@implementation CWListNode

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

- (CWListNode *)private_initListNodeNext:(CWListNode *)next E:(id)E
{
    // 创建新node
    CWListNode *node = [[CWListNode alloc] init];
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
        self->_first = [self private_initListNodeNext:_first E:E];
    }else{          // 添加中间节点，最后节点
        CWListNode *prevN = [self cw_getIndex:index-1];
        CWListNode *insertN = [self private_initListNodeNext:prevN->next E:E];
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
    CWListNode *node;
    if (index == 0) {//删除头节点
        node = [self cw_getIndex:index];
        self->_first = node->next;
    }else{          // 删除中间节点 ，最后节点
        //1、获取头节点
        node = [self cw_getIndex:index-1];
        // 2、指向当前节点的下一节点
        node->next = node->next->next;
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
    CWListNode *node = self->_first;
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
    CWListNode *node = self->_first;
    while (index) {
        node = node->next;
        index--;
    }
    return node;
}


/**
 11、反转链表
 */
- (CWListNode *)cw_reverseListNode:(CWListNode *)head
{
    CWListNode *reverseN = NULL;
    while (head != NULL) {
        CWListNode *temp = head->next;
        head->next = reverseN;
        reverseN = head;
        head = temp;
    }
    return reverseN;
}


/**
 12、异常检测处理
 */
- (void)private_throwException:(int)index
{
    if (index < 0 || index >= self.size) {
        @throw [NSException exceptionWithName:@"listNode out of bounds" reason:@"index out of bounds" userInfo:nil];
    }
}

/**
 13、添加异常检测处理
 */
- (void)private_addThrowException:(int)index
{
    if (index < 0 || index > self.size) {
        @throw [NSException exceptionWithName:@"listNode out of bounds" reason:@"index out of bounds" userInfo:nil];
    }
}



/**
 14、打印链表元素
 */
- (NSString *)description
{
    NSString *temp = [NSString stringWithFormat:@"listNode:size-%d,[",self.size];

    CWListNode *node;
    for (int i = 0; i < self.size; i ++) {
        node = [self cw_getIndex:i];
        if (i == self.size -1) {
            temp = [temp stringByAppendingFormat:@"%d-%@",i,node->ele];
        }else{
            temp = [temp stringByAppendingFormat:@"%d-%@, ",i,node->ele];
        }
    }
    temp = [temp stringByAppendingString:@"]"];
    return temp;
}


- (void)dealloc
{
    NSLog(@"ListNode-dealloc");
}



@end

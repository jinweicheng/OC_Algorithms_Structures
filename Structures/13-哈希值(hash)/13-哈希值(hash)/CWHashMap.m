//
//  CWHashMap.m
//  13-哈希值(hash)
//
//  Created by mac on 2019/6/11.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import "CWHashMap.h"
#import "CWHashMapModel.h"
/**< 打印类 */
#import "MJBinaryTreeInfo.h"
#import "MJBinaryTrees.h"

@interface CWHashMap (){
    int DEFAULTCAPACITY;                // 默认哈希表大小
}
@property (nonatomic,strong)  CWHashMapModel *model;
@end


@implementation CWHashMap

#pragma mark - 哈希表的初始化方法
- (instancetype)init{
    if (self = [super init]) {
        self.size = 0;
        self.model = [[CWHashMapModel alloc] init];
        DEFAULTCAPACITY = 1 << 4;
        _hashTable = [NSMutableArray arrayWithCapacity:DEFAULTCAPACITY];
        for (int i = 0; i < DEFAULTCAPACITY; i ++) {
            _hashTable[i] = [NSNull null];
        }
    }
    return self;
}

- (CWHashMapModel *)private_initListNodeNext:(CWHashMapModel *)parent key:(id)key value:(id)value
{
    CWHashMapModel *bst = [[CWHashMapModel alloc] init];
    bst.parent = parent;
    bst.key = key;
    bst.hashV = [key hash];
//    bst->_value = value;
    [bst configNodeValue:value key:key];
    bst.color = CWHashMapColorRed;
    // 创建新node
    int index = [self indexOfKey:key];
    CWHashMapModel *node = _hashTable[index];
    if ([node isEqual:[NSNull null]]) {
        bst.color = CWHashMapColorBlack;
        bst.root = bst;
    }
    return bst;
}


#pragma mark - 哈希表的方法
/**
 1、哈希表新增某元素
 */
- (void)cw_addNodeWithKey:(id)key value:(id)value
{
    // 1、root节点设置
    //int index = [self indexOfKey:key value:value];
    int index = [self indexOfKey:key];
    CWHashMapModel *nodeR = _hashTable[index];
    if([nodeR isEqual:[NSNull null]]){
        nodeR = [self private_initListNodeNext:nil key:key value:value];
        _hashTable[index] = nodeR;
        nodeR->_root = nodeR;
        self.size++;
        //[self private_afterAdd:nodeR->_root];
        return;
    }
    
    // 2、寻找父节点
    CWHashMapModel *node = _hashTable[index];
    CWHashMapModel *parent = _hashTable[index];
    NSInteger result = 0;
    while (node != nil) {
        result = [self private_compare:node.key newValue:key];
        parent = node;
        if (result>0) {
            node = node.right;
        }else if (result<0){
            node = node.left;
        }else{
            break;
        }
    }
    
    // 3、设置left、right节点
    CWHashMapModel *insert = [self private_initListNodeNext:parent key:key value:value];
    if (result>0) {
        parent.right = insert;
    }else if (result<0){
        parent.left = insert;
    }else{
        parent->_value = insert->_value;
    }
    self.size++;
    [self private_afterAdd:insert];
    
}

/**
 2、哈希表移除index元素
 */

- (id)cw_removeForKey:(id)key
{
    return [self cw_removeNode:[self getNodeWithKey:key]];
}

- (id)cw_removeNode:(CWHashMapModel *)bst
{
    if (bst == nil) {
        return nil;
    }
    // 1、度为2的节点
    if ([self hasTwoChildrenForNode:bst]) {
        // 找前序节点(前序节点或者后序节点一定是度为0或者1)
        CWHashMapModel *predecessor = [self predecessorNode:bst];
        bst.key = predecessor.key;
        bst->_value = predecessor->_value;
        bst = predecessor;
    }
    // 2、度为1或者为0
    CWHashMapModel *replace = bst.left != nil ? bst.left:bst.right;
    // 度为1节点
    if (replace != nil) {
        // 2-1、删除的节点为root
        CWHashMapModel *rmap = _hashTable[[self indexOfKey:bst.key]];
        if (rmap == rmap.root) {
            replace.parent = nil;
            bst.root = replace;
        }
        // 2-2、是否为右子节点
        else if ([self isRightNode:bst]){
            replace.parent = bst.parent;
            bst.parent.right = replace;
        }
        // 2-3、是否为左子节点
        else if ([self isLeftNode:bst]){
            replace.parent = bst.parent;
            bst.parent.left = replace;
        }
        [self private_afterRemove:bst replaceNode:replace];
    }
    // 3、度为0的节点
    else{
        int index = [self indexOfKey:bst.key];
         CWHashMapModel *rmap = _hashTable[index];
        // 3-1、删除的节点为root
        if (bst == rmap.root) {
            bst.root = nil;
            _hashTable[index] = [NSNull null];
            return rmap;
        }
        // 3-2、删除的节点为右节点
        else if ([self isRightNode:bst]) {
            bst.parent.right = nil;
        }
        // 3-3、删除的节点为左节点
        else if([self isLeftNode:bst]){
            bst.parent.left = nil;
        }
        [self private_afterRemove:bst replaceNode:nil];
    }
    self.size--;
    return bst;
}

/**
 3、哈希表查找key对应的节点
 */
- (CWHashMapModel *)getNodeWithKey:(id)key{

    // 1、获取index
    int index = [self indexOfKey:key];
    CWHashMapModel *nodeR = _hashTable[index];
    // 2、查找node节点
    NSInteger compare;
    while (nodeR != nil) {
        compare = [self private_compare:nodeR.key newValue:key];
        if (compare > 0) {
            nodeR = nodeR.right;
        }else if (compare < 0){
            nodeR = nodeR.left;
        }else{
            return nodeR;
        }
    }
    return nil;
}

/**
 4、是否包含value的node
 */
- (BOOL)isContainValue:(id)value key:(id)key
{
    BOOL isContain = false;
    // 定义个数组，用于队列功能(先进先出功能)
    NSMutableArray *queues = [NSMutableArray array];
    for (int i = 0; i < self.size && !isContain; i++) {
        int index = [self indexOfKey:key];
        CWHashMapModel *rmap = _hashTable[index];
        CWHashMapModel *node = rmap.root;
        if (node != nil) {
            [queues addObject:node];
        }
        while (queues.count != 0) {
            CWHashMapModel *outNode = queues.firstObject;
            // 出队列
            [queues removeObjectAtIndex:0];
            
            if ([value isKindOfClass:[CWHashMapModel class]]) {
                if ([value isEqual:outNode]) {
                    isContain = true;
                    break;
                }
            }else if ([value isKindOfClass:[NSString class]]){
                if ([value isEqualToString:outNode.name]) {
                    isContain = true;
                    break;
                }
            }
            

            if (outNode.left != nil) {
                [queues addObject:outNode.left];
            }
            
            if (outNode.right != nil) {
                [queues addObject:outNode.right];
            }
        }
    }
    return isContain;
}


/**
 5、哈希表清空数据数据
 */
- (void)cw_clear
{
    if(self.size == 0) return;
    self.size = 0;
    for (int i = 0; i < _hashTable.count; i ++) {
        _hashTable[i] = [NSNull null];
    }
}

/**
 6、哈希表的大小
 */
- (int)cw_size
{
    return self.size;
}

/**
 7、哈希表是否为空
 */
- (BOOL)cw_isEmpty
{
    return self.size == 0;
}


#pragma mark - 哈希表的内部方法

/**
 根据key获取index下标
 */
- (int)indexOfKey:(id)key
{

    if (key == nil) {
        return 0;
    }
    NSUInteger hash = [key hash];
    //NSUInteger hash = [(CWHashMapModel *)key hash];
    return (int)(hash^(hash >> 16)) & (_hashTable.count-1);
}

//- (int)indexOfKey:(id)key
//{
//
//    if (key == nil) {
//        return 0;
//    }
//    NSUInteger hash;
//    int index = 0;
//    if ([key isKindOfClass:[CWHashMapModel class]]){
//        hash = [(CWHashMapModel *)key hash];
//    }else{
//        hash = [key hash];
//    }
//    index = (int)(hash^(hash >> 16)) & (_hashTable.count-1);
//    //NSLog(@"index:%d",index);
//    return index;
//}


//- (int)indexOfKey:(id)key value:(id)value
//{
//
//    if (key == nil) {
//        return 0;
//    }
//    NSUInteger hash;
//    int index = 0;
//    if ([value isKindOfClass:[CWHashMapModel class]]){
//        hash = [(CWHashMapModel *)key hash];
//    }else{
//        hash = [key hash];
//    }
//    index = (int)(hash^(hash >> 16)) & (_hashTable.count-1);
//    //NSLog(@"index:%d",index);
//    return index;
//}

- (int)indexOfNode:(CWHashMapModel *)node
{
    int index = (int)(node.hash^(node.hash >> 16)) & (_hashTable.count-1);
    return index;
}


/**
 层序遍历
 */
- (void)traversal
{
    for(int i = 0; i< _hashTable.count;i++){

        CWHashMapModel *map = _hashTable[i];
        if (![map isEqual:[NSNull null]]) {
            NSLog(@"array_index:%d",i);
            [MJBinaryTrees println:map];
            //NSLog(@"------------------------");
        }
    }
    
}

/**
 获取前驱节点
 */
- (CWHashMapModel *)predecessorNode:(CWHashMapModel *)node
{
    CWHashMapModel *bst = node.left;
    // 1、当前节点的left节点不为空
    if (bst != nil) {
        while (bst.right != nil) {
            bst = bst.right;
        }
        return bst;
    }
    // 2、bst==nil && bst->_patent != nil
    else if (node.parent != nil){
        bst = node;
        while(bst != nil){
            NSLog(@"value:%d",[self private_compare:bst.key newValue:node.key]);
            if ([self private_compare:bst.key newValue:node.key] > 0) {
                NSLog(@"%@",bst.key);
                return bst;
            }else{
                bst = bst.parent;
            }
        }
    }
    // 3、没有前驱节点
    else{
        return nil;
    }
    return nil;
}


/**
 是否有左右子节点
 */
- (BOOL)hasTwoChildrenForNode:(CWHashMapModel *)node
{
    return node.left != nil && node.right != nil;
}

/**
 是否是右子节点
 */
- (BOOL)isRightNode:(CWHashMapModel *)node
{
    return node.parent.right == node;
}

/**
 是否是左子节点
 */
- (BOOL)isLeftNode:(CWHashMapModel *)node
{
    return node.parent.left == node;
}

/**
 返回兄弟节点
 */
- (CWHashMapModel *)isSiblingNode:(CWHashMapModel *)node
{
    if ([self isLeftNode:node]) {
        return node.parent.right;
    }
    
    else if ([self isRightNode:node]){
        return node.parent.left;
    }
    return nil;
}

/**
 是否红色节点
 */
- (BOOL)isRed:(CWHashMapModel *)node
{
    if (node == nil) {
        return NO;
    }
    return node.color == CWHashMapColorRed;
}

/**
 是否黑色节点
 */
- (BOOL)isBlack:(CWHashMapModel *)node
{
    if (node == nil) {
        return YES;
    }
    return node.color == CWHashMapColorBlack;
}

/**
 染色成红色节点
 */
- (CWHashMapModel *)red:(CWHashMapModel *)node
{
    if (node == nil) {
        return nil;
    }
    node.color = CWHashMapColorRed;
    return node;
}

/**
 染色成黑色
 */
- (CWHashMapModel *)black:(CWHashMapModel *)node
{
    if (node == nil) {
        return nil;
    }
    node.color = CWHashMapColorBlack;
    return node;
}

/**
 获取节点的颜色
 */
- (CWHashMapColor)colorOf:(CWHashMapModel *)node
{
    if ([self isRed:node]) {
        return CWHashMapColorRed;
    }
    
    return CWHashMapColorBlack;
}

/**
 添加之后的调整二叉树
 */
- (void)private_afterAdd:(CWHashMapModel *)node
{
    
    // 上益节点至root，染色为黑色
    if (node.parent == nil) {
        [self black:node];
        return;
    }
    // 1、父节点为黑色，不需要设置什么
    if ([self isBlack:node.parent]) {
        return;
    }
    
    // 2、父节点为红色
    else if([self isRed:node.parent]){
        
        // uncle节点为红色
        if([self isRed:[self isSiblingNode:node.parent]]){
            // LL RR LR RL染色，上益
            [self private_rebalanceUpTree:node];
        }
        
        // uncle节点为黑色
        else if([self isBlack:[self isSiblingNode:node.parent]]){
            // LL RR LR RL旋转操作
            [self private_rebalanceTree:node];
        }
    }
}

/**
 二叉树旋转 (parent节点为red，uncle节点为black)
 */
- (void)private_rebalanceTree:(CWHashMapModel *)node
{
    CWHashMapModel *parent = node.parent;
    CWHashMapModel *child = node;
    // L
    if ([self isLeftNode:parent]) {
        // LL
        if ([self isLeftNode:child]) {
            [self black:parent];
            [self red:parent.parent];
            [self private_rotateRight:node.parent.parent];
        }
        // LR
        else{
            [self black:node];
            [self red:node.parent.parent];
            [self private_rotateLeft:parent];
            [self private_rotateRight:child.parent];
        }
    }
    // R
    else{
        // RL
        if ([self isLeftNode:child]) {
            [self black:node];
            [self red:node.parent.parent];
            [self private_rotateRight:parent];
            [self private_rotateLeft:child.parent];
        }
        // RR
        else{
            [self black:node.parent];
            [self red:node.parent.parent];
            [self private_rotateLeft:node.parent.parent];
        }
    }
}

/**
 二叉树上益平衡 (parent节点为red，uncle节点为red)
 */
- (void)private_rebalanceUpTree:(CWHashMapModel *)node
{
    CWHashMapModel *parent = node.parent;
    CWHashMapModel *child = node;
    
    [self black:parent];
    [self black:[self isSiblingNode:node.parent]];
    [self red:node.parent.parent];
    [self private_afterAdd:node.parent.parent];
}


/**
 删除之后的调整二叉树
 */
- (void)private_afterRemove:(CWHashMapModel *)node replaceNode:(CWHashMapModel *)replaceNode
{
    // 1、如果删除的节点为red，不需要做任何处理
    if ([self isRed:node]) {
        return;
    }
    
    // 2、如果删除的度为1的黑色节点（一黑色节点带有一个红色节点）
    if ([self isRed:replaceNode]) {
        [self black:replaceNode];
        return;
    }
    
    // 3、删除为叶子节点
    BOOL left = node.parent.left == nil || [self isLeftNode:node];
    CWHashMapModel *sibling = left ? node.parent.right:node.parent.left;
    CWHashMapModel *parent = node.parent;
    
    
    // 4、删除的节点在left
    if(left){
        // 兄弟节点为红色
        if([self isRed:sibling]){
            [self black:sibling];
            [self red:parent];
            [self private_rotateLeft:parent];
            
            // 更换sibling节点
            sibling = parent.right;
        }
        
        // 兄弟节点本身为黑色（子节点也是黑）
        if([self isBlack:sibling.left] && [self isBlack:sibling.right]){
            
            CWHashMapColor isBlack = [self colorOf:parent];
            [self red:sibling];
            [self black:parent];
            if(isBlack == CWHashMapColorBlack){
                [self private_afterRemove:parent replaceNode:nil];
            }
        }
        
        // 黑色节点至少有一个红色子节点
        else{
            // 兄弟节点有一个right红色节点（LR旋转）
            if(sibling.left == nil){
                [self private_rotateRight:sibling];
                sibling = parent.right;
            }
            
            // 染色parent
            sibling.color = [self colorOf:parent];
            [self black:sibling.left];
            [self black:sibling.right];
            // 旋转
            [self private_rotateLeft:parent];
        }
    }
    
    // 删除的节点在right
    else{
        // 兄弟节点为红色
        if([self isRed:sibling]){
            [self black:sibling];
            [self red:parent];
            [self private_rotateRight:parent];
            // 更换sibling节点
            sibling = node.parent.left;
        }
        // 兄弟节点本身为黑色（子节点也是黑）
        if([self isBlack:sibling.left] && [self isBlack:sibling.right]){
            
            CWHashMapColor isBlack = [self colorOf:parent];
            [self red:sibling];
            [self black:parent];
            if(isBlack == CWHashMapColorBlack){
                [self private_afterRemove:parent replaceNode:nil];
            }
        }
        
        // 黑色节点至少有一个红色子节点
        else{
            // 兄弟节点有一个right红色节点（LR旋转）
            if(sibling.left == nil){
                [self private_rotateLeft:sibling];
                sibling = parent.left;
            }
            
            // 染色parent
            sibling.color = [self colorOf:parent];
            [self black:sibling.left];
            [self black:sibling.right];
            
            // 旋转
            [self private_rotateRight:parent];
            
        }
    }
}


/**
 左旋转节点
 */
- (void)private_rotateLeft:(CWHashMapModel *)node
{
    CWHashMapModel *grand = node;
    CWHashMapModel *parent = node.right;
    
    // 调整指针
    grand.right = parent.left;
    parent.left = grand;
    
    // 判断最新parent的是属于上一节点的left或者right
    if ([self isLeftNode:node]) {
        node.parent.left = parent;
    }else if ([self isRightNode:node]){
        node.parent.right = parent;
    }
    // 当前node为root节点
    else{
        CWHashMapModel *root = _hashTable[[self indexOfNode:node]];
        root->_root = parent;
        root = parent;
    }
    
    // 更新 parent(root、parent、grand)
    parent.parent = grand.parent;
    grand.parent = parent;
    if (grand.right != nil) {
        grand.right.parent = grand;
    }
    
}

/**
 右旋转节点
 */
- (void)private_rotateRight:(CWHashMapModel *)node
{
    CWHashMapModel *grand = node;
    CWHashMapModel *parent = node.left;
    
    // 调整指针
    grand.left = parent.right;
    parent.right = grand;
    
    // 判断最新parent的是属于上一节点的left或者right
    if ([self isLeftNode:node]) {
        node.parent.left = parent;
    }else if ([self isRightNode:node]){
        node.parent.right = parent;
    }
    // 当前node为root节点
    else{
        CWHashMapModel *root = _hashTable[[self indexOfNode:node]];
        root->_root = parent;
        root = parent;
    }
    
    
    // 更新parent(root、parent、grand)
    parent.parent = grand.parent;
    if (grand.left != nil) {
        grand.left.parent = grand;
    }
    grand.parent = parent;
}

/**
 比较获取节点的位置
 */
- (int)private_compare:(id)compare newValue:(id)newValue
{
    return [_model->_compare compareValue:compare oldValue:newValue];
}


@end

    

//
//  CWNumsQueue2.m
//  NumsQueue(回溯)
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWNumsQueue2.h"

@interface CWNumsQueue2(){
    int                 _number;
    int                 _sumMethod;
    NSMutableArray      *_queues;
    // 1为该列已经存放，0标示未存放
    NSMutableArray      *_cols;
    // 1为该列已经存放，0标示未存放(存放对角线)
    NSMutableArray      *_leftTop;
    // 1为该列已经存放，0标示未存放(存放对角线)
    NSMutableArray      *_rightTop;
}

@end


@implementation CWNumsQueue2


#pragma mark - init(初始化)

- (instancetype)initWithNumber:(int)number{
    if(self = [super init]){
        _sumMethod  = 0;
        _queues     = [NSMutableArray array];
        _cols       = [NSMutableArray array];
        _leftTop    = [NSMutableArray array];
        _rightTop   = [NSMutableArray array];
        _number     = number;
        // 初始化列
        for (int i = 0; i < number; i++) {
            [_cols addObject:@"0"];
        }
        
        // 初始化leftTop、rightTop
        for(int i = 0; i < (number << 1) - 1; i++){
            [_leftTop addObject:@"0"];
            [_rightTop addObject:@"0"];
        }
    }
    return self;
}


#pragma mark - placeQueues(计算皇后的方法)

- (void)placeQueues{
    
    if (_number < 1) {
        return;
    }
    [self placeRow:0];
    NSLog(@"======%d皇后摆列的总方法======%d",_number,_sumMethod);
}

- (void)placeRow:(int)row{
    
    if (row == _number) {
        _sumMethod++;
        [self printfQueue];
        return;
    }
    for (int col = 0; col < _number; col++) {
        
        // 列判断
        if ([_cols[col] intValue] == 1) {
            continue;
        }
        
        // 右对角线
        int rightI = row + col;
        if([_rightTop[rightI] intValue] == 1){
            continue;
        }
        // 左对角线
        int leftI = row - col + (_number - 1);
        if([_leftTop[leftI] intValue] == 1){
            continue;
        }
        
        // 设置值
        _queues[row] = [NSString stringWithFormat:@"%d",col];
        _cols[col] = _leftTop[leftI] = _rightTop[rightI] = @"1";
        [self placeRow:row + 1];
        
        // 为啥需要恢复现场数据？(方法1---因为col++，cols[row] = col后面的值会覆盖前面的值，但是方法2会影响后面皇后摆放，所以需要恢复现场)
        _cols[col] = _leftTop[leftI] = _rightTop[rightI] = @"0";
        // 优化：减少了isValidRow遍历
        
    }
    
}


#pragma mark - isValid(当前行列是否可以存放皇后)

//- (BOOL)isValidRow:(int)row col:(int)col{
//
//    // 注意事项----为啥是row，不是_cols.count那？(因为这个isValidRow是不停的调用判断，col++)
//    for (int i = 0; i < row; i++) {
//        if ([_cols[i] integerValue] == col) {
//            return false;
//        }
//
//        if (row - i == abs([_cols[i] intValue] - col)) {
//            return false;
//        }
//    }
//    return true;
//}

#pragma mark - printfQueue(打印皇后结果)

- (void)printfQueue
{
    for (int row = 0; row < _number; row++) {
        for (int col = 0; col < _number; col++) {
            if ([_queues[row] intValue] == col) {
                printf(" 1 ");
            }else{
                printf(" 0 ");
            }
        }
        printf("\n");
    }
    printf("==========================================\n");
}
@end

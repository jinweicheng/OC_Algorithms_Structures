//
//  CWNumsQueue.m
//  NumsQueue(回溯)
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWNumsQueue.h"

@interface CWNumsQueue(){
    // 下标为行、元素内容为列
    int                 _number;
    int                 _sumMethod;
    NSMutableArray      *_cols;
}

@end


@implementation CWNumsQueue


#pragma mark - init(初始化)

- (instancetype)initWithNumber:(int)number{
    if(self = [super init]){
        _sumMethod  = 0;
        _cols       = [NSMutableArray array];
        _number     = number;
        for (int i = 0; i < number; i++) {
            [_cols addObject:@""];
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
        if ([self isValidRow:row col:col]) {
            _cols[row] = [NSString stringWithFormat:@"%d",col];
            [self placeRow:row + 1];
        }
    }
    
}


#pragma mark - isValid(当前行列是否可以存放皇后)

- (BOOL)isValidRow:(int)row col:(int)col{
    
    // 注意事项----为啥是row，不是_cols.count那？(因为这个isValidRow是不停的调用判断，col++)
    for (int i = 0; i < row; i++) {
        if ([_cols[i] integerValue] == col) {
            return false;
        }
        
        if (row - i == abs([_cols[i] intValue] - col)) {
             return false;
        }
    }
    return true;
}

#pragma mark - printfQueue(打印皇后结果)

- (void)printfQueue
{
    for (int row = 0; row < _number; row++) {
        for (int col = 0; col < _number; col++) {
            if ([_cols[row] intValue] == col) {
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

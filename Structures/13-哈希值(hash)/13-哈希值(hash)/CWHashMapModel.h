//
//  CWHashModel.h
//  13-哈希值(hash)
//
//  Created by mac on 2019/6/10.
//  Copyright © 2019年 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWHashMapCompare.h"

typedef NS_ENUM(NSInteger, CWHashMapColor) {
    CWHashMapColorRed = 0,                   // Red
    CWHashMapColorBlack                      // Black
};

@interface CWHashMapModel : NSObject{
    @public
    id _value;                               // value
    CWHashMapModel *_root;                   // 跟节点
    CWHashMapCompare  *_compare;             // 比较器
}

/**< 节点的内部指针 */
@property (nonatomic,assign)  int size;
@property (nonatomic,assign)  NSUInteger hashV;
@property (nonatomic,strong)  id key;
@property (nonatomic,strong)  CWHashMapModel *parent;
@property (nonatomic,strong)  CWHashMapModel *left;
@property (nonatomic,strong)  CWHashMapModel *right;
@property (nonatomic,assign)  CWHashMapColor color;
@property (nonatomic,strong)  CWHashMapModel *root;

/**< 节点保存content */
@property (nonatomic,assign)  int age;            /**< age */
@property (nonatomic,assign)  CGFloat height;     /**< height */
@property (nonatomic,copy)    NSString *name;     /**< name */


/**< 1、初始化配置 */
- (instancetype)initWithAge:(int)age height:(CGFloat)height name:(NSString *)name;
/**< 2、model赋值 */
- (void)configNodeValue:(id)value key:(id)key;

@end

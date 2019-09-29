//
//  main.m
//  08-二叉搜索树
//
//  Created by mac on 2019/5/17.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWBinarySearchTree.h"
#import "MJBinaryTrees.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
		
		// 1、树结构
//        CWBinarySearchTree *tree = [[CWBinarySearchTree alloc] init];
//        NSArray *array = [[NSArray alloc] initWithObjects:@"7",@"4",@"2",@"1",@"3",@"5",@"9",@"8",@"11",@"10",@"12",nil];
//        for (int i = 0; i < array.count; i ++) {
//            [tree cw_addE:array[i]];
//        }
//        [MJBinaryTrees println:tree];
        
        // 2、递归前序、中序、后序
        // 前序:7、4、2、1、3、5、9、8、11、10、12
        //[tree recursive_preOrderTraversal:tree.root];
		//[tree preOrderTraversal:tree.root];
        
        // 中序:1、2、3、4、5、7、8、9、10、11、12
        //[tree recursive_inOrderTraversal:tree.root];
		//[tree inOrderTraversal:tree.root];
        
        // 后序:1、3、2、5、4、8、10、12、11、9、7
        //[tree recursive_postOrderTraversal:tree.root];
		//[tree postOrderTraversal:tree.root];
        
        // 3、层序遍历 (7、4、9、2、5、8、11、1、3、10、12)
        //[tree levelOrderTraversal:tree.root];
        
        // 4、二叉树的高度
        //NSLog(@"%d",[tree bstHeightForTree:tree.root]);
		
		// 5、二叉树的前驱节点
		//[tree predecessorNode:tree.root];
		//[tree predecessorNode:tree.root.left.right];
		//[tree predecessorNode:tree.root.right.left];
		//[tree predecessorNode:tree.root.right.right];
		
		
		// 6、二叉树的后继节点
		//[tree successorNode:tree.root];
		//[tree successorNode:tree.root.left.left.right];
		
		
		
		
		// 7、是否叶子节点、是否有左右子节点
		//NSLog(@"isLeaf:%d",[tree isLeaf:tree.root]);
		//NSLog(@"isLeaf:%d",[tree isLeaf:tree.root.left]);
		//NSLog(@"isLeaf:%d",[tree isLeaf:tree.root.right.left]);
		//NSLog(@"isLeaf:%d",[tree isLeaf:tree.root.left.right]);
		
		
		//NSLog(@"hasTwoChildrenForNode:%d",[tree hasTwoChildrenForNode:tree.root]);
		//NSLog(@"hasTwoChildrenForNode:%d",[tree hasTwoChildrenForNode:tree.root.left]);
		//NSLog(@"hasTwoChildrenForNode:%d",[tree hasTwoChildrenForNode:tree.root.right]);
		//NSLog(@"hasTwoChildrenForNode:%d",[tree hasTwoChildrenForNode:tree.root.left.right]);
		//NSLog(@"hasTwoChildrenForNode:%d",[tree hasTwoChildrenForNode:tree.root.right.left]);
		
		
		 // 8、左右子节点的判断
//		NSLog(@"isleft:%d",[tree isLeftNode:tree.root.left]);
//		NSLog(@"isleft:%d",[tree isLeftNode:tree.root.right]);
//
//		NSLog(@"isright:%d",[tree isRightNode:tree.root.left]);
//		NSLog(@"isright:%d",[tree isRightNode:tree.root.right]);

        
        
        // 9、删除二叉树节点
        CWBinarySearchTree *tree = [[CWBinarySearchTree alloc] init];
        NSArray *array = [[NSArray alloc] initWithObjects:@"5",@"3",@"8",@"1",@"4",@"6",@"9",@"2",@"7",nil];
		//NSArray *array = [[NSArray alloc] initWithObjects:@"5",@"3",@"8",@"1",@"4",@"6",@"9",nil];
        for (int i = 0; i < array.count; i ++) {
            [tree cw_addE:array[i]];
        }
		[MJBinaryTrees println:tree];
		[tree postOrderTraversal:tree.root];
        // 删除度为2
        //[MJBinaryTrees println:tree];
        //[tree cw_removeBST:tree.root];
        //NSLog(@"----------------");
        //[MJBinaryTrees println:tree];
        //[tree cw_removeBST:tree.root];
        //NSLog(@"----------------");
        //[MJBinaryTrees println:tree];
        
        // 删除度为1
        //[MJBinaryTrees println:tree];
        //[tree cw_removeBST:tree.root.left.left];
        //NSLog(@"----------------");
        //[MJBinaryTrees println:tree];
        
        //[tree cw_removeE:@"6"];
        //NSLog(@"----------------");
        //[MJBinaryTrees println:tree];
        
        // 删除度为0
        //[MJBinaryTrees println:tree];
//        [tree cw_removeBST:tree.root.left.left.right];
//        NSLog(@"----------------");
//        [MJBinaryTrees println:tree];
//
//        [tree cw_removeE:@"7"];
//        NSLog(@"----------------");
//        [MJBinaryTrees println:tree];
		
        
        
    }
    return 0;
}

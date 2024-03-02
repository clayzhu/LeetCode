//
//  LeetCode105VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/3/1.
//

#import "LeetCode105VC.h"

#include "LeetCode102Solution.h"
#include "LeetCode105Solution.h"

@interface LeetCode105VC ()

@end

@implementation LeetCode105VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 105、从前序与中序遍历序列构造二叉树
    self.descLabel.text = @"给定两个整数数组 preorder 和 inorder ，其中 preorder 是二叉树的先序遍历， inorder 是同一棵树的中序遍历，请构造二叉树并返回其根节点。\n"
    "示例 1:\n"
    "   输入: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]\n"
    "   输出: [3,9,20,null,null,15,7]\n"
    "示例 2:\n"
    "   输入: preorder = [-1], inorder = [-1]\n"
    "   输出: [-1]\n"
    "提示:\n"
    "· 1 <= preorder.length <= 3000\n"
    "· inorder.length == preorder.length\n"
    "· -3000 <= preorder[i], inorder[i] <= 3000\n"
    "· preorder 和 inorder 均 无重复 元素\n"
    "· inorder 均出现在 preorder\n"
    "· preorder 保证 为二叉树的前序遍历序列\n"
    "· inorder 保证 为二叉树的中序遍历序列";
    
    self.outputTextView.text = @"请输入两行内容，第一行是前序遍历序列，第二行是中序遍历序列";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)exeAlgorithm {
    NSArray* inputLines = [self.inputTextView.text componentsSeparatedByString:@"\n"];
    if (inputLines.count != 2) {
        self.outputTextView.text = @"请输入两行内容，第一行是前序遍历序列，第二行是中序遍历序列";
        return;
    }
    
    // line 1
    std::vector<int> preorder;
    NSArray* line1Strs = [inputLines[0] componentsSeparatedByString:@","];
    for (NSString* numStr in line1Strs) {
        preorder.emplace_back([numStr intValue]);
    }
    
    // line 2
    std::vector<int> inorder;
    NSArray* line2Strs = [inputLines[1] componentsSeparatedByString:@","];
    for (NSString* numStr in line2Strs) {
        inorder.emplace_back([numStr intValue]);
    }
    
    LeetCode105Solution solution;
    TreeNode* resultRoot = solution.buildTree(preorder, inorder);
    
    // 辅助打印
    LeetCode102Solution solution_102;
    std::vector<std::vector<int>> result = solution_102.levelOrder(resultRoot);
    
    NSMutableArray* outputNums = [NSMutableArray array];
    for (int i = 0; i < result.size(); i ++) {
        NSMutableArray* levelNums = [NSMutableArray array];
        for (int j = 0; j < result[i].size(); j ++) {
            [levelNums addObject:@(result[i][j])];
        }
        NSString* level = [NSString stringWithFormat:@"[%@]",
                           [levelNums componentsJoinedByString:@","]];
        [outputNums addObject:level];
    }
    NSString* output = [NSString stringWithFormat:@"[%@]",
                        [outputNums componentsJoinedByString:@","]];
    self.outputTextView.text = output;
}

@end

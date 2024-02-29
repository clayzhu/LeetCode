//
//  LeetCode226VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/29.
//

#import "LeetCode226VC.h"

#include <queue>

#include "LeetCode102Solution.h"
#include "LeetCode226Solution.h"

@interface LeetCode226VC ()

@end

@implementation LeetCode226VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 226、翻转二叉树
    self.descLabel.text = @"给你一棵二叉树的根节点 root ，翻转这棵二叉树，并返回其根节点。\n"
    "示例 1：\n"
    "   输入：root = [4,2,7,1,3,6,9]\n"
    "   输出：[4,7,2,9,6,3,1]\n"
    "示例 2：\n"
    "   输入：root = [2,1,3]\n"
    "   输出：[2,3,1]\n"
    "示例 3：\n"
    "   输入：root = []\n"
    "   输出：[]\n"
    "提示：\n"
    "· 树中节点数目范围在 [0, 100] 内\n"
    "· -100 <= Node.val <= 100";
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
    TreeNode* root = nullptr;
    std::queue<TreeNode*> queue;
    int index = 0;
    
    NSArray* inputStrs = [self.inputTextView.text componentsSeparatedByString:@","];
    if (inputStrs.count > 0 && ![inputStrs[index] isEqualToString:@"null"]) {
        root = new TreeNode([inputStrs[index] intValue]);
        queue.push(root);
        
        index ++;
    } else {
        self.outputTextView.text = @"根结点输入有误";
        return;
    }
    
    while (!queue.empty()) {
        TreeNode* firstNode = queue.front();
        queue.pop();
        
        if (index < inputStrs.count) {
            if ([inputStrs[index] isEqualToString:@"null"]) {
                firstNode->left = nullptr;
            } else {
                TreeNode* node = new TreeNode([inputStrs[index] intValue]);
                firstNode->left = node;
                queue.push(firstNode->left);
            }
            index ++;
        }
        
        if (index < inputStrs.count) {
            if ([inputStrs[index] isEqualToString:@"null"]) {
                firstNode->right = nullptr;
            } else {
                TreeNode* node = new TreeNode([inputStrs[index] intValue]);
                firstNode->right = node;
                queue.push(firstNode->right);
            }
            index ++;
        }
    }
    
    LeetCode226Solution solution;
    TreeNode* resultRoot = solution.invertTree(root);
    
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

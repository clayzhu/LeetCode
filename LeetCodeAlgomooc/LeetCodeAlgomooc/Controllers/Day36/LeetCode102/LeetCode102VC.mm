//
//  LeetCode102VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/27.
//

#import "LeetCode102VC.h"

#include <queue>

#include "LeetCode102Solution.h"

@interface LeetCode102VC ()

@end

@implementation LeetCode102VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 102、二叉树的层序遍历
    self.descLabel.text = @"给你二叉树的根节点 root ，返回其节点值的 层序遍历 。 （即逐层地，从左到右访问所有节点）。\n"
    "示例 1：\n"
    "   输入：root = [3,9,20,null,null,15,7]\n"
    "   输出：[[3],[9,20],[15,7]]\n"
    "示例 2：\n"
    "   输入：root = [1]\n"
    "   输出：[[1]]\n"
    "示例 3：\n"
    "   输入：root = []\n"
    "   输出：[]\n"
    "提示：\n"
    "· 树中节点数目在范围 [0, 2000] 内\n"
    "· -1000 <= Node.val <= 1000";
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
    
    LeetCode102Solution solution;
    std::vector<std::vector<int>> result = solution.levelOrder(root);
    
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

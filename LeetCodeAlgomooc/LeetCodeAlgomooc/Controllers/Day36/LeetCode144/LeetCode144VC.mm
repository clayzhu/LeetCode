//
//  LeetCode144VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/27.
//

#import "LeetCode144VC.h"

#include <queue>

#include "LeetCode144Solution.h"

@interface LeetCode144VC ()

@end

@implementation LeetCode144VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 144、二叉树的前序遍历
    self.descLabel.text = @"给你二叉树的根节点 root ，返回它节点值的 前序 遍历。\n"
    "示例 1：\n"
    "   输入：root = [1,null,2,3]\n"
    "   输出：[1,2,3]\n"
    "示例 2：\n"
    "   输入：root = []\n"
    "   输出：[]\n"
    "示例 3：\n"
    "   输入：root = [1]\n"
    "   输出：[1]\n"
    "示例 4：\n"
    "   输入：root = [1,2]\n"
    "   输出：[1,2]\n"
    "示例 5：\n"
    "   输入：root = [1,null,2]\n"
    "   输出：[1,2]\n"
    "提示：\n"
    "· 树中节点数目在范围 [0, 100] 内\n"
    "· -100 <= Node.val <= 100\n"
    "进阶：递归算法很简单，你可以通过迭代算法完成吗？\n";
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
    
    LeetCode144Solution solution;
    std::vector<int> result = solution.preorderTraversal(root);
    
    NSMutableArray* outputNums = [NSMutableArray array];
    for (int i = 0; i < result.size(); i ++) {
        [outputNums addObject:@(result[i])];
    }
    NSString* output = [outputNums componentsJoinedByString:@","];
    self.outputTextView.text = output;
}

@end

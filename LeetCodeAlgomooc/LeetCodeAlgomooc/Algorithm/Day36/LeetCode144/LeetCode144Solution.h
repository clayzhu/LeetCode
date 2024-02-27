//
//  LeetCode144Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/27.
//

#ifndef LeetCode144Solution_h
#define LeetCode144Solution_h

#include <stack>
#include <vector>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};

/// LeetCode 144、二叉树的前序遍历
///
/// 给你二叉树的根节点 root ，返回它节点值的 前序 遍历。
/// 示例 1：
///    输入：root = [1,null,2,3]
///    输出：[1,2,3]
/// 示例 2：
///    输入：root = []
///    输出：[]
/// 示例 3：
///    输入：root = [1]
///    输出：[1]
/// 示例 4：
///    输入：root = [1,2]
///    输出：[1,2]
/// 示例 5：
///    输入：root = [1,null,2]
///    输出：[1,2]
/// 提示：
/// · 树中节点数目在范围 [0, 100] 内
/// · -100 <= Node.val <= 100
/// 进阶：递归算法很简单，你可以通过迭代算法完成吗？
class LeetCode144Solution {
    
public:
    std::vector<int> preorderTraversal(TreeNode* root) {
#if 0   // 递归算法
        std::vector<int> result;
        if (root == nullptr) {
            return result;
        }
        
        preorder(root, &result);
        
        return result;
#elif 0 // 迭代算法
        std::vector<int> result;
        if (root == nullptr) {
            return result;
        }
        
        TreeNode* node = root;
        std::stack<TreeNode*> stack;
        while (node || !stack.empty()) {
            if (node != nullptr) {
                result.emplace_back(node->val);
                stack.push(node);
                node = node->left;
            } else {
                node = stack.top();
                stack.pop();
                node = node->right;
            }
        }
        
        return result;
#elif 1 // 迭代算法
        std::vector<int> result;
        if (root == nullptr) {
            return result;
        }
        
        TreeNode* node = root;
        std::stack<TreeNode*> stack;
        while (node != nullptr || !stack.empty()) {
            while (node != nullptr) {
                result.emplace_back(node->val);
                stack.push(node);
                node = node->left;
            }
            
            node = stack.top();
            stack.pop();
            node = node->right;
        }
        
        return result;
#endif
    }
    
private:
    // 递归算法
    void preorder(TreeNode* node, std::vector<int>* out_result) {
        if (node == nullptr) {
            return;
        }
        
        out_result->emplace_back(node->val);
        preorder(node->left, out_result);
        preorder(node->right, out_result);
    }
    
};

#endif /* LeetCode144Solution_h */

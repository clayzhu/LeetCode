//
//  LeetCode102Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/27.
//

#ifndef LeetCode102Solution_h
#define LeetCode102Solution_h

#include <queue>
#include <vector>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};

/// LeetCode 102、二叉树的层序遍历
///
/// 给你二叉树的根节点 root ，返回其节点值的 层序遍历 。 （即逐层地，从左到右访问所有节点）。
/// 示例 1：
///    输入：root = [3,9,20,null,null,15,7]
///    输出：[[3],[9,20],[15,7]]
/// 示例 2：
///    输入：root = [1]
///    输出：[[1]]
/// 示例 3：
///    输入：root = []
///    输出：[]
/// 提示：
/// · 树中节点数目在范围 [0, 2000] 内
/// · -1000 <= Node.val <= 1000
class LeetCode102Solution {
    
public:
    std::vector<std::vector<int>> levelOrder(TreeNode* root) {
        std::vector<std::vector<int>> result;
        if (root == nullptr) {
            return result;
        }
        
        std::queue<TreeNode*> queue;
        queue.push(root);
        
        while (!queue.empty()) {
            int size = queue.size();
            std::vector<int> level;
            
            for (int i = 0; i < size; i ++) {
                TreeNode* first_node = queue.front();
                queue.pop();
                level.emplace_back(first_node->val);
                
                if (first_node->left != nullptr) {
                    queue.push(first_node->left);
                }
                
                if (first_node->right != nullptr) {
                    queue.push(first_node->right);
                }
            }
            
            result.emplace_back(level);
        }
        
        return result;
    }
    
};

#endif /* LeetCode102Solution_h */

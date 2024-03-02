//
//  LeetCode105Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/3/1.
//

#ifndef LeetCode105Solution_h
#define LeetCode105Solution_h

#include <unordered_map>
#include <vector>

#ifndef TreeNode_h
#define TreeNode_h

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};

#endif /* TreeNode_h */

/// LeetCode 105、从前序与中序遍历序列构造二叉树
///
/// 给定两个整数数组 preorder 和 inorder ，其中 preorder 是二叉树的先序遍历， inorder 是同一棵树的中序遍历，请构造二叉树并返回其根节点。
/// 示例 1:
///    输入: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
///    输出: [3,9,20,null,null,15,7]
/// 示例 2:
///    输入: preorder = [-1], inorder = [-1]
///    输出: [-1]
/// 提示:
/// · 1 <= preorder.length <= 3000
/// · inorder.length == preorder.length
/// · -3000 <= preorder[i], inorder[i] <= 3000
/// · preorder 和 inorder 均 无重复 元素
/// · inorder 均出现在 preorder
/// · preorder 保证 为二叉树的前序遍历序列
/// · inorder 保证 为二叉树的中序遍历序列
class LeetCode105Solution {
    
public:
    TreeNode* buildTree(std::vector<int>& preorder, std::vector<int>& inorder) {
        return nullptr;
    }
    
};

#endif /* LeetCode105Solution_h */

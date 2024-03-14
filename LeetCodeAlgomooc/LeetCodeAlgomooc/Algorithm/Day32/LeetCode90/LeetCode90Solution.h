//
//  LeetCode90Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/3/14.
//

#ifndef LeetCode90Solution_h
#define LeetCode90Solution_h

#include <vector>

/// LeetCode 90、子集 II
///
/// 给你一个整数数组 nums ，其中可能包含重复元素，请你返回该数组所有可能的子集（幂集）。
/// 解集 不能 包含重复的子集。返回的解集中，子集可以按 任意顺序 排列。
/// 示例 1：
///    输入：nums = [1,2,2]
///    输出：[[],[1],[1,2],[1,2,2],[2],[2,2]]
/// 示例 2：
///    输入：nums = [0]
///    输出：[[],[0]]
/// 提示：
/// · 1 <= nums.length <= 10
/// · -10 <= nums[i] <= 10
class LeetCode90Solution {
    
public:
    std::vector<std::vector<int>> subsetsWithDup(std::vector<int>& nums) {
        std::sort(nums.begin(), nums.end());
        
        std::vector<int> path;
        backtrack(nums, path, 0);
        return result_;
    }
    
private:
    std::vector<std::vector<int>> result_;
    
    void backtrack(std::vector<int>& nums, std::vector<int>& path, int start) {
        result_.push_back(path);
        
        for (int i = start; i < nums.size(); i ++) {
            if (i > start && nums[i] == nums[i - 1]) {
                continue;
            }
            
            path.push_back(nums[i]);
            backtrack(nums, path, i + 1);
            path.pop_back();
        }
    }
    
};

#endif /* LeetCode90Solution_h */

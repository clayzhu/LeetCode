//
//  LeetCode47Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/3/15.
//

#ifndef LeetCode47Solution_h
#define LeetCode47Solution_h

#include <vector>

/// LeetCode 47、全排列 II
///
/// 给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。
/// 示例 1：
///    输入：nums = [1,1,2]
///    输出：
///    [[1,1,2],
///     [1,2,1],
///     [2,1,1]]
/// 示例 2：
///    输入：nums = [1,2,3]
///    输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
/// 提示：
/// · 1 <= nums.length <= 8
/// · -10 <= nums[i] <= 10
class LeetCode47Solution {
    
public:
    std::vector<std::vector<int>> permuteUnique(std::vector<int>& nums) {
        std::sort(nums.begin(), nums.end());
        
        std::vector<int> path;
        std::vector<bool> used(nums.size(), false);
        backtrack(nums, path, used);
        return result_;
    }
    
private:
    std::vector<std::vector<int>> result_;
    
    void backtrack(std::vector<int>& nums, std::vector<int>& path, std::vector<bool>& used) {
        if (path.size() == nums.size()) {
            result_.push_back(path);
            return;
        }
        
        for (int i = 0; i < nums.size(); i ++) {
            if (used[i] == false) {
                if (i > 0 && nums[i] == nums[i - 1] && used[i - 1] == false) {
                    continue;
                }
                
                path.push_back(nums[i]);
                used[i] = true;
                backtrack(nums, path, used);
                used[i] = false;
                path.pop_back();
            }
        }
    }
    
};

#endif /* LeetCode47Solution_h */

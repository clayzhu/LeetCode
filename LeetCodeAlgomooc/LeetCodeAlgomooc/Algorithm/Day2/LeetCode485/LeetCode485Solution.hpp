//
//  LeetCode485Solution.hpp
//  LeetCodeAlgomooc
//
//  Created by admin on 2024/1/16.
//

#ifndef LeetCode485Solution_hpp
#define LeetCode485Solution_hpp

#include <stdio.h>
#include <vector>

/// LeetCode 485、最大连续 1 的个数
/// 
/// 给定一个二进制数组 nums，计算其中最大连续 1 的个数。
/// 示例 1：
/// 输入：nums = [1,1,0,1,1,1] 输出：3. 解释：开头的两位和最后的三位都是连续 1 ，所以最大连续 1 的个数是 3.
/// 示例 2：
/// 输入：nums = [1,0,1,1,0,1] 输出：2
/// 提示：
/// · 1 <= nums.length <= 10^5
/// · nums[i] 不是 0 就是 1.
class LeetCode485Solution {
    
public:
    int findMaxConsecutiveOnes(const std::vector<int>& nums) {
        // 最后一个 0 所在的索引位置
        int lastZero = -1;
        // 结果
        int ans = 0;
        
        // 从左到右访问数组 nums
        for (int i = 0; i < nums.size(); i ++) {
            int num = nums[i];
            if (num == 0) { // 1、当前元素为 0 ，更新 lastZero
                lastZero = i;
            } else {        // 2、否则说明当前元素为 1
                // 通过 lastZero 可以获取当前元素距离最前面的 1 的个数
                // 对比之前的 ans ，更新获取最大值
                ans = std::max(ans, i - lastZero);
            }
        }
        
        return ans;
    }
    
};

#endif /* LeetCode485Solution_hpp */

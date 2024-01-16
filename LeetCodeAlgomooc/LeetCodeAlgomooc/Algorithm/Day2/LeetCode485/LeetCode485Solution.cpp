//
//  LeetCode485Solution.cpp
//  LeetCodeAlgomooc
//
//  Created by admin on 2024/1/16.
//

#include "LeetCode485Solution.hpp"

int LeetCode485Solution::findMaxConsecutiveOnes(const std::vector<int> &nums) {
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

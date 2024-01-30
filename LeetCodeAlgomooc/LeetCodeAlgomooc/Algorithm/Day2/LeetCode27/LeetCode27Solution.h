//
//  LeetCode27Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/1/30.
//

#ifndef LeetCode27Solution_h
#define LeetCode27Solution_h

#include <vector>

/// LeetCode 27、移除元素
///
/// 给你一个数组 nums 和一个值 val，你需要 原地 (opens new window)移除所有数值等于 val 的元素，并返回移除后数组的新长度。
/// 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 **原地  (opens new window)**修改输入数组。
/// 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。
/// 说明:
/// 为什么返回数值是整数，但输出的答案是数组呢?
/// 请注意，输入数组是以**「引用」**方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。
/// 示例 1：
/// **输入：**nums = [3,2,2,3], val = 3 **输出：**2, nums = [2,2] **解释：**函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。你不需要考虑数组中超出新长度后面的元素。例如，函数返回的新长度为 2 ，而 nums = [2,2,3,3] 或 nums = [2,2,0,0]，也会被视作正确答案。
/// 示例 2：
/// 输入：nums = [0,1,2,2,3,0,4,2], val = 2
/// 输出：5, nums = [0,1,4,0,3]
/// 解释：函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。注意这五个元素可为任意顺序。你不需要考虑数组中超出新长度后面的元素。
/// 提示：
/// · 0 <= nums.length <= 100
/// · 0 <= nums[i] <= 50
/// · 0 <= val <= 100
class LeetCode27Solution {
    
public:
    int removeElement(std::vector<int>& nums, int val) {
#if 0   // Clay 解答
        int length = nums.size();
        int p = 0;
        for (int i = 0; i < length; i ++) {
            if (nums[p] == val &&
                nums[i] == val) {
                continue;
            }
            
            if (nums[p] == val) {
                int temp = nums[p];
                nums[p] = nums[i];
                nums[i] = temp;
            }
            
            p ++;
        }
        return p;
#else   // 参考解答
        // 指针 i 进行数组遍历
        int n = nums.size();
        // 指针 j 指向即将被赋值的位置
        int j = 0;
        // 开始对数组进行遍历
        for (int i = 0; i < n; i ++) {
            // 进行筛选
            if (nums[i] != val) {
                // 赋值
                nums[j] = nums[i];
                // j 移动
                j ++;
            }
        }
        // 获取结果
        return j;
#endif
    }
    
};

#endif /* LeetCode27Solution_h */

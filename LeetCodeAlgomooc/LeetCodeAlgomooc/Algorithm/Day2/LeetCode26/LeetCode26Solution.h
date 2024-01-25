//
//  LeetCode26Solution.h
//  LeetCodeAlgomooc
//
//  Created by admin on 2024/1/18.
//

#ifndef LeetCode26Solution_h
#define LeetCode26Solution_h

#include <vector>

/// LeetCode 26、删除有序数组中的重复项
///
/// 给你一个 升序排列 的数组 nums ，请你** 原地 (opens new window)** 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。元素的 相对顺序 应该保持 一致 。
/// 由于在某些语言中不能改变数组的长度，所以必须将结果放在数组nums的第一部分。更规范地说，如果在删除重复项之后有 k 个元素，那么 nums 的前 k 个元素应该保存最终结果。
/// 将最终结果插入 nums 的前 k 个位置后返回 k 。
/// 不要使用额外的空间，你必须在 **原地  (opens new window)**修改输入数组并在使用 O(1) 额外空间的条件下完成。
/// 示例 1：
/// 输入：nums = [1,1,2] 输出：2, nums = [1,2,_] 解释：函数应该返回新的长度 2 ，并且原数组 nums 的前两个元素被修改为 1, 2 。不需要考虑数组中超出新长度后面的元素。
/// 示例 2：
/// 输入：nums = [0,0,1,1,1,2,2,3,3,4] 输出：5, nums = [0,1,2,3,4] 解释：函数应该返回新的长度 5 ， 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4 。不需要考虑数组中超出新长度后面的元素。
/// 提示：
/// · 1 <= nums.length <= 3 * 10^4
/// · -10^4 <= nums[i] <= 10^4
/// · nums 已按 升序 排列
class LeetCode26Solution {
    
public:
    int removeDuplicates(std::vector<int>& nums) {
#if 0   // Clay 解答
        int length = nums.size();
        int p = 0;
        for (int i = 0; i < length; i ++) {
            if (p == i) {
                continue;
            }
            if (p < length - 1 &&
                nums[p] >= nums[p + 1] &&
                nums[p] != nums[i]) {
                nums[p + 1] = nums[i];
                
                p ++;
            } else if (p < length - 1 &&
                       nums[p] < nums[p + 1]) {
                p ++;
            }
        }
        return p + 1;
#else   // 参考解答
        // 指针 i 进行数组遍历
        int n = nums.size();
        
        // 指针 j 指向即将被赋值的位置
        int j = 0;
        
        // 开始对数组进行遍历
        for (int i = 0 ; i < n ; i++) {
            
            // 进行筛选
            if ( i == 0 ||  nums[i] != nums[i - 1]) {
                // 赋值
                nums[j] = nums[i];
                
                // j 移动
                j++;
            }
        }
        
        // 获取结果
        return j ;
#endif
    }
    
};

#endif /* LeetCode26Solution_h */

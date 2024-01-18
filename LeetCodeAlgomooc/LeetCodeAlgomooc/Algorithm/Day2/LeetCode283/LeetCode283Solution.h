//
//  LeetCode283Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/1/17.
//

#ifndef LeetCode283Solution_h
#define LeetCode283Solution_h

#include <vector>

/// LeetCode 283、移动零
///
/// 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
/// 请注意，必须在不复制数组的情况下原地对数组进行操作。
/// 示例 1:
/// 输入: nums = [0,1,0,3,12]
/// 输出: [1,3,12,0,0]
/// 示例 2:
/// 输入: nums = [0]
/// 输出: [0]
/// 提示:
/// · 1 <= nums.length <= 10^4
/// · -2^31 <= nums[i] <= 2^31 - 1
/// **进阶：**你能尽量减少完成的操作次数吗？
class LeetCode283Solution {
    
public:
    void moveZeroes(std::vector<int>& nums) {
#if 0   // Clay 解答
        int p = 0;
        for (int i = 0; i < nums.size(); i ++) {
            if (i == p) {
                continue;
            }
            int numP = nums[p];
            int numI = nums[i];
            if (numP != 0) {
                p ++;
                continue;
            }
            if (numI == 0) {
                continue;
            }
            
            int temp = numP;
            nums[p] = numI;
            nums[i] = temp;
            
            p ++;
        }
#else   // 参考解答
        // 设置一个变量，用来指向经过一系列操作后数组中所有为 0 元素的第一个位置上
        // 一开始默认在索引为 0 的位置
        int slow = 0;
        
        // 从头到尾遍历数组
        // 遍历完毕之后，slow 指向了一个为 0 的元素，或者如果数组中不存在 0 ，就和 fast 一样，超过了数组的范围
        for (int fast = 0; fast < nums.size(); fast++) {
            // 在遍历过程中，如果发现访问的元素是非 0 元素
            // 说明 slow 不在正确的位置上，需要向后移动，寻找合适的位置
            if (nums[fast] != 0) {
                // 这个时候，原先 slow 的值需要被 fast 的值覆盖
                nums[slow] = nums[fast];
                // slow 需要向后移动，寻找合适的位置
                slow++;
                
            }
        }
        
        // 接下来，只需要把 slow 极其后面所有的元素都设置为 0 就行
        for (int i = slow; i < nums.size(); i++) {
            // 都设置为 0
            nums[i] = 0;
            
        }
#endif
    }
    
};

#endif /* LeetCode283Solution_h */

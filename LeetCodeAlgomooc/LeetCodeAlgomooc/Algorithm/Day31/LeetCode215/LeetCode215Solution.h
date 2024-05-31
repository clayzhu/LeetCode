//
//  LeetCode215Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/5/31.
//

#ifndef LeetCode215Solution_h
#define LeetCode215Solution_h

#include <vector>

class LeetCode215Solution {
    
public:
    int findKthLargest(std::vector<int>& nums, int k) {
        int n = nums.size();
        return quickselect(nums, 0, n - 1, n - k);
    }
    
private:
    int quickselect(std::vector<int> &nums, int l, int r, int k) {
        if (l == r)
            return nums[k];
        int partition = nums[l], i = l - 1, j = r + 1;
        while (i < j) {
            do i++; while (nums[i] < partition);
            do j--; while (nums[j] > partition);
            if (i < j)
                std::swap(nums[i], nums[j]);
        }
        if (k <= j) return quickselect(nums, l, j, k);
        else return quickselect(nums, j + 1, r, k);
    }
    
};

#endif /* LeetCode215Solution_h */

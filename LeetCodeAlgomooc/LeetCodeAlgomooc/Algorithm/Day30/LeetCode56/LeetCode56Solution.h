//
//  LeetCode56Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/29.
//

#ifndef LeetCode56Solution_h
#define LeetCode56Solution_h

#include <vector>

/// LeetCode 56、合并区间
///
/// 以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回 一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间 。
/// 示例 1：
///    输入：intervals = [[1,3],[2,6],[8,10],[15,18]]
///    输出：[[1,6],[8,10],[15,18]]
///    解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
/// 示例 2：
///    输入：intervals = [[1,4],[4,5]]
///    输出：[[1,5]]
///    解释：区间 [1,4] 和 [4,5] 可被视为重叠区间。
/// 提示：
/// · 1 <= intervals.length <= 104
/// · intervals[i].length == 2
/// · 0 <= starti <= endi <= 104
class LeetCode56Solution {
    
public:
    std::vector<std::vector<int>> merge(std::vector<std::vector<int>>& intervals) {
        if (intervals.size() <= 0) {
            return {};
        }
        
        std::sort(intervals.begin(), intervals.end());
        
        std::vector<std::vector<int>> merged_intervals;
        for (int i = 0; i < intervals.size(); i ++) {
            int left = intervals[i][0], right = intervals[i][1];
            if (merged_intervals.size() == 0 || merged_intervals.back()[1] < left) {
//                merged_intervals.emplace_back({left, right});   // error: emplace_back 直接在参数中构造 vector 会报错
                merged_intervals.push_back({left, right});
            } else {
                merged_intervals.back()[1] = std::max(merged_intervals.back()[1], right);
            }
        }
        
        return merged_intervals;
    }
    
};

#endif /* LeetCode56Solution_h */

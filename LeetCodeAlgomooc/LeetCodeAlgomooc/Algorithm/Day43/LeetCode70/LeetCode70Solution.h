//
//  LeetCode70Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/3/4.
//

#ifndef LeetCode70Solution_h
#define LeetCode70Solution_h

/// LeetCode 70、爬楼梯
///
/// 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
/// 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
/// 示例 1：
///    输入：n = 2
///    输出：2
///    解释：有两种方法可以爬到楼顶。
///    1. 1 阶 + 1 阶
///    2. 2 阶
/// 示例 2：
///    输入：n = 3
///    输出：3
///    解释：有三种方法可以爬到楼顶。
///    1. 1 阶 + 1 阶 + 1 阶
///    2. 1 阶 + 2 阶
///    3. 2 阶 + 1 阶
/// 提示：
/// · 1 <= n <= 45
class LeetCode70Solution {
    
public:
    int climbStairs(int n) {
#if 0   // 转移方程
        if (n == 1) {
            return 1;
        }
        
        int dp[n + 1];
        dp[1] = 1;
        dp[2] = 2;
        for (int i = 3; i <= n; i ++) {
            dp[i] = dp[i - 2] + dp[i - 1];
        }
        
        return dp[n];
#elif 1 // 滚动数组
        int p = 0, q = 0, r = 1;
        for (int i = 1; i <= n; ++i) {
            p = q;
            q = r;
            r = p + q;
        }
        return r;
#elif 0 // 矩阵快速幂 // TODO: zg UNDEFINED Mar 4, 2024, 22:58
#endif
    }
    
};

#endif /* LeetCode70Solution_h */

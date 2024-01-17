//
//  LeetCode485VC.m
//  LeetCodeAlgomooc
//
//  Created by admin on 2024/1/16.
//

#import "LeetCode485VC.h"

#include "LeetCode485Solution.hpp"

@interface LeetCode485VC ()

@end

@implementation LeetCode485VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 485、最大连续 1 的个数
    self.descLabel.text = @"给定一个二进制数组 nums，计算其中最大连续 1 的个数。\n"
    "示例 1：\n"
    "输入：nums = [1,1,0,1,1,1] 输出：3. 解释：开头的两位和最后的三位都是连续 1 ，所以最大连续 1 的个数是 3.\n"
    "示例 2：\n"
    "输入：nums = [1,0,1,1,0,1] 输出：2\n"
    "提示：\n"
    "· 1 <= nums.length <= 10^5\n"
    "· nums[i] 不是 0 就是 1.";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)exeAlgorithm {
    std::vector<int> nums;
    NSArray* inputStrs = [self.inputTextView.text componentsSeparatedByString:@","];
    for (NSString* numStr in inputStrs) {
        nums.emplace_back([numStr intValue]);
    }
    
    LeetCode485Solution solution;
    int output = solution.findMaxConsecutiveOnes(nums);
    
    self.outputTextView.text = [NSString stringWithFormat:@"%@", @(output)];
}

@end

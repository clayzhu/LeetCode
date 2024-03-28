//
//  LeetCode724VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/3/28.
//

#import "LeetCode724VC.h"

#include "LeetCode724Solution.h"

@interface LeetCode724VC ()

@end

@implementation LeetCode724VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 724、寻找数组的中心下标
    self.descLabel.text = @"给你一个整数数组 nums ，请计算数组的 中心下标 。\n"
    "数组 中心下标 是数组的一个下标，其左侧所有元素相加的和等于右侧所有元素相加的和。\n"
    "如果中心下标位于数组最左端，那么左侧数之和视为 0 ，因为在下标的左侧不存在元素。这一点对于中心下标位于数组最右端同样适用。\n"
    "如果数组有多个中心下标，应该返回 最靠近左边 的那一个。如果数组不存在中心下标，返回 -1 。\n"
    "示例 1：\n"
    "   输入：nums = [1, 7, 3, 6, 5, 6]\n"
    "   输出：3\n"
    "   解释：\n"
    "   中心下标是 3 。\n"
    "   左侧数之和 sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11 ，\n"
    "   右侧数之和 sum = nums[4] + nums[5] = 5 + 6 = 11 ，二者相等。\n"
    "示例 2：\n"
    "   输入：nums = [1, 2, 3]\n"
    "   输出：-1\n"
    "   解释：\n"
    "   数组中不存在满足此条件的中心下标。\n"
    "示例 3：\n"
    "   输入：nums = [2, 1, -1]\n"
    "   输出：0\n"
    "   解释：\n"
    "   中心下标是 0 。\n"
    "   左侧数之和 sum = 0 ，（下标 0 左侧不存在元素），\n"
    "   右侧数之和 sum = nums[1] + nums[2] = 1 + -1 = 0 。\n"
    "提示：\n"
    "· 1 <= nums.length <= 104\n"
    "· -1000 <= nums[i] <= 1000\n"
    "注意：本题与主站 1991 题相同：https://leetcode-cn.com/problems/find-the-middle-index-in-array/";
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
    
    LeetCode724Solution solution;
    int output = solution.pivotIndex(nums);
    
    self.outputTextView.text = [NSString stringWithFormat:@"%@", @(output)];
}

@end

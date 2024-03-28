//
//  LeetCode35VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/3/28.
//

#import "LeetCode35VC.h"

#include "LeetCode35Solution.h"

@interface LeetCode35VC ()

@end

@implementation LeetCode35VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 35、搜索插入位置
    self.descLabel.text = @"给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。\n"
    "请必须使用时间复杂度为 O(log n) 的算法。\n"
    "示例 1:\n"
    "   输入: nums = [1,3,5,6], target = 5\n"
    "   输出: 2\n"
    "示例 2:\n"
    "   输入: nums = [1,3,5,6], target = 2\n"
    "   输出: 1\n"
    "示例 3:\n"
    "   输入: nums = [1,3,5,6], target = 7\n"
    "   输出: 4\n"
    "提示:\n"
    "· 1 <= nums.length <= 10^4\n"
    "· -10^4 <= nums[i] <= 10^4\n"
    "· nums 为 无重复元素 的 升序 排列数组\n"
    "· -10^4 <= target <= 10^4";
    
    self.outputTextView.text = @"请输入两行内容，第一行是数组，第二行是目标值";
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
    NSArray* inputLines = [self.inputTextView.text componentsSeparatedByString:@"\n"];
    if (inputLines.count != 2) {
        self.outputTextView.text = @"请输入两行内容，第一行是数组，第二行是目标值";
        return;
    }
    
    // line 1
    std::vector<int> nums;
    NSArray* line1Strs = [inputLines[0] componentsSeparatedByString:@","];
    for (NSString* numStr in line1Strs) {
        nums.emplace_back([numStr intValue]);
    }
    
    // line 2
    NSString* line2Str = inputLines[1];
    int target = [line2Str intValue];
    
    LeetCode35Solution solution;
    int k = solution.searchInsert(nums, target);
    
    self.outputTextView.text = [@(k) stringValue];
}

@end

//
//  LeetCode215VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/5/31.
//

#import "LeetCode215VC.h"

#include "LeetCode215Solution.h"

@interface LeetCode215VC ()

@end

@implementation LeetCode215VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.descLabel.text = @"给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。\n"
    "请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。\n"
    "你必须设计并实现时间复杂度为 O(n) 的算法解决此问题。\n"
    "示例 1:\n"
    "   输入: [3,2,1,5,6,4], k = 2\n"
    "   输出: 5\n"
    "示例 2:\n"
    "   输入: [3,2,3,1,2,4,5,5,6], k = 4\n"
    "   输出: 4\n"
    "提示：\n"
    "· 1 <= k <= nums.length <= 105\n"
    "· -104 <= nums[i] <= 104\n";
    
    self.outputTextView.text = @"请输入两行内容，第一行是数组，第二行是整数 k";
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
        self.outputTextView.text = @"请输入两行内容，第一行是数组，第二行是整数 k";
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
    int k = [line2Str intValue];
    
    LeetCode215Solution solution;
    int num = solution.findKthLargest(nums, k);
    
    NSString* output = [NSString stringWithFormat:@"%@", @(num)];
    self.outputTextView.text = output;
}

@end

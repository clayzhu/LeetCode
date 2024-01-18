//
//  LeetCode283VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/1/17.
//

#import "LeetCode283VC.h"

#include "LeetCode283Solution.h"

@interface LeetCode283VC ()

@end

@implementation LeetCode283VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 283、移动零
    self.descLabel.text = @"给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。\n"
    "请注意，必须在不复制数组的情况下原地对数组进行操作。\n"
    "示例 1:\n"
    "输入: nums = [0,1,0,3,12]\n"
    "输出: [1,3,12,0,0]\n"
    "示例 2:\n"
    "输入: nums = [0]\n"
    "输出: [0]\n"
    "提示:\n"
    "· 1 <= nums.length <= 10^4\n"
    "· -2^31 <= nums[i] <= 2^31 - 1\n"
    "**进阶：**你能尽量减少完成的操作次数吗？";
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
    
    LeetCode283Solution solution;
    solution.moveZeroes(nums);
    
    NSMutableArray* outputNums = [NSMutableArray array];
    for (int num : nums) {
        [outputNums addObject:@(num)];
    }
    NSString* output = [outputNums componentsJoinedByString:@","];
    self.outputTextView.text = output;
}

@end

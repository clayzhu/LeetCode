//
//  LeetCode90VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/3/14.
//

#import "LeetCode90VC.h"

#include "LeetCode90Solution.h"

@interface LeetCode90VC ()

@end

@implementation LeetCode90VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 90、子集 II
    self.descLabel.text = @"给你一个整数数组 nums ，其中可能包含重复元素，请你返回该数组所有可能的子集（幂集）。\n"
    "解集 不能 包含重复的子集。返回的解集中，子集可以按 任意顺序 排列。\n"
    "示例 1：\n"
    "   输入：nums = [1,2,2]\n"
    "   输出：[[],[1],[1,2],[1,2,2],[2],[2,2]]\n"
    "示例 2：\n"
    "   输入：nums = [0]\n"
    "   输出：[[],[0]]\n"
    "提示：\n"
    "· 1 <= nums.length <= 10\n"
    "· -10 <= nums[i] <= 10";
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
    
    LeetCode90Solution solution;
    std::vector<std::vector<int>> result = solution.subsetsWithDup(nums);
    
    NSMutableArray* outputNums = [NSMutableArray array];
    for (auto& interval : result) {
        NSMutableArray* intervalArray = [NSMutableArray array];
        for (int num : interval) {
            [intervalArray addObject:@(num)];
        }
        NSString* intervalStr = [NSString stringWithFormat:@"[%@]",
                                 [intervalArray componentsJoinedByString:@","]];
        [outputNums addObject:intervalStr];
    }
    NSString* output = [NSString stringWithFormat:@"[%@]",
                        [outputNums componentsJoinedByString:@","]];
    self.outputTextView.text = output;
}

@end

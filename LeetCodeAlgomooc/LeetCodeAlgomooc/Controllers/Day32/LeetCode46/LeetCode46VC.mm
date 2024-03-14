//
//  LeetCode46VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/3/14.
//

#import "LeetCode46VC.h"

#include "LeetCode46Solution.h"

@interface LeetCode46VC ()

@end

@implementation LeetCode46VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 46、全排列
    self.descLabel.text = @"给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。\n"
    "示例 1：\n"
    "   输入：nums = [1,2,3]\n"
    "   输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]\n"
    "示例 2：\n"
    "   输入：nums = [0,1]\n"
    "   输出：[[0,1],[1,0]]\n"
    "示例 3：\n"
    "   输入：nums = [1]\n"
    "   输出：[[1]]\n"
    "提示：\n"
    "· 1 <= nums.length <= 6\n"
    "· -10 <= nums[i] <= 10\n"
    "· nums 中的所有整数 互不相同";
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
    
    LeetCode46Solution solution;
    std::vector<std::vector<int>> result = solution.permute(nums);
    
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

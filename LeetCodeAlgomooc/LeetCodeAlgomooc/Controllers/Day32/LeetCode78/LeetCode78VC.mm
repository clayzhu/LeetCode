//
//  LeetCode78VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/3/14.
//

#import "LeetCode78VC.h"

#include "LeetCode78Solution.h"

@interface LeetCode78VC ()

@end

@implementation LeetCode78VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 78、子集
    self.descLabel.text = @"给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。\n"
    "解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。\n"
    "示例 1：\n"
    "   输入：nums = [1,2,3]\n"
    "   输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]\n"
    "示例 2：\n"
    "   输入：nums = [0]\n"
    "   输出：[[],[0]]\n"
    "提示：\n"
    "· 1 <= nums.length <= 10\n"
    "· -10 <= nums[i] <= 10\n"
    "· nums 中的所有元素 互不相同";
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
    
    LeetCode78Solution solution;
    std::vector<std::vector<int>> result = solution.subsets(nums);
    
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

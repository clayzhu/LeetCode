//
//  LeetCode47VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/3/15.
//

#import "LeetCode47VC.h"

#include "LeetCode47Solution.h"

@interface LeetCode47VC ()

@end

@implementation LeetCode47VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 47、全排列 II
    self.descLabel.text = @"给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。\n"
    "示例 1：\n"
    "   输入：nums = [1,1,2]\n"
    "   输出：\n"
    "   [[1,1,2],\n"
    "    [1,2,1],\n"
    "    [2,1,1]]\n"
    "示例 2：\n"
    "   输入：nums = [1,2,3]\n"
    "   输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]\n"
    "提示：\n"
    "· 1 <= nums.length <= 8\n"
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
    
    LeetCode47Solution solution;
    std::vector<std::vector<int>> result = solution.permuteUnique(nums);
    
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

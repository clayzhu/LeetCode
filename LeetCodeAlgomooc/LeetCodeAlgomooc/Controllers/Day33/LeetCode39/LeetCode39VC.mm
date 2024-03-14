//
//  LeetCode39VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/3/14.
//

#import "LeetCode39VC.h"

#include "LeetCode39Solution.h"

@interface LeetCode39VC ()

@end

@implementation LeetCode39VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 39、组合总和
    self.descLabel.text = @"给你一个 无重复元素 的整数数组 candidates 和一个目标整数 target ，找出 candidates 中可以使数字和为目标数 target 的 所有 不同组合 ，并以列表形式返回。你可以按 任意顺序 返回这些组合。\n"
    "candidates 中的 同一个 数字可以 无限制重复被选取 。如果至少一个数字的被选数量不同，则两种组合是不同的。\n"
    "对于给定的输入，保证和为 target 的不同组合数少于 150 个。\n"
    "示例 1：\n"
    "   输入：candidates = [2,3,6,7], target = 7\n"
    "   输出：[[2,2,3],[7]]\n"
    "   解释：\n"
    "   2 和 3 可以形成一组候选，2 + 2 + 3 = 7 。注意 2 可以使用多次。\n"
    "   7 也是一个候选， 7 = 7 。\n"
    "   仅有这两种组合。\n"
    "示例 2：\n"
    "   输入: candidates = [2,3,5], target = 8\n"
    "   输出: [[2,2,2,2],[2,3,3],[3,5]]\n"
    "示例 3：\n"
    "   输入: candidates = [2], target = 1\n"
    "   输出: []\n"
    "提示：\n"
    "· 1 <= candidates.length <= 30\n"
    "· 2 <= candidates[i] <= 40\n"
    "· candidates 的所有元素 互不相同\n"
    "· 1 <= target <= 40";
    
    self.outputTextView.text = @"请输入两行内容，第一行是数组，第二行是目标整数";
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
        self.outputTextView.text = @"请输入两行内容，第一行是数组，第二行是目标整数";
        return;
    }
    
    // line 1
    std::vector<int> candidates;
    NSArray* line1Strs = [inputLines[0] componentsSeparatedByString:@","];
    for (NSString* numStr in line1Strs) {
        candidates.emplace_back([numStr intValue]);
    }
    
    // line 2
    NSString* line2Str = inputLines[1];
    int target = [line2Str intValue];
    
    LeetCode39Solution solution;
    std::vector<std::vector<int>> result = solution.combinationSum(candidates, target);
    
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

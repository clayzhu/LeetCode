//
//  LeetCode56VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/29.
//

#import "LeetCode56VC.h"

#include "LeetCode56Solution.h"

@interface LeetCode56VC ()

@end

@implementation LeetCode56VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 56、合并区间
    self.descLabel.text = @"以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回 一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间 。\n"
    "示例 1：\n"
    "   输入：intervals = [[1,3],[2,6],[8,10],[15,18]]\n"
    "   输出：[[1,6],[8,10],[15,18]]\n"
    "   解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].\n"
    "示例 2：\n"
    "   输入：intervals = [[1,4],[4,5]]\n"
    "   输出：[[1,5]]\n"
    "   解释：区间 [1,4] 和 [4,5] 可被视为重叠区间。\n"
    "提示：\n"
    "· 1 <= intervals.length <= 104\n"
    "· intervals[i].length == 2\n"
    "· 0 <= starti <= endi <= 104";
    
    self.outputTextView.text = @"请输入多行内容，每行一个区间，“[]”符号不需要写";
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
    std::vector<std::vector<int>> intervals;
    for (NSString* line in inputLines) {
        NSArray* nums = [line componentsSeparatedByString:@","];
        if (nums.count != 2) {
            continue;
        }
        std::vector<int> interval {[nums[0] intValue], [nums[1] intValue]};
        intervals.emplace_back(std::move(interval));
    }
    
    LeetCode56Solution solution;
    std::vector<std::vector<int>> result = solution.merge(intervals);
    
    NSMutableArray* outputNums = [NSMutableArray array];
    for (auto& interval : result) {
        NSArray* intervalArray = @[@(interval[0]), @(interval[1])];
        NSString* intervalStr = [NSString stringWithFormat:@"[%@]",
                                 [intervalArray componentsJoinedByString:@","]];
        [outputNums addObject:intervalStr];
    }
    NSString* output = [NSString stringWithFormat:@"[%@]",
                        [outputNums componentsJoinedByString:@","]];
    self.outputTextView.text = output;
}

@end

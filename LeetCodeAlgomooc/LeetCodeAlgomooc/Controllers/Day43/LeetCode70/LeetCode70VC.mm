//
//  LeetCode70VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/3/4.
//

#import "LeetCode70VC.h"

#include "LeetCode70Solution.h"

@interface LeetCode70VC ()

@end

@implementation LeetCode70VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 70、爬楼梯
    self.descLabel.text = @"假设你正在爬楼梯。需要 n 阶你才能到达楼顶。\n"
    "每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？\n"
    "示例 1：\n"
    "   输入：n = 2\n"
    "   输出：2\n"
    "   解释：有两种方法可以爬到楼顶。\n"
    "   1. 1 阶 + 1 阶\n"
    "   2. 2 阶\n"
    "示例 2：\n"
    "   输入：n = 3\n"
    "   输出：3\n"
    "   解释：有三种方法可以爬到楼顶。\n"
    "   1. 1 阶 + 1 阶 + 1 阶\n"
    "   2. 1 阶 + 2 阶\n"
    "   3. 2 阶 + 1 阶\n"
    "提示：\n"
    "· 1 <= n <= 45";
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
    int n = [self.inputTextView.text intValue];
    if (n <= 0) {
        self.outputTextView.text = @"请输入 1 <= n <= 45 范围内的数字";
        return;
    }
    
    LeetCode70Solution solution;
    int result = solution.climbStairs(n);
    
    self.outputTextView.text = [@(result) stringValue];
}

@end

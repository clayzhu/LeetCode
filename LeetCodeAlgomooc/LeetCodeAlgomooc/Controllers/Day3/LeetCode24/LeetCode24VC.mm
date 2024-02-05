//
//  LeetCode24VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/5.
//

#import "LeetCode24VC.h"

#include "LeetCode24Solution.h"

@interface LeetCode24VC ()

@end

@implementation LeetCode24VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 24、两两交换链表中的节点
    self.descLabel.text = @"给你一个链表，两两交换其中相邻的节点，并返回交换后链表的头节点。你必须在不修改节点内部的值的情况下完成本题（即，只能进行节点交换）。\n"
    "示例 1：\n"
    "   输入：head = [1,2,3,4]\n"
    "   输出：[2,1,4,3]\n"
    "示例 2：\n"
    "   输入：head = []\n"
    "   输出：[]\n"
    "示例 3：\n"
    "   输入：head = [1]\n"
    "   输出：[1]\n"
    "提示：\n"
    "· 链表中节点的数目在范围 [0, 100] 内\n"
    "· 0 <= Node.val <= 100\n";
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
    
}

@end

//
//  LeetCode19VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/2.
//

#import "LeetCode19VC.h"

#include "LeetCode19Solution.h"

@interface LeetCode19VC ()

@end

@implementation LeetCode19VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.descLabel.text = @"给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。\n"
    "示例 1：\n"
    "   输入：head = [1,2,3,4,5], n = 2\n"
    "   输出：[1,2,3,5]\n"
    "示例 2：\n"
    "   输入：head = [1], n = 1\n"
    "   输出：[]\n"
    "示例 3：\n"
    "   输入：head = [1,2], n = 1\n"
    "   输出：[1]\n"
    "提示：\n"
    "· 链表中结点的数目为 sz\n"
    "· 1 <= sz <= 30\n"
    "· 0 <= Node.val <= 100\n"
    "· 1 <= n <= sz\n"
    "进阶：你能尝试使用一趟扫描实现吗？";
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

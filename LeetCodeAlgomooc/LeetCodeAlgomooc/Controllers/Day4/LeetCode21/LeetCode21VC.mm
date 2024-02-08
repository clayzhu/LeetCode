//
//  LeetCode21VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/8.
//

#import "LeetCode21VC.h"

#include "LeetCode21Solution.h"

@interface LeetCode21VC ()

@end

@implementation LeetCode21VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 21、合并两个有序链表
    self.descLabel.text = @"将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。\n"
    "示例 1：\n"
    "   输入：l1 = [1,2,4], l2 = [1,3,4]\n"
    "   输出：[1,1,2,3,4,4]\n"
    "示例 2：\n"
    "   输入：l1 = [], l2 = []\n"
    "   输出：[]\n"
    "示例 3：\n"
    "   输入：l1 = [], l2 = [0]\n"
    "   输出：[0]\n"
    "提示：\n"
    "· 两个链表的节点数目范围是 [0, 50]\n"
    "· -100 <= Node.val <= 100\n"
    "· l1 和 l2 均按 非递减顺序 排列";
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
        self.outputTextView.text = @"请输入两行内容，每行分别是一个链表";
        return;
    }
    
    // line 1
    ListNode* firstNodeA = nullptr;
    ListNode* formerNodeA = nullptr;
    NSArray* line1Strs = [inputLines[0] componentsSeparatedByString:@","];
    for (int i = 0; i < line1Strs.count; i ++) {
        int num = [line1Strs[i] intValue];
        ListNode* currentNode = new ListNode(num);
        if (i == 0) {
            firstNodeA = currentNode;
        } else {
            formerNodeA->next = currentNode;
        }
        formerNodeA = currentNode;
    }
    
    // line 2
    ListNode* firstNodeB = nullptr;
    ListNode* formerNodeB = nullptr;
    NSArray* line2Strs = [inputLines[1] componentsSeparatedByString:@","];
    for (int i = 0; i < line2Strs.count; i ++) {
        int num = [line2Strs[i] intValue];
        ListNode* currentNode = new ListNode(num);
        if (i == 0) {
            firstNodeB = currentNode;
        } else {
            formerNodeB->next = currentNode;
        }
        formerNodeB = currentNode;
    }
    
    LeetCode21Solution solution;
    ListNode* resultFirstNode = solution.mergeTwoLists(firstNodeA, firstNodeB);
    
    NSMutableArray* outputNums = [NSMutableArray array];
    ListNode* resultCurrentNode = resultFirstNode;
    while (resultCurrentNode != nullptr) {
        [outputNums addObject:@(resultCurrentNode->val)];
        resultCurrentNode = resultCurrentNode->next;
    }
    NSString* output = [outputNums componentsJoinedByString:@","];
    self.outputTextView.text = output;
}

@end

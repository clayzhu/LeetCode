//
//  LeetCode160VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/5.
//

#import "LeetCode160VC.h"

#include "LeetCode160Solution.h"

@interface LeetCode160VC ()

@end

@implementation LeetCode160VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 160、相交链表
    self.descLabel.text = @"给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 null 。\n"
    "图示两个链表在节点 c1 开始相交：\n"
    "题目数据 保证 整个链式结构中不存在环。\n"
    "注意，函数返回结果后，链表必须 保持其原始结构 。";
    
    self.outputTextView.text = @"请输入两行内容，分别是2个链表";
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
    
    LeetCode160Solution solution;
    ListNode* resultNode = solution.getIntersectionNode(firstNodeA, firstNodeB);
    
    if (resultNode == nullptr) {
        self.outputTextView.text = @"nullptr";
    } else {
        self.outputTextView.text = [NSString stringWithFormat:@"%@", @(resultNode->val)];
    }
}

@end

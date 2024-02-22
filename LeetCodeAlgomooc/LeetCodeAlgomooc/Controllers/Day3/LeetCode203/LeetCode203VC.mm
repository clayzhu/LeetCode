//
//  LeetCode203VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/8.
//

#import "LeetCode203VC.h"

#include "LeetCode203Solution.h"

@interface LeetCode203VC ()

@end

@implementation LeetCode203VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 203、移除链表元素
    self.descLabel.text = @"给你一个链表的头节点 head 和一个整数 val ，请你删除链表中所有满足 Node.val == val 的节点，并返回 新的头节点 。\n"
    "示例 1：\n"
    "   输入：head = [1,2,6,3,4,5,6], val = 6\n"
    "   输出：[1,2,3,4,5]\n"
    "示例 2：\n"
    "   输入：head = [], val = 1\n"
    "   输出：[]\n"
    "示例 3：\n"
    "   输入：head = [7,7,7,7], val = 7\n"
    "   输出：[]\n"
    "提示：\n"
    "· 列表中的节点数目在范围 [0, 104] 内\n"
    "· 1 <= Node.val <= 50\n"
    "· 0 <= val <= 50";
    
    self.outputTextView.text = @"请输入两行内容，第一行是链表，第二行是需移除的结点值 val";
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
        self.outputTextView.text = @"请输入两行内容，第一行是链表，第二行是需移除的结点值 val";
        return;
    }
    
    // line 1
    ListNode* firstNode = nullptr;
    ListNode* formerNode = nullptr;
    NSArray* line1Strs = [inputLines[0] componentsSeparatedByString:@","];
    for (int i = 0; i < line1Strs.count; i ++) {
        int num = [line1Strs[i] intValue];
        ListNode* currentNode = new ListNode(num);
        if (i == 0) {
            firstNode = currentNode;
        } else {
            formerNode->next = currentNode;
        }
        formerNode = currentNode;
    }
    
    // line 2
    NSString* line2Str = inputLines[1];
    int val = [line2Str intValue];
    
    LeetCode203Solution solution;
    ListNode* resultFirstNode = solution.removeElements(firstNode, val);
    
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

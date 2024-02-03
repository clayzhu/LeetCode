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
    // LeetCode 19、删除链表的倒数第 N 个结点
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
    
    self.outputTextView.text = @"请输入两行内容，第一行是链表，第二行是需移除的倒数第 n 个结点";
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
        self.outputTextView.text = @"请输入两行内容，第一行是链表，第二行是需移除的倒数第 n 个结点";
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
    int n = [line2Str intValue];
    
    LeetCode19Solution solution;
    ListNode* resultFirstNode = solution.removeNthFromEnd(firstNode, n);
    
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

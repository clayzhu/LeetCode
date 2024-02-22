//
//  LeetCode876VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/22.
//

#import "LeetCode876VC.h"

#include "LeetCode876Solution.h"

@interface LeetCode876VC ()

@end

@implementation LeetCode876VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 876、链表的中间结点
    self.descLabel.text = @"给你单链表的头结点 head ，请你找出并返回链表的中间结点。\n"
    "如果有两个中间结点，则返回第二个中间结点。\n"
    "示例 1：\n"
    "   输入：head = [1,2,3,4,5]\n"
    "   输出：[3,4,5]\n"
    "   解释：链表只有一个中间结点，值为 3 。\n"
    "示例 2：\n"
    "   输入：head = [1,2,3,4,5,6]\n"
    "   输出：[4,5,6]\n"
    "   解释：该链表有两个中间结点，值分别为 3 和 4 ，返回第二个结点。\n"
    "提示：\n"
    "· 链表的结点数范围是 [1, 100]\n"
    "· 1 <= Node.val <= 100\n";
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
    ListNode* firstNode = nullptr;
    ListNode* formerNode = nullptr;
    NSArray* inputStrs = [self.inputTextView.text componentsSeparatedByString:@","];
    for (int i = 0; i < inputStrs.count; i ++) {
        int num = [inputStrs[i] intValue];
        ListNode* currentNode = new ListNode(num);
        if (i == 0) {
            firstNode = currentNode;
        } else {
            formerNode->next = currentNode;
        }
        formerNode = currentNode;
    }
    
    LeetCode876Solution solution;
    ListNode* resultFirstNode = solution.middleNode(firstNode);
    
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

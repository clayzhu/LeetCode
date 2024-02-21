//
//  LeetCode206VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/21.
//

#import "LeetCode206VC.h"

#include "LeetCode206Solution.h"

@interface LeetCode206VC ()

@end

@implementation LeetCode206VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 206、反转链表
    self.descLabel.text = @"给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。\n"
    "示例 1：\n"
    "   输入：head = [1,2,3,4,5]\n"
    "   输出：[5,4,3,2,1]\n"
    "示例 2：\n"
    "   输入：head = [1,2]\n"
    "   输出：[2,1]\n"
    "示例 3：\n"
    "   输入：head = []\n"
    "   输出：[]\n"
    "提示：\n"
    "· 链表中节点的数目范围是 [0, 5000]\n"
    "· -5000 <= Node.val <= 5000\n"
    "进阶：链表可以选用迭代或递归方式完成反转。你能否用两种方法解决这道题？";
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
    
    LeetCode206Solution solution;
    ListNode* resultFirstNode = solution.reverseList(firstNode);
    
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

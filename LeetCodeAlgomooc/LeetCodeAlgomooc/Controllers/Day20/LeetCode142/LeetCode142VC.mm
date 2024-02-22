//
//  LeetCode142VC.m
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/22.
//

#import "LeetCode142VC.h"

#include "LeetCode142Solution.h"

@interface LeetCode142VC ()

@end

@implementation LeetCode142VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 142、环形链表 II
    self.descLabel.text = @"给定一个链表的头节点 head，返回链表开始入环的第一个节点。如果链表无环，则返回 null。\n"
    "如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。\n"
    "不允许修改链表。\n"
    "示例 1：\n"
    "   输入：head = [3,2,0,-4], pos = 1\n"
    "   输出：返回索引为 1 的链表节点\n"
    "   解释：链表中有一个环，其尾部连接到第二个节点。\n"
    "示例 2：\n"
    "   输入：head = [1,2], pos = 0\n"
    "   输出：返回索引为 0 的链表节点\n"
    "   解释：链表中有一个环，其尾部连接到第一个节点。\n"
    "示例 3：\n"
    "   输入：head = [1], pos = -1\n"
    "   输出：返回 null\n"
    "   解释：链表中没有环。\n"
    "提示：\n"
    "· 链表中节点的数目范围在范围 [0, 10^4] 内\n"
    "· -10^5 <= Node.val <= 10^5\n"
    "· pos 的值为 -1 或者链表中的一个有效索引\n"
    "进阶：你是否可以使用 O(1) 空间解决此题？";
    
    self.outputTextView.text = @"请输入两行内容，第一行是链表，第二行是链表环的起点和终点位置（位置从0开始，以“,”分隔；如果链表无环，则填写 null）";
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
        self.outputTextView.text = @"请输入两行内容，第一行是链表，第二行是链表环的起点和终点位置（位置从0开始，以“,”分隔；如果链表无环，则填写 null）";
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
    NSArray* line2Strs = [inputLines[1] componentsSeparatedByString:@","];
    if (line2Strs.count != 2 &&
        (line2Strs.count == 1 && ![line2Strs[0] isEqualToString:@"null"])) {
        self.outputTextView.text = @"第二行是链表环的起点和终点位置（位置从0开始，以“,”分隔；如果链表无环，则填写 null）";
        return;
    }
    if (line2Strs.count == 2) {
        NSInteger begin = [line2Strs[0] integerValue], end = [line2Strs[1] integerValue];
        if (begin < 0 || end > line1Strs.count - 1) {
            self.outputTextView.text = @"第二行的链表环的起点和终点位置不能越界";
            return;
        }
        ListNode* beginNode = nullptr;
        NSInteger curPos = 0;
        ListNode* curNode = firstNode;
        while (curNode != nullptr) {
            if (curPos == begin) {
                beginNode = curNode;
            }
            if (curPos == end) {
                curNode->next = beginNode;
                break;
            }
            
            curPos ++;
            curNode = curNode->next;
        }
    }
    
    LeetCode142Solution solution;
    ListNode* resultFirstNode = solution.detectCycle(firstNode);
    
    NSString* output = [NSString stringWithFormat:@"%@",
                        resultFirstNode == nullptr ? @"null" : @(resultFirstNode->val)];
    self.outputTextView.text = output;
}

@end

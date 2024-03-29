//
//  LeetCode19Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/2.
//

#ifndef LeetCode19Solution_h
#define LeetCode19Solution_h

struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

/// LeetCode 19、删除链表的倒数第 N 个结点
///
/// "给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。"
/// "示例 1："
/// "   输入：head = [1,2,3,4,5], n = 2"
/// "   输出：[1,2,3,5]"
/// "示例 2："
/// "   输入：head = [1], n = 1"
/// "   输出：[]"
/// "示例 3："
/// "   输入：head = [1,2], n = 1"
/// "   输出：[1]"
/// "提示："
/// "· 链表中结点的数目为 sz"
/// "· 1 <= sz <= 30"
/// "· 0 <= Node.val <= 100"
/// "· 1 <= n <= sz"
/// "进阶：你能尝试使用一趟扫描实现吗？"
class LeetCode19Solution {
    
public:
    ListNode* removeNthFromEnd(ListNode* head, int n) {
        ListNode* virtualHeadNode = new ListNode(-1, head);
        
        ListNode* formerNode = head;
        for (int i = 0; i < n; i ++) {
            formerNode = formerNode->next;
        }
        
        ListNode* curNode = head;
        ListNode* latterNode = virtualHeadNode;
        
        while (formerNode != nullptr) {
            formerNode = formerNode->next;
            curNode = curNode->next;
            latterNode = latterNode->next;
        }
        
        latterNode->next = curNode->next;
        
//        return head;    // error
        return virtualHeadNode->next;
    }
    
};

#endif /* LeetCode19Solution_h */

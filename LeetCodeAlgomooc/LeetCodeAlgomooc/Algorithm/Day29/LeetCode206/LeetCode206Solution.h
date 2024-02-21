//
//  LeetCode206Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/21.
//

#ifndef LeetCode206Solution_h
#define LeetCode206Solution_h

struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

/// LeetCode 206、反转链表
///
/// 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
/// 示例 1：
///    输入：head = [1,2,3,4,5]
///    输出：[5,4,3,2,1]
/// 示例 2：
///    输入：head = [1,2]
///    输出：[2,1]
/// 示例 3：
///    输入：head = []
///    输出：[]
/// 提示：
/// · 链表中节点的数目范围是 [0, 5000]
/// · -5000 <= Node.val <= 5000
/// 进阶：链表可以选用迭代或递归方式完成反转。你能否用两种方法解决这道题？
class LeetCode206Solution {
    
public:
    ListNode* reverseList(ListNode* head) {
#if 1   // 迭代
        if (head == nullptr) {
            return nullptr;
        }
        
        ListNode* cur = head, *pre = nullptr, *temp = nullptr;
        while (cur != nullptr) {
            temp = cur->next;
            cur->next = pre;
            pre = cur;
            cur = temp;
        }
        
        return pre;
#else   // 递归
        if (head == nullptr || head->next == nullptr) {
            return head;
        }
        
        ListNode* cur = reverseList(head->next);
        head->next->next = head;
        head->next = nullptr;
        
        return cur;
#endif
    }
    
};

#endif /* LeetCode206Solution_h */

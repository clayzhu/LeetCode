//
//  LeetCode24Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/5.
//

#ifndef LeetCode24Solution_h
#define LeetCode24Solution_h

struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

/// LeetCode 24、两两交换链表中的节点
///
/// 给你一个链表，两两交换其中相邻的节点，并返回交换后链表的头节点。你必须在不修改节点内部的值的情况下完成本题（即，只能进行节点交换）。
/// 示例 1：
///    输入：head = [1,2,3,4]
///    输出：[2,1,4,3]
/// 示例 2：
///    输入：head = []
///    输出：[]
/// 示例 3：
///    输入：head = [1]
///    输出：[1]
/// 提示：
/// · 链表中节点的数目在范围 [0, 100] 内
/// · 0 <= Node.val <= 100
class LeetCode24Solution {
    
public:
    ListNode* swapPairs(ListNode* head) {
        if (head == nullptr || head->next == nullptr) {
            return head;
        }
        
        ListNode* subHead = swapPairs(head->next->next);
        ListNode* headNext = head->next;
        headNext->next = head;
        head->next = subHead;
        return headNext;
    }
    
};

#endif /* LeetCode24Solution_h */

//
//  LeetCode21Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/8.
//

#ifndef LeetCode21Solution_h
#define LeetCode21Solution_h

struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

/// LeetCode 21、合并两个有序链表
///
/// 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
/// 示例 1：
///    输入：l1 = [1,2,4], l2 = [1,3,4]
///    输出：[1,1,2,3,4,4]
/// 示例 2：
///    输入：l1 = [], l2 = []
///    输出：[]
/// 示例 3：
///    输入：l1 = [], l2 = [0]
///    输出：[0]
/// 提示：
/// · 两个链表的节点数目范围是 [0, 50]
/// · -100 <= Node.val <= 100
/// · l1 和 l2 均按 非递减顺序 排列
class LeetCode21Solution {
    
public:
    ListNode* mergeTwoLists(ListNode* list1, ListNode* list2) {
        ListNode* dummy = new ListNode(-1);
        ListNode* pre = dummy;
        ListNode* p1 = list1;
        ListNode* p2 = list2;
        while (p1 != nullptr && p2 != nullptr) {
            if (p1->val <= p2->val) {
                pre->next = p1;
                p1 = p1->next;
            } else {
                pre->next = p2;
                p2 = p2->next;
            }
            pre = pre->next;
        }
        
        if (p1 != nullptr) {
            pre->next = p1;
        }
        if (p2 != nullptr) {
            pre->next = p2;
        }
        return dummy->next;
    }
    
};

#endif /* LeetCode21Solution_h */

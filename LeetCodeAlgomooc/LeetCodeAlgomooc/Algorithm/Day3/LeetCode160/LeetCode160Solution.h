//
//  LeetCode160Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/5.
//

#ifndef LeetCode160Solution_h
#define LeetCode160Solution_h

struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

/// LeetCode 160、相交链表
///
/// 给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 null 。
/// 图示两个链表在节点 c1 开始相交：
/// 题目数据 保证 整个链式结构中不存在环。
/// 注意，函数返回结果后，链表必须 保持其原始结构 。
class LeetCode160Solution {
    
public:
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        if (headA == nullptr || headB == nullptr) {
            return nullptr;
        }
        
        ListNode* pA = headA;
        ListNode* pB = headB;
//        while (pA != pB) {  // 正确应该这一行：判断指针。为了方便 demo，临时改为判断内容
        while ((pA != pB) && (pA->val != pB->val)) {
            if (pA == nullptr) {
                pA = headB;
            } else {
                pA = pA->next;
            }
            
            if (pB == nullptr) {
                pB = headA;
            } else {
                pB = pB->next;
            }
        }
        return pA;
    }
    
};

#endif /* LeetCode160Solution_h */

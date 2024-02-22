//
//  LeetCode876Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/22.
//

#ifndef LeetCode876Solution_h
#define LeetCode876Solution_h

struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

/// LeetCode 876、链表的中间结点
///
/// 给你单链表的头结点 head ，请你找出并返回链表的中间结点。
/// 如果有两个中间结点，则返回第二个中间结点。
/// 示例 1：
///    输入：head = [1,2,3,4,5]
///    输出：[3,4,5]
///    解释：链表只有一个中间结点，值为 3 。
/// 示例 2：
///    输入：head = [1,2,3,4,5,6]
///    输出：[4,5,6]
///    解释：该链表有两个中间结点，值分别为 3 和 4 ，返回第二个结点。
/// 提示：
/// · 链表的结点数范围是 [1, 100]
/// · 1 <= Node.val <= 100
class LeetCode876Solution {
    
public:
    ListNode* middleNode(ListNode* head) {
        ListNode* slow = head, *fast = head;
        while (fast != nullptr && fast->next != nullptr) {
            slow = slow->next;
            fast = fast->next->next;
        }
        return slow;
    }
    
};

#endif /* LeetCode876Solution_h */

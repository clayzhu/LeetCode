//
//  LeetCode203Solution.h
//  LeetCodeAlgomooc
//
//  Created by Yukin Yang on 2024/2/8.
//

#ifndef LeetCode203Solution_h
#define LeetCode203Solution_h

struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

/// LeetCode 203、移除链表元素
///
/// 给你一个链表的头节点 head 和一个整数 val ，请你删除链表中所有满足 Node.val == val 的节点，并返回 新的头节点 。
/// 示例 1：
///    输入：head = [1,2,6,3,4,5,6], val = 6
///    输出：[1,2,3,4,5]
/// 示例 2：
///    输入：head = [], val = 1
///    输出：[]
/// 示例 3：
///    输入：head = [7,7,7,7], val = 7
///    输出：[]
/// 提示：
/// · 列表中的节点数目在范围 [0, 104] 内
/// · 1 <= Node.val <= 50
/// · 0 <= val <= 50
class LeetCode203Solution {
    
public:
    ListNode* removeElements(ListNode* head, int val) {
#if 0   // algomooc
        if (head == nullptr) {
            return nullptr;
        }
        
        ListNode* dummy = new ListNode(-1, head);
        ListNode* pre = dummy;
        ListNode* cur = head;
        while (cur != nullptr) {
            if (cur->val == val) {
                pre->next = cur->next;
            } else {
                pre = cur;
            }
            cur = cur->next;
        }
        return dummy->next;
#else   // leetcode
        struct ListNode* dummyHead = new ListNode(0, head);
        struct ListNode* temp = dummyHead;
        while (temp->next != NULL) {
            if (temp->next->val == val) {
                temp->next = temp->next->next;
            } else {
                temp = temp->next;
            }
        }
        return dummyHead->next;

//        作者：力扣官方题解
//        链接：https://leetcode.cn/problems/remove-linked-list-elements/solutions/813358/yi-chu-lian-biao-yuan-su-by-leetcode-sol-654m/
//        来源：力扣（LeetCode）
//        著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
#endif
    }
    
};

#endif /* LeetCode203Solution_h */

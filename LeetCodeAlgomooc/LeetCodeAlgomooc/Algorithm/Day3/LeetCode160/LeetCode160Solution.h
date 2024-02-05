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

#endif /* LeetCode160Solution_h */

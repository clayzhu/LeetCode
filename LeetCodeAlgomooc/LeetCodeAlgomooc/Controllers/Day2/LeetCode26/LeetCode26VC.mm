//
//  LeetCode26VC.m
//  LeetCodeAlgomooc
//
//  Created by admin on 2024/1/18.
//

#import "LeetCode26VC.h"

#include "LeetCode26Solution.h"

@interface LeetCode26VC ()

@end

@implementation LeetCode26VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // LeetCode 26、删除有序数组中的重复项
    self.descLabel.text = @"给你一个 升序排列 的数组 nums ，请你** 原地 (opens new window)** 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。元素的 相对顺序 应该保持 一致 。\n"
    "由于在某些语言中不能改变数组的长度，所以必须将结果放在数组nums的第一部分。更规范地说，如果在删除重复项之后有 k 个元素，那么 nums 的前 k 个元素应该保存最终结果。\n"
    "将最终结果插入 nums 的前 k 个位置后返回 k 。\n"
    "不要使用额外的空间，你必须在 **原地  (opens new window)**修改输入数组并在使用 O(1) 额外空间的条件下完成。\n"
    "示例 1：\n"
    "输入：nums = [1,1,2] 输出：2, nums = [1,2,_] 解释：函数应该返回新的长度 2 ，并且原数组 nums 的前两个元素被修改为 1, 2 。不需要考虑数组中超出新长度后面的元素。\n"
    "示例 2：\n"
    "输入：nums = [0,0,1,1,1,2,2,3,3,4] 输出：5, nums = [0,1,2,3,4] 解释：函数应该返回新的长度 5 ， 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4 。不需要考虑数组中超出新长度后面的元素。\n"
    "提示：\n"
    "· 1 <= nums.length <= 3 * 10^4\n"
    "· -10^4 <= nums[i] <= 10^4\n"
    "· nums 已按 升序 排列\n";
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
    std::vector<int> nums;
    NSArray* inputStrs = [self.inputTextView.text componentsSeparatedByString:@","];
    for (NSString* numStr in inputStrs) {
        nums.emplace_back([numStr intValue]);
    }
    
    LeetCode26Solution solution;
    int k = solution.removeDuplicates(nums);
    
    NSMutableArray* outputNums = [NSMutableArray array];
    for (int i = 0; i < k; i ++) {
        [outputNums addObject:@(nums[i])];
    }
    NSString* output = [outputNums componentsJoinedByString:@","];
    self.outputTextView.text = output;
}

@end

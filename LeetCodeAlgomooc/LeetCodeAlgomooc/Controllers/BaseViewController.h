//
//  BaseViewController.h
//  LeetCodeAlgomooc
//
//  Created by admin on 2024/1/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UIScrollView* scrollView;

/// 题目描述
@property (nonatomic, strong) UILabel* descLabel;
/// 输入。如果输入数组，使用“,”分割
@property (nonatomic, strong) UITextView* inputTextView;
/// 输出
@property (nonatomic, strong) UITextView* outputTextView;

/// 创建布局，默认创建好了上面这些控件。子类可以重写（需要调用 super）
- (void)createLayout;

/// 执行算法。子类必须重写（不需要调用 super）
- (void)exeAlgorithm;

@end

NS_ASSUME_NONNULL_END

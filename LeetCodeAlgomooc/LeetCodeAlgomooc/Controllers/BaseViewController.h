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
@property (nonatomic, strong) UILabel* descLable;
/// 输入
@property (nonatomic, strong) UITextView* inputTextView;

/// 创建布局，默认创建好了上面这些控件，子类可以重写
- (void)createLayout;

@end

NS_ASSUME_NONNULL_END

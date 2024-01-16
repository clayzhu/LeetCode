//
//  BaseViewController.m
//  LeetCodeAlgomooc
//
//  Created by admin on 2024/1/16.
//

#import "BaseViewController.h"

#import <Masonry/Masonry.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createLayout];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)createLayout {
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0.0);
    }];
    
    // 题目描述
    UILabel* descLable = [[UILabel alloc] init];
    self.descLable = descLable;
    [scrollView addSubview:descLable];
    [descLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8.0);
        make.left.mas_equalTo(8.0);
        make.centerX.mas_equalTo(0.0);
    }];
    descLable.numberOfLines = 0;
    descLable.font = [UIFont systemFontOfSize:14.0];
    
    // 输入
    UITextView* inputTextView = [[UITextView alloc] init];
    self.inputTextView = inputTextView;
    [scrollView addSubview:inputTextView];
    [inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(descLable.mas_bottom).offset(8.0);
        make.left.mas_equalTo(8.0);
        make.centerX.mas_equalTo(0.0);
        make.height.mas_equalTo(50.0);
        make.bottom.equalTo(scrollView.mas_bottom).offset(-8.0);
    }];
    inputTextView.layer.borderWidth = 0.5;
}

@end

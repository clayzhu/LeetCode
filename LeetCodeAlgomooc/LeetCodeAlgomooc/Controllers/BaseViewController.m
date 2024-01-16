//
//  BaseViewController.m
//  LeetCodeAlgomooc
//
//  Created by admin on 2024/1/16.
//

#import "BaseViewController.h"

#import <Masonry/Masonry.h>

#define NAMethodNotImplemented() \
    @throw [NSException exceptionWithName:NSInternalInconsistencyException \
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)] \
                                 userInfo:nil]

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavItem];
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

#pragma mark - Setup
- (void)createNavItem {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"执行" style:UIBarButtonItemStylePlain target:self action:@selector(exeAlgorithm)];
}

- (void)createLayout {
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0.0);
    }];
    
    // 标题
    UILabel* titleLabel = [[UILabel alloc] init];
    [scrollView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8.0);
        make.left.mas_equalTo(8.0);
        make.centerX.mas_equalTo(0.0);
    }];
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
    titleLabel.text = self.title;
    
    // 题目描述
    UILabel* descLabel = [[UILabel alloc] init];
    self.descLabel = descLabel;
    [scrollView addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(8.0);
        make.left.mas_equalTo(8.0);
        make.centerX.mas_equalTo(0.0);
    }];
    descLabel.numberOfLines = 0;
    descLabel.font = [UIFont systemFontOfSize:14.0];
    
    // 输入
    UILabel* inputLabel = [[UILabel alloc] init];
    [scrollView addSubview:inputLabel];
    [inputLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(descLabel.mas_bottom).offset(8.0);
        make.left.mas_equalTo(8.0);
        make.centerX.mas_equalTo(0.0);
    }];
    inputLabel.text = @"输入：";
    inputLabel.font = [UIFont boldSystemFontOfSize:14.0];
    
    UITextView* inputTextView = [[UITextView alloc] init];
    self.inputTextView = inputTextView;
    [scrollView addSubview:inputTextView];
    [inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(inputLabel.mas_bottom).offset(8.0);
        make.left.mas_equalTo(8.0);
        make.centerX.mas_equalTo(0.0);
        make.height.mas_equalTo(50.0);
    }];
    inputTextView.layer.borderWidth = 0.5;
    
    // 输出
    UILabel* outputLabel = [[UILabel alloc] init];
    [scrollView addSubview:outputLabel];
    [outputLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(inputTextView.mas_bottom).offset(8.0);
        make.left.mas_equalTo(8.0);
        make.centerX.mas_equalTo(0.0);
    }];
    outputLabel.text = @"输出：";
    outputLabel.font = [UIFont boldSystemFontOfSize:14.0];
    
    UITextView* outputTextView = [[UITextView alloc] init];
    self.outputTextView = outputTextView;
    [scrollView addSubview:outputTextView];
    [outputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(outputLabel.mas_bottom).offset(8.0);
        make.left.mas_equalTo(8.0);
        make.centerX.mas_equalTo(0.0);
        make.height.mas_equalTo(50.0);
        make.bottom.equalTo(scrollView.mas_bottom).offset(-8.0);
    }];
    outputTextView.layer.borderWidth = 0.5;
}

#pragma mark - Action
- (void)exeAlgorithm {
    NAMethodNotImplemented();
}

@end

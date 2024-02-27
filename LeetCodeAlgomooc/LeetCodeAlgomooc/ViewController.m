//
//  ViewController.m
//  LeetCodeAlgomooc
//
//  Created by admin on 2024/1/16.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (copy, nonatomic) NSArray<NSDictionary<NSString*, NSArray*>*> *cellTextList;
@property (copy, nonatomic) NSArray<NSDictionary<NSString*, NSArray*>*> *cellDestinationVCList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"吴师兄学算法 LeetCode";
}

#pragma mark - cell data
- (NSArray<NSDictionary<NSString *,NSArray *> *> *)cellTextList {
    if (!_cellTextList) {
        _cellTextList = @[
            @{@"Day2":@[
                @"LeetCode 485、最大连续 1 的个数",
                @"LeetCode 283、移动零",
                @"LeetCode 26、删除有序数组中的重复项",
                @"LeetCode 27、移除元素",
            ]},
            @{@"Day3":@[
                @"LeetCode 19、删除链表的倒数第 N 个结点",
                @"LeetCode 24、两两交换链表中的节点",
                @"LeetCode 160、相交链表",
                @"LeetCode 203、移除链表元素",
            ]},
            @{@"Day4":@[
                @"LeetCode 21、合并两个有序链表",
                @"LeetCode 876、链表的中间结点",
            ]},
            @{@"Day20":@[
                @"LeetCode 142、环形链表 II",
            ]},
            @{@"Day29":@[
                @"LeetCode 206、反转链表",
            ]},
            @{@"Day36":@[
                @"LeetCode 144、二叉树的前序遍历",
                @"LeetCode 102、二叉树的层序遍历",
            ]},
        ];
    }
    return _cellTextList;
}

- (NSArray<NSDictionary<NSString *,NSArray *> *> *)cellDestinationVCList {
    if (!_cellDestinationVCList) {
        _cellDestinationVCList = @[
            @{@"Day2":@[
                @"LeetCode485VC",
                @"LeetCode283VC",
                @"LeetCode26VC",
                @"LeetCode27VC",
            ]},
            @{@"Day3":@[
                @"LeetCode19VC",
                @"LeetCode24VC",
                @"LeetCode160VC",
                @"LeetCode203VC",
            ]},
            @{@"Day4":@[
                @"LeetCode21VC",
                @"LeetCode876VC",
            ]},
            @{@"Day20":@[
                @"LeetCode142VC",
            ]},
            @{@"Day29":@[
                @"LeetCode206VC",
            ]},
            @{@"Day36":@[
                @"LeetCode144VC",
                @"LeetCode102VC",
            ]},
        ];
    }
    return _cellDestinationVCList;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cellTextList.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.cellTextList[section].allKeys.firstObject;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellTextList[section].allValues.firstObject.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kMenuCell = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMenuCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kMenuCell];
    }
    cell.textLabel.text = self.cellTextList[indexPath.section].allValues.firstObject[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *destinationVCName = self.cellDestinationVCList[indexPath.section].allValues.firstObject[indexPath.row];
    Class destinationVCClass = NSClassFromString(destinationVCName);
    UIViewController *destinationVC = [[destinationVCClass alloc] init];
    destinationVC.title = self.cellTextList[indexPath.section].allValues.firstObject[indexPath.row];
    [self.navigationController pushViewController:destinationVC animated:YES];
}

@end

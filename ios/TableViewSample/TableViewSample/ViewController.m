//
//  ViewController.m
//  TableViewSample
//
//  Created by fujita taisuke on 2012/11/19.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSArray *groupNames;
    NSArray *groups;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    groupNames = @[@"ビートルズ", @"レッド・ツェッペリン"];
    groups = @[
        @[@"ジョン・レノン", @"ポール・マッカートニー", @"ジョージ・ハリスン", @"リチャード・スターキー"],
        @[@"ジミー・ペイジ", @"ロバート・プラント", @"ジョン・ポール・ジョーンズ", @"ジョン・ボーナム"]
        ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [groups[section] count ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [groupNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSArray *members = groups[indexPath.section];
    cell.textLabel.text = members[indexPath.row];
    return cell;
}

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"ヘッダー%d", section+1];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"フッター%d", section+1];
}
*/

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Header"];
    if (!view) {
        view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"Header"];
    }
    view.textLabel.text = groupNames[section];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

@end

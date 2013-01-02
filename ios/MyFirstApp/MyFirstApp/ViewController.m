//
//  ViewController.m
//  MyFirstApp
//
//  Created by fujita taisuke on 2012/12/24.
//  Copyright (c) 2012年 9revolution9.com All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // xy座標(0, 0)、幅100、高さ100のUIViewクラスのインスタンスを生成する
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    // UIViewオブジェクトの背景色のデフォルト値は透明なため背景色を別の色に設定
    view.backgroundColor = [UIColor redColor];
    // viewプロパティにサブビューを追加する
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

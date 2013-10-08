//
//  ViewController1.m
//  AutolayoutSample
//
//  Created by fujita taisuke on 2013/10/07.
//  Copyright (c) 2013年 Revolution 9. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     * ナビゲーションコントローラを使って
     * ビューコントローラを管理している場合は下記設定が必要
     */
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // １つ目のビューのインスタンス生成
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor lightGrayColor];
    
    // 2つ目のビューのインスタンス生成
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor lightGrayColor];
    
    
    // スクロールビューにビューを追加する
    [self.scrollView addSubview:view1];
    [self.scrollView addSubview:view2];
    
    // AutoresizingMaskをオフにする
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Constraintsを追加
    [self.scrollView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"|-40-[view1(==240)]-20-[view2(==240)]-40-|"
                                             options:0
                                             metrics:0
                                               views:NSDictionaryOfVariableBindings(view1, view2)]];
    [self.scrollView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view1(==170)]"
                                             options:0
                                             metrics:0
                                               views:NSDictionaryOfVariableBindings(view1)]];
    [self.scrollView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view2(==170)]"
                                             options:0
                                             metrics:0
                                               views:NSDictionaryOfVariableBindings(view2)]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

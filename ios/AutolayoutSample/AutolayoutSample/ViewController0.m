//
//  ViewController0.m
//  AutolayoutSample
//
//  Created by fujita taisuke on 2013/10/07.
//  Copyright (c) 2013年 Revolution 9. All rights reserved.
//

#import "ViewController0.h"

@interface ViewController0 ()

@end

@implementation ViewController0

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
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(40, 0, 240, 170)];
    view1.backgroundColor = [UIColor lightGrayColor];
    
    // 2つ目のビューのインスタンス生成
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(300, 0, 240, 170)];
    view2.backgroundColor = [UIColor lightGrayColor];
    
    // スクロールビューにビューを追加する
    [self.scrollView addSubview:view1];
    [self.scrollView addSubview:view2];
    
    // スクロールビューのコンテンツサイズを設定する
    self.scrollView.contentSize = CGSizeMake(580, 170);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

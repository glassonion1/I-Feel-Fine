//
//  ViewController.m
//  NSUserDefaultsSample
//
//  Created by fujita taisuke on 2012/07/29.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)respondToSaveButtonClick:(id)sender
{
    /*
     Person *tYamada = [[[Person alloc] init] autorelease];
     tYamada.name = @"山田太郎";
     Address *yAddress = [[[Address alloc] init] autorelease];
     yAddress.zipCode = @"104-0061";
     yAddress.state = @"東京都";
     yAddress.city = @"中央区";
     yAddress.other = @"銀座1丁目";
     tYamada.address = yAddress;
     
     Person *hYamada = [[[Person alloc] init] autorelease];
     hYamada.name = @"山田花子";
     hYamada.address = yAddress;
     
     Person *tanaka = [[[Person alloc] init] autorelease];
     tanaka.name = @"田中次郎";
     Address *tAddress = [[[Address alloc] init] autorelease];
     tAddress.zipCode = @"145-0071";
     tAddress.state = @"東京都";
     tAddress.city = @"大田区";
     tAddress.other = @"田園調布1丁目";
     tanaka.address = tAddress;
     NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tYamada];
     NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:hYamada];
     NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:tanaka];
     NSArray *array = @[data, data2, data3];
     */
    // 初期値の設定
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = @{
    @"home" : @"http://www.google.co.jp",
    @"bookmarks": @[@"http://www.apple.com", @"http://www.9revolution9.com", @"https://twitter.com/"],
    @"font-size" : @14,
    @"javascript-enabled" : @(YES)
    };
    [defaults registerDefaults:dict];
    NSLog(@"%@", [defaults objectForKey:@"home"]);
    NSLog(@"%@", [defaults objectForKey:@"bookmarks"]);
    NSLog(@"%d", [defaults integerForKey:@"font-size"]);
    NSLog(@"%d", [defaults boolForKey:@"javascript-enabled"]);
    // データの保存
    NSArray *array = @[@"http://www.apple.com", @"http://www.9revolution9.com", @"https://twitter.com/"];
    [defaults setObject:array forKey:@"bookmarks"];
    BOOL successful = [defaults synchronize];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
    }
}

- (IBAction)respondToLoadButtonClick:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [defaults arrayForKey:@"bookmarks"];
    if (array) {
        for (NSString *data in array) {
            NSLog(@"%@", data);
        }
    } else {
        NSLog(@"%@", @"データが存在しません。");
    }
    NSLog(@"%@", [defaults objectForKey:@"home"]);
}

- (IBAction)respondToRemoveButtonClick:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"bookmarks"];
    BOOL successful = [defaults synchronize];
    if (successful) {
        NSLog(@"%@", @"データの削除に成功しました。");
    } else {
        NSLog(@"%@", @"削除するデータがありません。");
        return;
    }
    // データが削除されていることを確認する
    NSArray *array = [defaults arrayForKey:@"bookmarks"];
    NSLog(@"%d:%@", successful, array);
    if (!array) {
        NSLog(@"%@", @"データは削除されました。");
    }
}

@end

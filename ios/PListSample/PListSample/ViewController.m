//
//  ViewController.m
//  PListSample
//
//  Created by fujita taisuke on 2012/08/01.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Address.h"

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
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [paths objectAtIndex:0];
    NSString *filePath = [directory stringByAppendingPathComponent:@"data.plist"];
    
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
     BOOL successful = [array writeToFile:filePath atomically:YES];
     if (successful) {
     NSLog(@"%@", @"データの保存に成功しました。");
     }
     */
    
    NSArray *array = @[@"北海道", @"青森県", @"岩手県", @"秋田県"];
    BOOL successful = [array writeToFile:filePath atomically:NO];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
    }
}

- (IBAction)respondToLoadButtonClick:(id)sender
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [paths objectAtIndex:0];
    NSString *filePath = [directory stringByAppendingPathComponent:@"data.plist"];
    
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
    /*
     if (array) {
     for (NSData *data in array) {
     Person *person = [NSKeyedUnarchiver unarchiveObjectWithData:data];
     NSLog(@"%@", person);
     }
     } else {
     NSLog(@"%@", @"データが存在しません。");
     }
     */
    
    if (array) {
        for (NSString *data in array) {
            NSLog(@"%@", data);
        }
    } else {
        NSLog(@"%@", @"データが存在しません。");
    }
}

@end

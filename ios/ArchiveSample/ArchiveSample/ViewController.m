//
//  ViewController.m
//  ArchiveSample
//
//  Created by fujita taisuke on 2012/08/03.
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

- (IBAction)respondToSaveButtonClick:(id)sender {
    /*
    NSArray *paths = NSSearchPathForDirectoriesInDomains(
                                                         NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSLog(@"%@", paths[0]);
    */
    
    NSString *directory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [directory stringByAppendingPathComponent:@"data.dat"];
    
    Person *tYamada = [[Person alloc] init];
    tYamada.name = @"山田太郎";
    Address *yAddress = [[Address alloc] init];
    yAddress.zipCode = @"104-0061";
    yAddress.state = @"東京都";
    yAddress.city = @"中央区";
    yAddress.other = @"銀座1丁目";
    tYamada.address = yAddress;
    
    Person *hYamada = [[Person alloc] init];
    hYamada.name = @"山田花子";
    hYamada.address = yAddress;
    
    Person *tanaka = [[Person alloc] init];
    tanaka.name = @"田中次郎";
    Address *tAddress = [[Address alloc] init];
    tAddress.zipCode = @"145-0071";
    tAddress.state = @"東京都";
    tAddress.city = @"大田区";
    tAddress.other = @"田園調布1丁目";
    tanaka.address = tAddress;
    NSArray *array = @[tYamada, hYamada, tanaka];
    BOOL successful = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
    }
    /*
     NSArray *array = @[@"山田太郎", @"東京都中央区"];
     BOOL successful = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
     if (successful) {
     NSLog(@"%@", @"データの保存に成功しました。");
     }
     */
}

- (IBAction)respondToLoadButtonClick:(id)sender {
    NSString *directory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [directory stringByAppendingPathComponent:@"data.dat"];
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    if (array) {
        for (Person *person in array) {
            NSLog(@"%@", person.name);
            NSLog(@"%@", person.address.zipCode);
            NSLog(@"%@", person.address.state);
            NSLog(@"%@", person.address.city);
            NSLog(@"%@", person.address.other);
        }
    } else {
        NSLog(@"%@", @"データが存在しません。");
    }
    /*
     NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
     if (array) {
     for (NSString *data in array) {
     NSLog(@"%@", data);
     }
     } else {
     NSLog(@"%@", @"データが存在しません。");
     }
     */
}

@end

//
//  DataManagement3ViewController.m
//  DataManagement3
//
//  Created by 藤田 泰介 on 11/09/16.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "DataManagement3ViewController.h"
#import "Person.h"
#import "Address.h"

@implementation DataManagement3ViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    NSArray *array = @[data];
    */
    NSArray *array = @[@"山田太郎", @"東京都中央区"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:array forKey:@"dataofyamada"];
    BOOL successful = [defaults synchronize];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
    }
}

- (IBAction)respondToLoadButtonClick:(id)sender
{
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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [defaults arrayForKey:@"dataofyamada"];
    if (array) {
        for (NSString *data in array) {
            NSLog(@"%@", data);
        }
    } else {
        NSLog(@"%@", @"データが存在しません。");
    }
}

- (IBAction)respondToRemoveButtonClick:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"dataofyamada"];
    NSArray *array = [defaults arrayForKey:@"dataofyamada"];
    if (!array) {
        NSLog(@"%@", @"データが存在しません。");
    }
}

@end

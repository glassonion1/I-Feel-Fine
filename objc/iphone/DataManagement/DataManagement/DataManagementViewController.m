//
//  DataManagementViewController.m
//  DataManagement
//
//  Created by Taisuke Fujita on 11/08/29.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "DataManagementViewController.h"
#import "Person.h"
#import "Address.h"


@implementation DataManagementViewController

- (void)dealloc
{
    [super dealloc];
}

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

- (IBAction)respondToSaveButtonClick:(id)sender {
    NSString *directory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [NSString stringWithFormat:@"%@/data.dat", directory];
    
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
    NSArray *array = [NSArray arrayWithObjects:tYamada, hYamada, tanaka, nil];
    BOOL successful = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
    }
    /*
    NSArray *array = [NSArray arrayWithObjects:@"山田太郎", @"東京都中央区", nil];
    BOOL successful = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
    if (successful) {
        NSLog(@"%@", @"データの保存に成功しました。");
    }
     */
}

- (IBAction)respondToLoadButtonClick:(id)sender {
    NSString *directory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [NSString stringWithFormat:@"%@/data.dat", directory];
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

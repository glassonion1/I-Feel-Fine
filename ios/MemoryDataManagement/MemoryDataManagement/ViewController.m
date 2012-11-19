//
//  ViewController.m
//  MemoryDataManagement
//
//  Created by fujita taisuke on 2012/11/03.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    NSString *item1 = [app.sharedData objectForKey:@"item1"];
    NSLog(@"%@", item1);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    return YES;
}

- (IBAction)respondToCopyButtonClick:(id)sender
{
    UIPasteboard *p = [UIPasteboard generalPasteboard];
    p.string = self.textField.text;
}

- (IBAction)respondToPasteButtonClick:(id)sender
{
    UIPasteboard *p = [UIPasteboard generalPasteboard];
    self.textField.text = p.string;
}

@end

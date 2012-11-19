//
//  ModalViewController.m
//  TouchSample
//
//  Created by taisuke fujita on 12/03/30.
//  Copyright (c) 2012年 Colopl, Inc. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)awakeFromNib
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (UIStoryboard *)storyboard
{
    //NSLog(@"%@", [NSThread callStackSymbols]);
    return [super storyboard];
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super didReceiveMemoryWarning];
    if ([self.view window] == nil) {
        NSLog(@"%@ View did unload", NSStringFromClass([self class]));
        self.view = nil;
    }
}

- (void)loadView
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super loadView];
}

- (void)viewDidLoad
{
    NSLog(@"%@", self.storyboard);
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super viewDidLoad];
    //NSLog(@"%@", [NSThread callStackSymbols]);
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super viewWillAppear:animated];
}

- (void)viewWillLayoutSubviews
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super viewDidLayoutSubviews];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonClick:(id)sender
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    //NSLog(@"%@", [NSThread callStackSymbols]);
    [self dismissModalViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super prepareForSegue:segue sender:sender];
}

@end

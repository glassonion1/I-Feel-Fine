//
//  ViewController.m
//  LifecycleEventSample
//
//  Created by taisuke fujita on 12/04/02.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)awakeFromNib
{
    NSLog(@"nibName:%@", self.nibName);
    NSLog(@"storyboard:%@", self.storyboard);
}

/*
- (UIStoryboard *)storyboard
{
    //NSLog(@"%@", [NSThread callStackSymbols]);
    return [super storyboard];
}
*/

- (void)didReceiveMemoryWarning
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super didReceiveMemoryWarning];
}

- (void)loadView
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super loadView];
    NSLog(@"%@", [NSThread callStackSymbols]);
    NSLog(@"%@", self.view.superview);
}

- (void)viewDidLoad
{
    NSLog(@"%@", self.storyboard);
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super viewDidLoad];
    //NSLog(@"%@", [NSThread callStackSymbols]);
}

- (void)viewWillUnload
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super viewWillUnload];
}

- (void)viewDidUnload
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super viewWillAppear:animated];
    NSLog(@"%@", [NSThread callStackSymbols]);
    NSLog(@"aaaaa0%@", self.view.superview);
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super viewDidAppear:animated];
    NSLog(@"aaaaa1%@", self.view.superview);
    NSLog(@"%@", [NSThread callStackSymbols]);
    NSLog(@"aaaaa2%@", self.view.superview);
    NSLog(@"%@", [(UIWindow *)self.view.superview rootViewController]);
}

- (void)viewWillLayoutSubviews
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    //NSLog(@"%@", [NSThread callStackSymbols]);
}

- (void)viewDidLayoutSubviews
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    //NSLog(@"%@", [NSThread callStackSymbols]);
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
	[super viewWillDisappear:animated];
    //NSLog(@"%@", [NSThread callStackSymbols]);
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
	[super viewDidDisappear:animated];
    NSLog(@"ccccc%@", self.view.superview);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [super prepareForSegue:segue sender:sender];
    NSLog(@"%@", [NSThread callStackSymbols]);
}


@end

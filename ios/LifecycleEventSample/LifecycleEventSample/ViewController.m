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
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    //NSLog(@"nibName:%@", self.nibName);
    //NSLog(@"storyboard:%@", self.storyboard);
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
    if ([self.view window] == nil) {
        NSLog(@"%@ View did unload", NSStringFromClass([self class]));
        // Add code to preserve data stored in the views that might be
        // needed later.
        
        // Add code to clean up other strong references to the view in
        // the view hierarchy.
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
    //NSLog(@"%@", [NSThread callStackSymbols]);
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
	[super viewDidDisappear:animated];
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

- (void) encodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void) decodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
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

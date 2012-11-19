//
//  ViewController.m
//  NSOperationSample2
//
//  Created by fujita taisuke on 12/07/26.
//  Copyright (c) 2012年 fujita taisuke. All rights reserved.
//

#import "ViewController.h"

#import "HttpOperation.h"
#import "HttpAsyncOperation.h"

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

- (IBAction)respondToButtonClick:(id)button {
    /*{
     NSOperationQueue *queue = [[NSOperationQueue alloc] init];
     [queue addOperationWithBlock:^{
     NSLog(@"isMainThread:%d", [NSThread isMainThread]);
     NSLog(@"Thread:%@", [NSThread currentThread]);
     }];
     [queue addOperationWithBlock:^{
     NSLog(@"isMainThread:%d", [NSThread isMainThread]);
     NSLog(@"Thread:%@", [NSThread currentThread]);
     }];
     [queue addOperationWithBlock:^{
     NSLog(@"isMainThread:%d", [NSThread isMainThread]);
     NSLog(@"Thread:%@", [NSThread currentThread]);
     }];
     }*/
    {
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        //NSOperationQueue *queue = [NSOperationQueue mainQueue];
        HttpAsyncOperation *ope1 = [[HttpAsyncOperation alloc] initWithURL:[NSURL URLWithString:@"http://www.apple.com"]];
        [ope1 addObserver:self forKeyPath:@"isFinished"
                  options:NSKeyValueObservingOptionNew context:nil];
        HttpAsyncOperation *ope2 = [[HttpAsyncOperation alloc] initWithURL:[NSURL URLWithString:@"http://www.9revolution9.com"]];
        [ope2 addObserver:self forKeyPath:@"isFinished"
                  options:NSKeyValueObservingOptionNew context:nil];
        [queue addOperation:ope1];
        [queue addOperation:ope2];
    }
    /*{
     NSOperationQueue *queue = [NSOperationQueue mainQueue];
     queue.name = @"Test Queue!";
     OperationNormal *ope1 = [[[OperationNormal alloc] init] autorelease];
     OperationNormal *ope2 = [[[OperationNormal alloc] init] autorelease];
     OperationNormal *ope3 = [[[OperationNormal alloc] init] autorelease];
     [queue addOperation:ope1];
     [queue addOperation:ope2];
     [queue addOperation:ope3];
     }*/
    /*
    UIProgressView *progress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    progress.center = CGPointMake(150, 100);
    progress.progress = 0.45f;
    [self.view addSubview:progress];
    
    UIActivityIndicatorView *ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    ai.frame = CGRectMake(0, 0, 50, 50);
    ai.center = CGPointMake(160, 50);
    [self.view addSubview:ai];
    [ai startAnimating];*/
}

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object
                        change:(NSDictionary*)change context:(void*)context {
    NSLog(@"%@", [object responseString]);
    // キー値監視を解除する
    [object removeObserver:self forKeyPath:keyPath];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end

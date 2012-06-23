//
//  NSOperationSampleViewController.m
//  NSOperationSample
//
//  Created by Taisuke Fujita on 11/05/26.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "NSOperationSampleViewController.h"
#import "HttpOperation.h"
#import "HttpAsyncOperation.h"

@implementation NSOperationSampleViewController

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
        NSOperationQueue *queue = [[[NSOperationQueue alloc] init] autorelease];
        //NSOperationQueue *queue = [NSOperationQueue mainQueue];
        HttpAsyncOperation *ope1 = [[HttpAsyncOperation alloc] initWithURL:[NSURL URLWithString:@"http://www.flickr.com"]];
        [ope1 addObserver:self forKeyPath:@"isFinished" 
                  options:NSKeyValueObservingOptionNew context:nil];
        HttpAsyncOperation *ope2 = [[HttpAsyncOperation alloc] initWithURL:[NSURL URLWithString:@"http://www.yahoo.com"]];
        [ope2 addObserver:self forKeyPath:@"isFinished" 
                  options:NSKeyValueObservingOptionNew context:nil];
        [queue addOperation:ope1];
        [queue addOperation:ope2];
        [ope1 release];
        [ope2 release];
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
}

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object 
                        change:(NSDictionary*)change context:(void*)context {
    NSLog(@"%@", @"Operation end");
    // キー値監視を解除する
    [object removeObserver:self forKeyPath:keyPath];
}

@end

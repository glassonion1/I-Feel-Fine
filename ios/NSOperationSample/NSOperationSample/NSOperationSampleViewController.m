//
//  NSOperationSampleViewController.m
//  NSOperationSample
//
//  Created by Taisuke Fujita on 11/05/26.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "NSOperationSampleViewController.h"
#import "OperationNormal.h"

@implementation NSOperationSampleViewController


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
    {
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
    }
    /*{
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        OperationNormal *ope1 = [[[OperationNormal alloc] init] autorelease];
        OperationNormal *ope2 = [[[OperationNormal alloc] init] autorelease];
        OperationNormal *ope3 = [[[OperationNormal alloc] init] autorelease];
        [queue addOperation:ope1];
        [queue addOperation:ope2];
        [queue addOperation:ope3];
        
    }*/
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

@end

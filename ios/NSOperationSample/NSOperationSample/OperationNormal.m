//
//  OperationNormal.m
//  NSOperationSample
//
//  Created by Taisuke Fujita on 11/05/26.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "OperationNormal.h"
#import "NestedOperation.h"
#import "Sample.h"

@implementation OperationNormal

- (void)main {
    //NSLog(@"isMainThread:%d", [NSThread isMainThread]);
    NSLog(@"Thread:%@", [NSThread currentThread]);
    Sample *s = [[Sample alloc] init];
    [s doSomething];
    /*
    NSOperationQueue *queue = [NSOperationQueue currentQueue];
    NSLog(@"Queue Name:%@", queue.name);
    NestedOperation *ope = [[NestedOperation alloc] init];
    [queue addOperation:ope];*/
}

@end

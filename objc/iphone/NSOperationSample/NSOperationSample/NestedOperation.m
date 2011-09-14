//
//  NestedOperation.m
//  NSOperationSample
//
//  Created by Taisuke Fujita on 11/05/26.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "NestedOperation.h"


@implementation NestedOperation

- (BOOL)isConcurrent {
    return NO;
}

- (void)main {
    NSLog(@"%@", @"NestedOperation!!!");
    NSLog(@"isMainThread:%d", [NSThread isMainThread]);
    NSLog(@"Thread:%@", [NSThread currentThread]);
}

@end

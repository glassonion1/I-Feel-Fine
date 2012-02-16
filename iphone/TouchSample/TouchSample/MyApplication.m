//
//  MyApplication.m
//  TouchSample
//
//  Created by Fujita Taiuke on 12/02/16.
//  Copyright (c) 2012年 Revolution 9 All rights reserved.
//

#import "MyApplication.h"

@implementation MyApplication

- (void)sendEvent:(UIEvent *)event
{
    [super sendEvent:event];
    NSLog(@"%@", @"UIApplication#sendEvent:");
}

@end

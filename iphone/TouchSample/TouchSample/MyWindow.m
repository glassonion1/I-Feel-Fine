//
//  MyWindow.m
//  TouchSample
//
//  Created by Fujita Taiuke on 12/02/16.
//  Copyright (c) 2012年 Revolution 9 All rights reserved.
//

#import "MyWindow.h"

@implementation MyWindow

- (void)sendEvent:(UIEvent *)event
{
    NSLog(@"%@", @"UIWindow#sendEvent: start");
    [super sendEvent:event];
    NSLog(@"%@", @"UIWindow#sendEvent: end");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%@", @"UIWindow#hitTest:withEvent:");
    UIView *view = [super hitTest:point withEvent:event];
    NSLog(@"tag %d", [view tag]);
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%@", @"UIWindow#pointInside:withEvent:");
    return [super pointInside:point withEvent:event];
}

@end

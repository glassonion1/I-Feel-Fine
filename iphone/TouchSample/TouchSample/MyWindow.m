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
    [super sendEvent:event];
    NSLog(@"%@", @"UIWindow#sendEvent:");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%@", @"UIWindow#hitTest: withEvent:");
    UIView *view = [super hitTest:point withEvent:event];
    NSLog(@"tag %d", [view tag]);
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%@", @"UIWindow#pointInside: withEvent:");
    return [super pointInside:point withEvent:event];
}

@end

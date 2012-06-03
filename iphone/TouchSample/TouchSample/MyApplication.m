//
//  MyApplication.m
//  TouchSample
//
//  Created by Fujita Taiuke on 12/02/16.
//  Copyright (c) 2012年 Revolution 9 All rights reserved.
//

#import "MyApplication.h"

@implementation MyApplication

- (id)init
{
    return [super init];
}

- (void)sendEvent:(UIEvent *)event
{
    NSLog(@"%@", @"UIApplication#sendEvent: start");
    [super sendEvent:event];
    NSLog(@"%@", @"UIApplication#sendEvent: end");
}

- (BOOL)sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event
{
    NSLog(@"%@", @"UIApplication#sendAction: start");
    BOOL result = [super sendAction:action to:target from:sender forEvent:event];
    NSLog(@"%@", @"UIApplication#sendAction: end");
    return  result;
}

- (UIResponder*)nextResponder
{
    //NSLog(@"%@", [NSThread callStackSymbols]);
    UIResponder *responder = [super nextResponder];
    NSLog(@"Responder %@", NSStringFromClass([responder class]));
    return responder;
}

@end

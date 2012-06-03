//
//  CustomSegue.m
//  LifecycleEventSample
//
//  Created by taisuke fujita on 12/05/11.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue

- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    //NSLog(@"%@", [NSThread callStackSymbols]);
    return [super initWithIdentifier:identifier source:source destination:destination];
}

- (void)perform
{
    NSLog(@"%@", [NSThread callStackSymbols]);
    [self.sourceViewController presentViewController:self.destinationViewController animated:YES completion:nil];
}

@end

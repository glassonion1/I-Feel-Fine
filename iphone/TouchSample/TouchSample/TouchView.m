//
//  TouchView.m
//  TouchSample
//
//  Created by Fujita Taiuke on 12/02/16.
//  Copyright (c) 2012年 Revolution 9 All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

@synthesize name = _name;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"Name %@, %@", self. name, @"UIView#hitTest: withEvent:");
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"Name %@, %@", self. name, @"UIView#pointInside: withEvent:");
    return [super pointInside:point withEvent:event];
}

@end

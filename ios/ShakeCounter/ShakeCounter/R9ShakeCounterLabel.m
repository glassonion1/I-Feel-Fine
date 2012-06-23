//
//  R9ShakeCounterLabel.m
//  ShakeCounter
//
//  Created by taisuke fujita on 12/05/17.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "R9ShakeCounterLabel.h"

@implementation R9ShakeCounterLabel {
    NSInteger _count;
}

- (void)setup
{
    [self becomeFirstResponder];
    _count = 0;
    self.text = [NSString stringWithFormat:@"%d", _count];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    _count++;
    self.text = [NSString stringWithFormat:@"%d", _count];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
}

@end

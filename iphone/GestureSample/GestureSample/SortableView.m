//
//  SortableView.m
//  GestureSample
//
//  Created by Taisuke Fujita on 11/08/30.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "SortableView.h"


@implementation SortableView

@synthesize imageView, deleteButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
        UIView *view = [array objectAtIndex:0];
        [self addSubview:view];
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

- (void)dealloc
{
    self.imageView = nil;
    self.deleteButton = nil;
    [super dealloc];
}

- (void)startAnimation 
{
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat|UIViewAnimationOptionAllowUserInteraction animations:^{
        self.transform = CGAffineTransformMakeRotation(M_PI * -5 / 180.0f);
        self.transform = CGAffineTransformMakeRotation(M_PI * 10 / 180.0f);
    } completion:nil];
}

- (void)stopAnimation
{
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.transform = CGAffineTransformMakeRotation(M_PI * 0 / 180.0f);
    } completion:nil];
}

@end

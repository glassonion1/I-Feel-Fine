//
//  Hedgehog.m
//  hhdrive
//
//  Created by fujita taisuke on 2013/09/20.
//  Copyright (c) 2013年 Revolution 9. All rights reserved.
//

#import "Hedgehog.h"

@implementation Hedgehog

- (instancetype)init
{
    if (self = [super initWithImageNamed:@"hedgehog"]) {
        self.speed = 20;
        self.anchorPoint = CGPointMake(0.5, 0.5);
    }
    return self;
}

- (BOOL)intersectsNode:(SKNode *)node
{
    CGFloat dx = CGRectGetMidX(node.frame) - CGRectGetMidX(self.frame);
    CGFloat dy = CGRectGetMidY(node.frame) - CGRectGetMidY(self.frame);
    CGFloat distance = sqrtf(dx*dx + dy*dy);
    return distance <= 25;
}

- (void)moveTo:(CGPoint)location
{
    CGFloat dx = location.x - self.position.x;
    CGFloat dy = location.y - self.position.y;
    // rotate
    CGFloat angle = atan2(dx, dy);
    SKAction *rotate = [SKAction rotateToAngle:-angle duration:1 shortestUnitArc:YES];
    // move
    CGFloat distance = sqrtf(dx*dx + dy*dy);
    CGFloat duration = distance / self.speed;
    SKAction *move = [SKAction moveTo:location duration:duration];
    // sequence
    SKAction *seq = [SKAction sequence:@[rotate, move]];
    [self runAction:seq];
}

@end

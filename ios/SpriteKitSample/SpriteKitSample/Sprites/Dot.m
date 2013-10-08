//
//  Dot.m
//  hhdrive
//
//  Created by fujita taisuke on 2013/09/19.
//  Copyright (c) 2013年 Revolution 9. All rights reserved.
//

#import "Dot.h"

@implementation Dot

- (instancetype)init
{
    if (self = [super initWithImageNamed:@"circle"]) {
        self.color = [SKColor redColor];
        self.colorBlendFactor = 1;
    }
    return self;
}

#pragma private methods

- (void)erase
{
    if (!self.hidden) {
        SKAction *scale = [SKAction scaleTo:2.5 duration:0.6];
        SKAction *alpha = [SKAction fadeAlphaTo:0 duration:0.6];
        SKAction *group = [SKAction group:@[scale, alpha]];
        [self runAction:group completion:^{
            self.hidden = YES;
        }];
    }
}

@end

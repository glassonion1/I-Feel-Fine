//
//  ESViewController.h
//  EmitterSample
//
//  Created by 藤田 泰介 on 12/01/07.
//  Copyright (c) 2012 Commonsense. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ESViewController : UIViewController {
    CAEmitterLayer *emitterLayer;
    NSMutableDictionary *emitterLayers;
}

@end

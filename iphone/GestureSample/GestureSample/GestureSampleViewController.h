//
//  GestureSampleViewController.h
//  GestureSample
//
//  Created by Taisuke Fujita on 11/08/30.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestureSampleViewController : UIViewController <UIGestureRecognizerDelegate> {
    UIScrollView *scrollView;
    BOOL longPressed;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@end

//
//  TimerSampleAppDelegate.h
//  TimerSample
//
//  Created by 藤田 泰介 on 10/07/05.
//  Copyright Commonsense 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TimerSampleViewController;

@interface TimerSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TimerSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TimerSampleViewController *viewController;

@end


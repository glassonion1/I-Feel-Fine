//
//  GestureSampleAppDelegate.h
//  GestureSample
//
//  Created by Taisuke Fujita on 11/08/30.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GestureSampleViewController;

@interface GestureSampleAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet GestureSampleViewController *viewController;

@end

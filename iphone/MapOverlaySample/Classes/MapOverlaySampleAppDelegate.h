//
//  MapOrverlaySampleAppDelegate.h
//  MapOrverlaySample
//
//  Created by 藤田 泰介 on 10/06/23.
//  Copyright Commonsense 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MapOverlaySampleViewController;

@interface MapOverlaySampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MapOverlaySampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MapOverlaySampleViewController *viewController;

@end


//
//  NSOperationSampleAppDelegate.h
//  NSOperationSample
//
//  Created by Taisuke Fujita on 11/05/26.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NSOperationSampleViewController;

@interface NSOperationSampleAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet NSOperationSampleViewController *viewController;

@end

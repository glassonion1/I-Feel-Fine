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

@property (nonatomic, strong) IBOutlet UIWindow *window;

@property (nonatomic, strong) IBOutlet NSOperationSampleViewController *viewController;

@end

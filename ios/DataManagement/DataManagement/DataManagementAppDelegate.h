//
//  DataManagementAppDelegate.h
//  DataManagement
//
//  Created by Taisuke Fujita on 11/08/29.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataManagementViewController;

@interface DataManagementAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, strong) IBOutlet UIWindow *window;

@property (nonatomic, strong) IBOutlet DataManagementViewController *viewController;

@end

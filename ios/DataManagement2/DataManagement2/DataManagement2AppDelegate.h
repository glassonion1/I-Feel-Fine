//
//  DataManagement2AppDelegate.h
//  DataManagement2
//
//  Created by 藤田 泰介 on 11/09/07.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataManagement2ViewController;

@interface DataManagement2AppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, strong) IBOutlet UIWindow *window;

@property (nonatomic, strong) IBOutlet DataManagement2ViewController *viewController;

@end

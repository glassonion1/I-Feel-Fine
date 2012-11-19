//
//  AppDelegate.h
//  MemoryDataManagement
//
//  Created by fujita taisuke on 2012/11/03.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSMutableDictionary *sharedData;

@end

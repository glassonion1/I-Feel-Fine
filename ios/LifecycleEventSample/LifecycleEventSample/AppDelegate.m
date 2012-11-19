//
//  AppDelegate.m
//  LifecycleEventSample
//
//  Created by taisuke fujita on 12/04/02.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    //NSLog(@"%@", [NSThread callStackSymbols]);
    NSLog(@"rootViewController:%@", [[[UIApplication sharedApplication].windows objectAtIndex:0] rootViewController]);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}


- (UIViewController *) application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    return nil;
}

- (BOOL) application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    return YES;
}

- (BOOL) application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    return YES;
}

- (void) application:(UIApplication *)application willEncodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void) application:(UIApplication *)application didDecodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"%@#%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

@end

//
//  ModelController.h
//  iCloudKeyValueDataSample
//
//  Created by fujita taisuke on 12/07/28.
//  Copyright (c) 2012 Revolution 9. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end

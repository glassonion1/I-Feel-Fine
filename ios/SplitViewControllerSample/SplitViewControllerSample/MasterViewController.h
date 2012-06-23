//
//  MasterViewController.h
//  SplitViewControllerSample
//
//  Created by taisuke fujita on 12/06/05.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end

//
//  MainViewController.h
//  PopoverSample
//
//  Created by taisuke fujita on 12/06/05.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end

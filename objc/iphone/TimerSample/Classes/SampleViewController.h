//
//  SampleViewController.h
//  TimerSample
//
//  Created by 藤田 泰介 on 10/07/06.
//  Copyright 2010 Commonsense. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SampleViewController : UIViewController {
	NSTimer *timer_;
	UILabel *label_;
	int count;
}

@property (nonatomic, retain) IBOutlet UILabel *label;

- (IBAction)respondToButtonClick:(id)sender;

@end

//
//  TimerSampleViewController.h
//  TimerSample
//
//  Created by 藤田 泰介 on 10/07/05.
//  Copyright Commonsense 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerSampleViewController : UIViewController {
	UIButton *button_;
	UILabel *label_;
}

@property (nonatomic, retain)IBOutlet UIButton *button;

- (IBAction)respondToButtonClick:(id)sender;

@end


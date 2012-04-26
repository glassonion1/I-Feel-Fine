//
//  ViewController.h
//  ControllerSample
//
//  Created by taisuke fujita on 12/04/17.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *textView;

- (IBAction)save:(id)sender;

@end

//
//  ViewController.h
//  MemoryDataManagement
//
//  Created by fujita taisuke on 2012/11/03.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)respondToCopyButtonClick:(id)sender;

- (IBAction)respondToPasteButtonClick:(id)sender;

@end

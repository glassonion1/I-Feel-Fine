//
//  DataViewController.h
//  DailyCalendar
//
//  Created by taisuke fujita on 12/04/18.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@end

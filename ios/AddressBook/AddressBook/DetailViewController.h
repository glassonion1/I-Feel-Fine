//
//  DetailViewController.h
//  AddressBook
//
//  Created by 藤田 泰介 on 11/11/12.
//  Copyright (c) 2011 Commonsense. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Person *detailItem;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *zipCodeField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *otherField;

@end

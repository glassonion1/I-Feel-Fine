//
//  DetailEditViewController.h
//  AddressBook
//
//  Created by 藤田 泰介 on 11/11/14.
//  Copyright (c) 2011 Commonsense. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface DetailEditViewController : UITableViewController {
    UITextField *nameField;
    UITextField *zipCodeField;
    UITextField *stateField;
    UITextField *cityField;
    UITextField *otherField;
}

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Person *person;

@end

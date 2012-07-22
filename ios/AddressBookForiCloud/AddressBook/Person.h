//
//  Person.h
//  AddressBook
//
//  Created by 藤田 泰介 on 12/07/22.
//  Copyright (c) 2012 Revolution 9. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Address.h"

@interface Person : NSManagedObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) Address *address;

@end

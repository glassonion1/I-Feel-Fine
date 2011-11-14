//
//  Address.h
//  AddressBook
//
//  Created by 藤田 泰介 on 11/11/12.
//  Copyright (c) 2011 Commonsense. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Address : NSManagedObject

@property (strong, nonatomic) NSString *zipCode;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *other;

@end

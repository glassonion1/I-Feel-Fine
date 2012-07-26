//
//  Person.h
//  DataManagement
//
//  Created by 藤田 泰介 on 11/09/02.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"


@interface Person : NSObject <NSCoding> {
  @private
    NSString *name;
    Address *address;
}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Address *address;

@end

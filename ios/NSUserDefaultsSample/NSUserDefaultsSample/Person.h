//
//  Person.h
//  NSUserDefaultsSample
//
//  Created by 藤田 泰介 on 11/09/02.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
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

//
//  Address.h
//  DataManagement
//
//  Created by 藤田 泰介 on 11/09/02.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Address : NSObject <NSCoding> {
    NSString *zipCode;
    NSString *state;
    NSString *city;
    NSString *other;
}

@property (nonatomic, retain) NSString *zipCode;
@property (nonatomic, retain) NSString *state;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *other;

@end

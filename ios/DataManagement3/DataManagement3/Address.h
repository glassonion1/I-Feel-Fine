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

@property (nonatomic, strong) NSString *zipCode;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *other;

@end

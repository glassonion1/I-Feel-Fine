//
//  Address.m
//  NSUserDefaultsSample
//
//  Created by 藤田 泰介 on 11/09/02.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "Address.h"


@implementation Address

@synthesize zipCode, state, city, other;

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        zipCode = [decoder decodeObjectForKey:@"zipCode"];
        state = [decoder decodeObjectForKey:@"state"];
        city = [decoder decodeObjectForKey:@"city"];
        other = [decoder decodeObjectForKey:@"other"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:zipCode forKey:@"zipCode"];
    [encoder encodeObject:state forKey:@"state"];
    [encoder encodeObject:city forKey:@"city"];
    [encoder encodeObject:other forKey:@"other"];
}


-(NSString*)description{
    return [NSString stringWithFormat:@"<%@ :%p , zipCode:%@, state:%@, city:%@, other:%@>", 
            NSStringFromClass([self class]), self, zipCode, state, city, other];
}

@end

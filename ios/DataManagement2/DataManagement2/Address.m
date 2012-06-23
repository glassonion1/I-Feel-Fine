//
//  Address.m
//  DataManagement
//
//  Created by 藤田 泰介 on 11/09/02.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "Address.h"


@implementation Address

@synthesize zipCode, state, city, other;

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        zipCode = [[decoder decodeObjectForKey:@"zipCode"] retain];
        state = [[decoder decodeObjectForKey:@"state"] retain];
        city = [[decoder decodeObjectForKey:@"city"] retain];
        other = [[decoder decodeObjectForKey:@"other"] retain];
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

- (void)dealloc
{
    self.zipCode = nil;
    self.state = nil;
    self.city = nil;
    self.other = nil;
    [super dealloc];
}

-(NSString*)description{
    return [NSString stringWithFormat:@"<%@ :%p , zipCode:%@, state:%@, city:%@, other:%@>", 
            NSStringFromClass([self class]), self, zipCode, state, city, other];
}

@end

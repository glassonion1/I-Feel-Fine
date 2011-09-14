//
//  Person.m
//  DataManagement
//
//  Created by 藤田 泰介 on 11/09/02.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize name, address;

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        name = [[decoder decodeObjectForKey:@"name"] retain];
        address = [[decoder decodeObjectForKey:@"address"] retain];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:name forKey:@"name"];
    [encoder encodeObject:address forKey:@"address"];
}

- (void)dealloc
{
    self.name = nil;
    self.address = nil;
    [super dealloc];
}

-(NSString*)description{
    return [NSString stringWithFormat:@"<%@ :%p , name:%@, address:%@>", 
            NSStringFromClass([self class]), self, name, address];
}

@end

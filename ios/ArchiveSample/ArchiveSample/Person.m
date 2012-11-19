//
//  Person.m
//  ArchiveSample
//
//  Created by 藤田 泰介 on 11/09/02.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "Person.h"


@implementation Person

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        _name = [decoder decodeObjectForKey:@"name"];
        _address = [decoder decodeObjectForKey:@"address"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_name forKey:@"name"];
    [encoder encodeObject:_address forKey:@"address"];
}

- (void)dealloc
{
    self.name = nil;
    self.address = nil;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"<%@ :%p , name:%@, address:%@>", 
            NSStringFromClass([self class]), self, _name, _address];
}

@end

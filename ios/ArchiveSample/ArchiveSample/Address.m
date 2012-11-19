//
//  Address.m
//  ArchiveSample
//
//  Created by 藤田 泰介 on 11/09/02.
//  Copyright (c) 2012年 Revolution 9. All rights reserved.
//

#import "Address.h"


@implementation Address

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        _zipCode = [decoder decodeObjectForKey:@"zipCode"];
        _state = [decoder decodeObjectForKey:@"state"];
        _city = [decoder decodeObjectForKey:@"city"];
        _other = [decoder decodeObjectForKey:@"other"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_zipCode forKey:@"zipCode"];
    [encoder encodeObject:_state forKey:@"state"];
    [encoder encodeObject:_city forKey:@"city"];
    [encoder encodeObject:_other forKey:@"other"];
}


-(NSString*)description{
    return [NSString stringWithFormat:@"<%@ :%p , zipCode:%@, state:%@, city:%@, other:%@>", 
            NSStringFromClass([self class]), self, _zipCode, _state, _city, _other];
}

- (void)dealloc
{
    self.zipCode = nil;
    self.state = nil;
    self.city = nil;
    self.other = nil;
}
@end

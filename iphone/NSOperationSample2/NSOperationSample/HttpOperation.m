//
//  HttpOperation.m
//  NSOperationSample
//
//  Created by Taisuke Fujita on 11/07/04.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "HttpOperation.h"


@implementation HttpOperation

- (id)initWithURL:(NSURL *)targetUrl {
    self = [super init];
    if (self) {
        url = [targetUrl retain];
    }
    
    return self;
}

- (void)dealloc {
    [url release], url = nil;
    [super dealloc];
}

- (void)main {
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request 
                          returningResponse:&response 
                                      error:&error];
    if (error == nil) {
        NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", responseString);
        [responseString release];
    }
}

@end

//
//  HttpConcurrentOperation.m
//  NSOperationSample
//
//  Created by Taisuke Fujita on 11/07/05.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "HttpAsyncOperation.h"


@implementation HttpAsyncOperation

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString*)key {
	if ([key isEqualToString:@"isExecuting"] || 
        [key isEqualToString:@"isFinished"]) {
		return YES;
	}
	return [super automaticallyNotifiesObserversForKey:key];
}

- (BOOL)isConcurrent {
    return YES;
}

- (BOOL)isExecuting {
    return isExecuting;
}

- (BOOL)isFinished {
    return isFinished;
}

- (id)initWithURL:(NSURL *)targetUrl {
    self = [super init];
    if (self) {
        url = [targetUrl retain];
    }
    isExecuting = NO;
	isFinished = NO;
    return self;
}

- (void)dealloc {
    [url release], url = nil;
    [super dealloc];
}

- (void)start {
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isExecuting"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    if (conn != nil) {
        // NSURLConnection は RunLoop をまわさないと並列実行モードで動かない
        do {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        } while (isExecuting);
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@", @"エラー");
    [self setValue:[NSNumber numberWithBool:NO] forKey:@"isExecuting"];
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isFinished"];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", responseString);
    [responseData release];
    [responseString release];
    [self setValue:[NSNumber numberWithBool:NO] forKey:@"isExecuting"];
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"isFinished"];
}

@end

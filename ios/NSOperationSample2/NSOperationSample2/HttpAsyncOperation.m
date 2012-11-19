//
//  HttpConcurrentOperation.m
//  NSOperationSample
//
//  Created by Taisuke Fujita on 11/07/05.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import "HttpAsyncOperation.h"


@implementation HttpAsyncOperation {
 @private
    NSURL *url;
    NSMutableData *responseData;
    BOOL _isExecuting, _isFinished;
}

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
    return _isExecuting;
}

- (BOOL)isFinished {
    return _isFinished;
}

- (id)initWithURL:(NSURL *)targetUrl {
    self = [super init];
    if (self) {
        url = targetUrl;
    }
    return self;
}

- (void)dealloc {
    url = nil;
}

- (void)start {
    [self setValue:@(YES) forKey:@"isExecuting"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    if (conn != nil) {
        // NSURLConnection は RunLoop をまわさないと並列実行モードで動かない
        do {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
        } while (_isExecuting);
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    self.responseString = [error description];
    [self setValue:@(NO) forKey:@"isExecuting"];
    [self setValue:@(YES) forKey:@"isFinished"];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (responseData) {
        self.responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    }
    [self setValue:@(NO) forKey:@"isExecuting"];
    [self setValue:@(YES) forKey:@"isFinished"];
}

@end

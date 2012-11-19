//
//  HttpAsyncOperation.h
//  NSOperationSample
//
//  Created by Taisuke Fujita on 11/07/05.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HttpAsyncOperation : NSOperation <NSURLConnectionDataDelegate>

@property (nonatomic ,strong)NSString *responseString;

- (id)initWithURL:(NSURL *)targetUrl;

@end

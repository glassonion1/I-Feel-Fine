//
//  HttpOperation.h
//  NSOperationSample
//
//  Created by Taisuke Fujita on 11/07/04.
//  Copyright 2011 Commonsense. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HttpOperation : NSOperation

- (id)initWithURL:(NSURL *)targetUrl;

@end

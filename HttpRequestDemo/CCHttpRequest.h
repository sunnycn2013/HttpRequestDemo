//
//  CCHttpRequest.h
//  HttpRequestDemo
//
//  Created by Qeebu on 13-12-4.
//  Copyright (c) 2013年 Qeebu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FinishLoadBlock)(NSData* data);
typedef void(^progressViewBarBlock)(double value);

@interface CCHttpRequest : NSMutableURLRequest<NSURLConnectionDataDelegate>{
    NSMutableData* data;
    long long dataLength;
}

@property (nonatomic,weak)NSURLConnection* connection;
@property (nonatomic,copy) FinishLoadBlock block;
@property (nonatomic,copy) progressViewBarBlock progressBlock;

- (void)startAsynrc;
- (void)cancel;

@end



@protocol CCHttpRequestDelegate <NSObject>

- (void)setProgressBar:(double)tem;

@end
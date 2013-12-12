//
//  CCHttpRequest.m
//  HttpRequestDemo
//
//  Created by Qeebu on 13-12-4.
//  Copyright (c) 2013年 Qeebu. All rights reserved.
//

#import "CCHttpRequest.h"

@implementation CCHttpRequest
@synthesize connection;

- (void)startAsynrc{
    data = [[NSMutableData alloc] init];
    self.connection = [NSURLConnection connectionWithRequest:self delegate:self];
    
}

- (void)cancel{
    [self.connection cancel];
}

#pragma arguments
#pragma arguments NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    //double a = (double)response.expectedContentLength;
    NSLog(@"%@",response);
    NSLog(@"%lld",response.expectedContentLength);
    dataLength = response.expectedContentLength;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)tdata{
    
    [data appendData:tdata];
    double a = data.length/(double)dataLength;
    self.progressBlock(a);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    self.block(data);
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* str = [paths objectAtIndex:0];
    NSString* file = [NSString stringWithFormat:@"%@/aa.mp4",str];
    [data writeToFile:file atomically:YES];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"net work error, failed..");
}

@end

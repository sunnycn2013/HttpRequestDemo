//
//  CCDataServer.m
//  HttpRequestDemo
//
//  Created by Qeebu on 13-12-4.
//  Copyright (c) 2013年 Qeebu. All rights reserved.
//

#import "CCDataServer.h"
#import "CCHttpRequest.h"

@implementation CCDataServer

- (void)getWeatherData:(NSDictionary*)params block:(ComplateBlock)block andProgress:(ProgressBlock)progress{
    CCHttpRequest* request = [CCHttpRequest requestWithURL:[NSURL URLWithString:@"http://www.qeebu.com/newe/Public/Attachment/99/52958fdb45565.mp4"]];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:60];
    request.block = ^(NSData* data){
        //jiexi
        backStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //NSLog(@"1111 %@",str);
        block(backStr);
    };
    request.progressBlock = ^(double a){
        progress(a);
    };
    
    [request startAsynrc];
}

@end

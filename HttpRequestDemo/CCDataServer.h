//
//  CCDataServer.h
//  HttpRequestDemo
//
//  Created by Qeebu on 13-12-4.
//  Copyright (c) 2013年 Qeebu. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ComplateBlock)(NSString* str);
typedef void(^ProgressBlock)(double a);


@interface CCDataServer : NSObject{
    NSString* backStr;
}

- (void)getWeatherData:(NSDictionary*)params block:(ComplateBlock)block andProgress:(ProgressBlock)progress;

@end

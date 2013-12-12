//
//  DownViewController.h
//  HttpRequestDemo
//
//  Created by Qeebu on 13-12-12.
//  Copyright (c) 2013年 Qeebu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *progress;

- (IBAction)download:(id)sender;
- (IBAction)play:(id)sender;

@end

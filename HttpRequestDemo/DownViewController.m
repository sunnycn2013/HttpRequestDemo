//
//  DownViewController.m
//  HttpRequestDemo
//
//  Created by Qeebu on 13-12-12.
//  Copyright (c) 2013年 Qeebu. All rights reserved.
//

#import "DownViewController.h"
#import "CCDataServer.h"
#import <MediaPlayer/MPMoviePlayerViewController.h>

@interface DownViewController ()

@end

@implementation DownViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)download:(id)sender {
    NSDictionary* dic = @{@"key":@"111"};
    
    CCDataServer* dataserver = [[CCDataServer alloc] init];
    [dataserver getWeatherData:dic
                         block:^(id result){
                               NSLog(@"dddd %@",result);
                                }
                   andProgress:^(double a){
                       self.progressView.progress = a;
                       self.progress.text = [NSString stringWithFormat:@"%.3f",a*100];
                   }
     ];

}

- (IBAction)play:(id)sender {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* str = [paths objectAtIndex:0];
    NSString* file = [NSString stringWithFormat:@"%@/aa.mp4",str];
    MPMoviePlayerViewController* controller = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:file]];
    [self presentViewController:controller animated:YES completion:nil];
}
@end

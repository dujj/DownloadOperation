//
//  ViewController.m
//  Dispatch
//
//  Created by 朱天超 on 14-7-4.
//  Copyright (c) 2014年 zhaoonline. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"

#import "DownLoadOperation.h"



#define Vedio @"http://221.228.249.82/youku/697A5CA0CEB3582FB91C4E3A88/03002001004E644FA2997704E9D2A7BA1E7B9D-6CAB-79A9-E635-3B92A92B3500.mp4"

#define Picture @"http://x1.zhuti.com/down/2012/11/29-win7/3D-1.jpg"


@interface ViewController ()
{
    DownLoadOperation* operation;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.progressView setProgress:0 animated:NO];
//    //    初始化方法
//    ZACalenderYearView *calendar=[[ZACalenderYearView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) selectDate:nil
//                                  ];
//    [self.view addSubview:calendar];
    

    
    


}

- (IBAction)resume:(id)sender
{
    [operation.requestOperation resume];
    
}



- (IBAction)pasuse:(id)sender
{
    [operation.requestOperation pause];
    
}



- (IBAction)download:(id)sender
{
//http://202.102.88.133/youku/657114D0FE44481C592F964ABD/030020010053F4AB5FB92A01296A84C7E5A401-0FC6-BD65-4525-706B419E9EA6.mp4
//    http://b.hiphotos.baidu.com/image/h%3D1200%3Bcrop%3D0%2C0%2C1920%2C1200/sign=b284ea7541a98226a7c12f25bab28262/960a304e251f95ca8888fab6cb177f3e670952b4.jpg
    NSString* path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/temp"];
    NSLog(@"path = %@",path);
    operation = [[DownLoadOperation alloc] init];
    [operation downloadWithUrl:Picture
                     cachePath:^NSString *{
                         return path;
                     } progressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
                         
                         NSLog(@"bytesRead = %u ,totalBytesRead = %llu totalBytesExpectedToRead = %llu",bytesRead,totalBytesRead,totalBytesExpectedToRead);
                         float progress = totalBytesRead / (float)totalBytesExpectedToRead;
                         
                         [self.progressView setProgress:progress animated:YES];
                         
                         [self.label setText:[NSString stringWithFormat:@"%.2f%%",progress*100]];
                         UIImage* image = [UIImage imageWithData:operation.requestOperation.responseData];
                         [self.imageView setImage:image];
                         
                     } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                         
                         NSLog(@"success");
                         UIImage* image = [UIImage imageWithData:operation.responseData];
                         [self.imageView setImage:image];
                         
                         
                         
                     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                         NSLog(@"error = %@",error);
                     }];

    
    
}
- (IBAction)dispatch_click:(id)sender {
    
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

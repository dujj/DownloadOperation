//
//  ViewController.h
//  Dispatch
//
//  Created by 朱天超 on 14-7-4.
//  Copyright (c) 2014年 zhaoonline. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *dipatch;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;


@property (weak, nonatomic) IBOutlet UIButton *pause;


@property (weak, nonatomic) IBOutlet UIButton *resume;


@end

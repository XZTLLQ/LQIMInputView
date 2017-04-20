//
//  ViewController.m
//  LQIMInputView
//
//  Created by lawchat on 2016/10/25.
//  Copyright © 2016年 jacli. All rights reserved.
//

#import "ViewController.h"

#import "LQIMInputView.h"

@interface ViewController ()

@property(nonatomic,strong) LQIMInputView *inputView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.inputView = [[LQIMInputView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-210, [UIScreen mainScreen].bounds.size.width, 210)];
    self.inputView.backgroundColor = [UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1.0];
    [self.inputView addItem:[InputItemModel initWithTitle:@"相册" imageName:@"tupian" clickedBlock:^{
        NSLog(@"相册");
    }]];
    [self.inputView addItem:[InputItemModel initWithTitle:@"拍照" imageName:@"zhaoxian" clickedBlock:^{
        NSLog(@"拍照");
    }]];
    [self.inputView addItem:[InputItemModel initWithTitle:@"加价" imageName:@"jiajia" clickedBlock:^{
        NSLog(@"加价");
    }]];
    [self.inputView addItem:[InputItemModel initWithTitle:@"确认完成" imageName:@"queren" clickedBlock:^{
        NSLog(@"确认完成");
    }]];
    [self.inputView addItem:[InputItemModel initWithTitle:@"联系客服" imageName:@"kefu" clickedBlock:^{
        NSLog(@"联系客服");
    }]];
    [self.inputView addItem:[InputItemModel initWithTitle:@"电话联系" imageName:@"dianhau" clickedBlock:^{
        NSLog(@"电话联系");
    }]];
    [self.inputView addItem:[InputItemModel initWithTitle:@"相册" imageName:@"tupian" clickedBlock:^{
        NSLog(@"相册");
    }]];
    [self.inputView addItem:[InputItemModel initWithTitle:@"拍照" imageName:@"zhaoxian" clickedBlock:^{
        NSLog(@"拍照");
    }]];
    [self.inputView addItem:[InputItemModel initWithTitle:@"加价" imageName:@"jiajia" clickedBlock:^{
        NSLog(@"加价");
    }]];
    [self.inputView addItem:[InputItemModel initWithTitle:@"确认完成" imageName:@"queren" clickedBlock:^{
        NSLog(@"确认完成");
    }]];
    [self.inputView addItem:[InputItemModel initWithTitle:@"联系客服" imageName:@"kefu" clickedBlock:^{
        NSLog(@"联系客服");
    }]];
    [self.inputView addItem:[InputItemModel initWithTitle:@"电话联系" imageName:@"dianhau" clickedBlock:^{
        NSLog(@"电话联系");
    }]];
    
    [self.view addSubview:self.inputView];
}


@end

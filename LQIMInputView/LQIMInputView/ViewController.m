//
//  ViewController.m
//  LQIMInputView
//
//  Created by lawchat on 2016/10/25.
//  Copyright © 2016年 jacli. All rights reserved.
//

#import "ViewController.h"

#import "LQInputViewConfig.h"

@interface ViewController ()

@property(nonatomic,strong) LQInputViewConfig *inputViewConfig;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.inputViewConfig.inputView];
}

#pragma mark - 工具栏
- (LQInputViewConfig *)inputViewConfig {
    if (!_inputViewConfig) {
        
        
        _inputViewConfig  = [LQInputViewConfig initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-210, [UIScreen mainScreen].bounds.size.width, 210) itemModelArray:@[[InputItemModel initWithTitle:@"电话联系" imageName:@"dianhau" type:LQIMInputViewItemType_CallUser],
                                                                                                                                                                                        [InputItemModel initWithTitle:@"相册" imageName:@"tupian" type:LQIMInputViewItemType_SendPhoto],
                                                                                                                                                                                        [InputItemModel initWithTitle:@"拍照" imageName:@"zhaoxian" type:LQIMInputViewItemType_OpenCamera],
                                                                                                                                                                                        [InputItemModel initWithTitle:@"加价" imageName:@"jiajia" type:LQIMInputViewItemType_AddMoney],
                                                                                                                                                                                        [InputItemModel initWithTitle:@"确认完成" imageName:@"queren" type:LQIMInputViewItemType_InviteFinish],
                                                                                                                                                                                        [InputItemModel initWithTitle:@"联系客服" imageName:@"kefu" type:LQIMInputViewItemType_CallServer]                                                                       ]];
        
        
        //选择后处理
        [_inputViewConfig didInputWithBlock:^(LQIMInputViewItemType type, id data) {
            
            [self.view endEditing:YES];
            switch (type) {
                case LQIMInputViewItemType_CallUser:
                {
                    //电话联系
                    UIWebView *webView = [[UIWebView alloc]init];
                    NSURL *url = [NSURL URLWithString:@"telprompt://110"];
                    [webView loadRequest:[NSURLRequest requestWithURL:url]];
                    [self.view addSubview:webView];
                    break;
                }
                case LQIMInputViewItemType_CallServer:
                {
                    //联系客服
                    UIWebView *webView = [[UIWebView alloc]init];
                    NSURL *url = [NSURL URLWithString:@"telprompt://110"];
                    [webView loadRequest:[NSURLRequest requestWithURL:url]];
                    [self.view addSubview:webView];
                    break;
                }
                case LQIMInputViewItemType_SendPhoto:
                {
                    //相册
                    
                    
                    break;
                }
                case LQIMInputViewItemType_OpenCamera:
                {
                    //拍照
                    
                    
                    break;
                }
                case LQIMInputViewItemType_AddMoney:
                {
                    //加价

                    break;
                }
                case LQIMInputViewItemType_InviteFinish:
                {
                    //邀请确认完成

                    break;
                }
                    
                    
                default:
                    break;
            }
            
        }];
    }
    
    return _inputViewConfig;
}


@end

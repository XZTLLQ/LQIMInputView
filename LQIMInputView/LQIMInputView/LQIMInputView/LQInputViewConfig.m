//
//  LQInputViewConfig.m
//  LQIMInputView
//
//  Created by lawchat on 2016/10/25.
//  Copyright © 2016年 674297026@qq.com. All rights reserved.
//

#import "LQInputViewConfig.h"

@interface LQInputViewConfig ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic , assign) LQIMInputViewItemType clickedType;

@end

@implementation LQInputViewConfig

+ (instancetype)initWithFrame:(CGRect)frame itemModelArray:(NSArray *)itemModelArray
{
    LQInputViewConfig *obj = [[LQInputViewConfig alloc] init];
    
    [obj getInputViewWithFrame:frame itemModelArray:itemModelArray];
    
    return obj;
}

+ (instancetype)initWithItemModelArray:(NSArray *)itemModelArray {
    
    LQInputViewConfig *obj = [[LQInputViewConfig alloc] init];
    
    [obj getInputViewWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 210) itemModelArray:itemModelArray];
    
    return obj;
}

- (void)getInputViewWithFrame:(CGRect)frame itemModelArray:(NSArray *)itemModelArray {

    self.inputView = [LQIMInputView initWithFrame:frame itemModels:itemModelArray];
    self.inputView.delegate = self;
    self.inputView.collectionView.backgroundColor = [UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1.0];
    self.inputView.backgroundColor = [UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1.0];
    
}

#pragma mark - 点击选择的类型
- (void)didSelectedItemType:(NSInteger)type {
    _clickedType = type;
    switch (type) {
        case LQIMInputViewItemType_CallUser:
        {
            //电话联系
            break;
        }
        case LQIMInputViewItemType_CallServer:
        {
            //联系客服
            break;
        }
        case LQIMInputViewItemType_SendPhoto:
        {
            //相册
            [self pickPhotoFromLibrary];
            break;
        }
        case LQIMInputViewItemType_OpenCamera:
        {
            //拍照
            [self takePhotoUseCamera];
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
    
    if (self.didInputBlock) {
        _didInputBlock(type,nil);
    }
    
}

- (void)didInputWithBlock:(void(^)(LQIMInputViewItemType type, id data))didInputBlock {
    self.didInputBlock = didInputBlock;
}

/**
*  从拍照选择
*/
- (void)takePhotoUseCamera
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    BOOL isCameraAvailable = [UIImagePickerController isSourceTypeAvailable:sourceType];
    
    if (isCameraAvailable) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
//        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        
        UIViewController *vc = [self getCurrentVC];
        [vc presentViewController:picker animated:YES completion:nil];
    }
    else {
        
        [self alertWithTitle:nil msg:@"无法访问您的照相机！" tag:0];
    }
}

/**
 *  从相册选择
 */
- (void)pickPhotoFromLibrary
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    BOOL isPhotoLibraryAvailable = [UIImagePickerController isSourceTypeAvailable:sourceType];
    
    if (isPhotoLibraryAvailable) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
//        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        
        UIViewController *vc = [self getCurrentVC];
        [vc presentViewController:picker animated:YES completion:nil];
    }
    else {
        
        [self alertWithTitle:nil msg:@"无法访问您的相册！" tag:0];
    }
    
}
#pragma mark - 弹出提示框
- (void)alertWithTitle:(NSString *)title msg:(NSString *)msg tag:(NSUInteger)tag
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"确定", nil];
    alert.tag = tag;
    [alert show];
}
#pragma mark -imagePicker delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        //先把图片转成NSData
        
        UIImage *editImg = [info objectForKey:UIImagePickerControllerOriginalImage];
        if (_didInputBlock) {
            _didInputBlock(_clickedType,editImg);
        }
        
        
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}


@end

#LQ系列--UI
####LQPhotoPickerDemo - https://github.com/XZTLLQ/LQClass （强烈推荐！！！可节约项目大量细节调控时间，体验效果很好！）
####LQPhotoPickerDemo - https://github.com/XZTLLQ/LQPhotoPickerDemo （选择图片上传）
####LQIMInputView - https://github.com/XZTLLQ/LQIMInputView （聊天页面工具栏）
#LQIMInputView
### 效果图
  如图功能，集成方便
![](https://github.com/xztl/LQIMInputView/blob/master/IMG_1756.PNG)
### 使用方法：
1.“LQIMInputView”目录文件即为集成所需文件:

```
InputItem  .h&.m
InputItemModel  .h&.m
LQCollectionViewHorizontalLayout  .h&.m
LQIMInputVie  .h&.m
LQInputViewConfig  .h&.m
```
2.集成代码：
第一步：LQInputViewConfig类中添加或修改类型为自己自定义的功能

```
1.LQInputViewConfig.h
typedef NS_ENUM(NSInteger, LQIMInputViewItemType)
{
    LQIMInputViewItemType_CallUser = 0,
    LQIMInputViewItemType_CallServer = 1,
    LQIMInputViewItemType_SendPhoto = 2,
    LQIMInputViewItemType_OpenCamera = 3,
    LQIMInputViewItemType_AddMoney = 4,
    LQIMInputViewItemType_InviteFinish = 5，
    //...
};
2.LQInputViewConfig.m
#pragma mark - 点击选择的类型（在该方法中实现简单处理回调）
- (void)didSelectedItemType:(NSInteger)type 
```

第二步：使用View，将下面代码放在需要使用的类中，懒加载获得inputView，之后自己在合适的地方addSubview: 如项目例子使用，[self.view addSubview:self.inputViewConfig.inputView];

```
//定义变量
@property(nonatomic,strong) LQInputViewConfig *inputViewConfig;


#pragma mark - 工具栏
- (LQInputViewConfig *)inputViewConfig {
    
    if (!_inputViewConfig) {
    
        //创建view
        _inputViewConfig  = [LQInputViewConfig initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-210, [UIScreen mainScreen].bounds.size.width, 210)
        itemModelArray:@[[InputItemModel initWithTitle:@"电话联系" imageName:@"dianhau" type:LQIMInputViewItemType_CallUser],
        [InputItemModel initWithTitle:@"相册" imageName:@"tupian" type:LQIMInputViewItemType_SendPhoto],
        [InputItemModel initWithTitle:@"拍照" imageName:@"zhaoxian" type:LQIMInputViewItemType_OpenCamera],
        [InputItemModel initWithTitle:@"加价" imageName:@"jiajia" type:LQIMInputViewItemType_AddMoney],
        [InputItemModel initWithTitle:@"确认完成" imageName:@"queren" type:LQIMInputViewItemType_InviteFinish],
        [InputItemModel initWithTitle:@"联系客服" imageName:@"kefu" type:LQIMInputViewItemType_CallServer]]];

        //选择后处理回调
        [_inputViewConfig didInputWithBlock:^(LQIMInputViewItemType type, id data) {
            [self.view endEditing:YES];
            switch (type) {
                case LQIMInputViewItemType_CallUser:{
                    break;
                }
                //...case all type
                default:
                    break;
            }
            
        }];
    }
    
    return _inputViewConfig;
}
```




# LQ系列 -- APP 项目模板 V1.0（高阶）

#### 项目开发模板-按需登录型应用 - https://github.com/XZTLLQ/LQProject-NoLogin
#### 项目开发模板-强制登录型应用 - https://github.com/XZTLLQ/LQProject-MustLogin

注意：此模板是自己的设计，虽然称不上是神作，但是有很多地方有非常好的设计点能帮助开发者快速构建项目，用过的都表示赞👍 ！！！
# LQ系列--UI
#### LQPhotoPickerDemo - https://github.com/XZTLLQ/LQClass （可节约项目大量细节调控时间，体验好！）
#### LQPhotoPickerDemo - https://github.com/XZTLLQ/LQPhotoPickerDemo （选择图片上传）
#### LQIMInputView - https://github.com/XZTLLQ/LQIMInputView （聊天页面工具栏）
# LQIMInputView
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
```
2.使用方法：
```
//第一步
self.inputView = [[LQIMInputView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-210, [UIScreen mainScreen].bounds.size.width, 210)];
//第二步
    self.inputView.backgroundColor = [UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1.0];
//第三步
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
//第四步
    [self.view addSubview:self.inputView];
```




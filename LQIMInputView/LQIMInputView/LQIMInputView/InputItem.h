//
//  InputItem.h
//  LQIMInputView
//
//  Created by lawchat on 2016/10/25.
//  Copyright © 2016年 674297026@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputItemModel.h"



@interface InputItem : UICollectionViewCell

@property(nonatomic,strong) InputItemModel *model;

//图文
@property(nonatomic,strong) UIButton *contentBtn;





@end

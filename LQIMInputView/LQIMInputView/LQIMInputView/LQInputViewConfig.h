//
//  LQInputViewConfig.h
//  LQIMInputView
//
//  Created by lawchat on 2016/10/25.
//  Copyright © 2016年 674297026@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LQIMInputView.h"


typedef NS_ENUM(NSInteger, LQIMInputViewItemType)
{
    LQIMInputViewItemType_CallUser = 0,
    LQIMInputViewItemType_CallServer = 1,
    LQIMInputViewItemType_SendPhoto = 2,
    LQIMInputViewItemType_OpenCamera = 3,
    LQIMInputViewItemType_AddMoney = 4,
    LQIMInputViewItemType_InviteFinish = 5,
};



@interface LQInputViewConfig : NSObject<LQIMInputViewDelegate>



+ (instancetype)initWithFrame:(CGRect)frame itemModelArray:(NSArray *)itemModelArray;

+ (instancetype)initWithItemModelArray:(NSArray *)itemModelArray;

@property(nonatomic,strong) LQIMInputView *inputView;




typedef void (^DidInputBlock) (LQIMInputViewItemType type, id data);
@property(nonatomic) DidInputBlock didInputBlock;



/**
 完成点击工具栏处理后的回调

 @param didInputBlock DidInputBlock
 */
- (void)didInputWithBlock:(void(^)(LQIMInputViewItemType type, id data))didInputBlock;

@end

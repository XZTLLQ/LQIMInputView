//
//  LQIMInputView.h
//  LQIMInputView
//
//  Created by lawchat on 2016/10/25.
//  Copyright © 2016年 674297026@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputItem.h"

@protocol LQIMInputViewDelegate <NSObject>

@optional
- (void)didSelectedItemType:(NSInteger)type;

@end

@interface LQIMInputView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionView *collectionView;

@property(nonatomic,strong) UIPageControl *pageCtr;

@property(nonatomic,strong) NSArray<InputItemModel*> *itemModels;


@property(nonatomic,weak) id<LQIMInputViewDelegate> delegate;

+ (instancetype)initWithFrame:(CGRect)frame itemModels:(NSArray *)itemModels;

@end

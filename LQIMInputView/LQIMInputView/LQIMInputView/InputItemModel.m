//
//  InputItemModel.m
//  LQIMInputView
//
//  Created by lawchat on 2016/10/25.
//  Copyright © 2016年 674297026@qq.com. All rights reserved.
//

#import "InputItemModel.h"

@implementation InputItemModel

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName clickedBlock:(ItemClicked)clickedBlock
{
    self = [super init];
    if (self) {
        self.title = title;
        self.imageName = imageName;

        self.clickedBlock = clickedBlock;
    }
    return self;
}

+ (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName clickedBlock:(ItemClicked)clickedBlock{
    return [[InputItemModel alloc] initWithTitle:title imageName:imageName clickedBlock:clickedBlock];
}

@end

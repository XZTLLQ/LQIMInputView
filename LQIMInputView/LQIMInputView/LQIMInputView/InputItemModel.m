//
//  InputItemModel.m
//  LQIMInputView
//
//  Created by lawchat on 2016/10/25.
//  Copyright © 2016年 674297026@qq.com. All rights reserved.
//

#import "InputItemModel.h"

@implementation InputItemModel

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName type:(NSInteger)type
{
    self = [super init];
    if (self) {
        self.title = title;
        self.imageName = imageName;
        self.type = type;
    }
    return self;
}

+ (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName type:(NSInteger)type{
    return [[InputItemModel alloc] initWithTitle:title imageName:imageName type:type];
}

@end

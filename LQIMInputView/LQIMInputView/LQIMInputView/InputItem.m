//
//  InputItem.m
//  LQIMInputView
//
//  Created by lawchat on 2016/10/25.
//  Copyright © 2016年 674297026@qq.com. All rights reserved.
//

#import "InputItem.h"

@implementation InputItem

#pragma mark - 设置图文上下排版和间距
- (void)setImageSpacing:(CGFloat)spacing {
    [self layoutIfNeeded];
    
    [_contentBtn setTitleEdgeInsets:UIEdgeInsetsMake(_contentBtn.imageView.frame.size.height ,-_contentBtn.imageView.frame.size.width, -2*spacing,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [_contentBtn setImageEdgeInsets:UIEdgeInsetsMake(-2*spacing, 0.0,0.0, -_contentBtn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.contentBtn setImage:[UIImage imageNamed:_model.imageName] forState:UIControlStateNormal];
    
    [self.contentBtn setTitle:_model.title forState:UIControlStateNormal];
    
    [self setImageSpacing:6];

}

- (UIButton *)contentBtn {
    if (!_contentBtn) {
        _contentBtn = [[UIButton alloc] initWithFrame:self.bounds];
        _contentBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        _contentBtn.userInteractionEnabled = NO;
        _contentBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_contentBtn setTitleColor:[UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self addSubview:_contentBtn];
    }
    return _contentBtn;
}

#pragma mark - 数据源赋值
- (void)setModel:(InputItemModel *)model {
    
    _model = model;
    
    [self layoutSubviews];
}




@end

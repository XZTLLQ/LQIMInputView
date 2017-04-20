//
//  LQIMInputView.m
//  LQIMInputView
//
//  Created by lawchat on 2016/10/25.
//  Copyright © 2016年 674297026@qq.com. All rights reserved.
//

#import "LQIMInputView.h"
#import "LQCollectionViewHorizontalLayout.h"

@implementation LQIMInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
        [self addSubview:self.pageCtr];
    }
    return self;
}

- (void)addItem:(InputItemModel*)model {
    if (!self.itemModels) {
        self.itemModels = [NSMutableArray array];
    }
    [self.itemModels addObject:model];
    [self.collectionView reloadData];
    
    NSInteger pageNum = (_itemModels.count-1) / 8 + 1;
    if (pageNum>1) {
        _pageCtr.numberOfPages = pageNum;
        _pageCtr.currentPage = 0;
    }
}

#pragma mark - 页码控件
- (UIPageControl *)pageCtr {
    if (!_pageCtr) {
        _pageCtr = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0,200, 20)];
        _pageCtr.center = CGPointMake(self.bounds.size.width / 2.0, self.collectionView.bounds.size.height +10);
        
        _pageCtr.pageIndicatorTintColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
        _pageCtr.currentPageIndicatorTintColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];

        _pageCtr.userInteractionEnabled  = NO;
    }
    return _pageCtr;
}

#pragma mark - collectionView
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        //功能列表
        
        LQCollectionViewHorizontalLayout *layout = [[LQCollectionViewHorizontalLayout alloc] init];
        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/4.0, (CGRectGetHeight(self.bounds)-40) / 2.0);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.headerReferenceSize = CGSizeMake(0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)-40) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.pagingEnabled = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        
        [_collectionView registerClass:[InputItem class] forCellWithReuseIdentifier:@"InputItem"];
        
    }
    
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _itemModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    InputItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InputItem" forIndexPath:indexPath];
    
    cell.model = self.itemModels[indexPath.item];
    return cell;
}


#pragma mark - 选择了某功能
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    InputItemModel *item = self.itemModels[indexPath.item];
    if (item.clickedBlock) {
        item.clickedBlock();
    }
}

#pragma mark - 滚动视图
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    /**
     *  滚动设置当前页码
     */
    int page = (int)(self.collectionView.contentOffset.x / scrollView.bounds.size.width + 0.5) % _itemModels.count;
    _pageCtr.currentPage = page;
}

@end

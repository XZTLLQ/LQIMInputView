//
//  LQCollectionViewHorizontalLayout.m
//  LQIMInputView
//
//  Created by lawchat on 2016/10/25.
//  Copyright © 2016年 674297026@qq.com. All rights reserved.
//

#import "LQCollectionViewHorizontalLayout.h"


@interface LQCollectionViewHorizontalLayout ()
@property (strong, nonatomic) NSMutableArray *allAttributes;
@end

@implementation LQCollectionViewHorizontalLayout
- (void)prepareLayout
{
    [super prepareLayout];
    
    self.rowCount = 2;
    self.itemCountPerRow = 4;

}

- (CGSize)collectionViewContentSize
{

    return CGSizeMake(self.collectionView.bounds.size.width * ((([self.collectionView numberOfItemsInSection:0] - 1) / (_itemCountPerRow * _rowCount)) +1), self.collectionView.bounds.size.height);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger item = indexPath.item;
    NSUInteger x;
    NSUInteger y;
    [self targetPositionWithItem:item resultX:&x resultY:&y];
    NSUInteger item2 = [self originItemAtX:x y:y];
    NSIndexPath *theNewIndexPath = [NSIndexPath indexPathForItem:item2 inSection:indexPath.section];
    
    UICollectionViewLayoutAttributes *theNewAttr = [super layoutAttributesForItemAtIndexPath:theNewIndexPath];
    theNewAttr.indexPath = indexPath;

    return theNewAttr;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{

    return self.allAttributes;

}

- (NSMutableArray *)allAttributes {
    if (!_allAttributes) {
        _allAttributes = [NSMutableArray array];
        
        NSUInteger count = [self.collectionView numberOfItemsInSection:0];
        for (NSUInteger i = 0; i<count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            [_allAttributes addObject:attributes];
        }
        
    }
    
    return _allAttributes;
}

// 根据 item 计算目标item的位置
// x 横向偏移  y 竖向偏移
- (void)targetPositionWithItem:(NSUInteger)item
                       resultX:(NSUInteger *)x
                       resultY:(NSUInteger *)y
{
    NSUInteger page = item/(self.itemCountPerRow*self.rowCount);
    
    NSUInteger theX = item % self.itemCountPerRow + page * self.itemCountPerRow;
    NSUInteger theY = item / self.itemCountPerRow - page * self.rowCount;
    if (x != NULL) {
        *x = theX;
    }
    if (y != NULL) {
        *y = theY;
    }
}

// 根据偏移量计算item
- (NSUInteger)originItemAtX:(NSUInteger)x
                          y:(NSUInteger)y
{
    NSUInteger item = x * self.rowCount + y;
    return item;
}
@end

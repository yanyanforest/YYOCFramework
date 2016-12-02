//
//  CYUICVDSD_base.m
//  KHMall
//
//  Created by 198 on 16/5/19.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUICVDSD_base.h"
#import "CYUICVCell_base.h"
#import "CYUICVHeader_base.h"

@interface CYUICVDSD_base()
@end
@implementation CYUICVDSD_base
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellReuseIdentifier = @"cell_Id";
    }
    return self;
}
-(id)itemAtIndexPath:(NSIndexPath *)indexpath
{
    return ((NSArray *)((NSArray *)[self.object valueForKey:kCollectionCellDataSourceId])[indexpath.section])[indexpath.row];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (!self.object) {
        return  0;
    }
    return ((NSArray *)[self.object valueForKey:kCollectionCellDataSourceId]).count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (!self.object) {
        return  0;
    }
    return ((NSArray *)((NSArray *)[self.object valueForKey:kCollectionCellDataSourceId]) [section]).count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CYUICVCell_base *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellReuseIdentifier forIndexPath:indexPath];
    cell.object = [self itemAtIndexPath:indexPath];
    return cell;
    
}
//-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath];
    //过一段时间再添加选中状态
    if (self.block_itemSelected) {
        self.block_itemSelected(item);
    }
    if (self.block_itemAtIndexPathSelected) {
        self.block_itemAtIndexPathSelected(item,indexPath);
    }
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
  
    if (self.classesBySuppViewKindAndReuseId.allKeys.count == 1 && self.object) {
        NSArray *arr = [self.classesBySuppViewKindAndReuseId objectForKey:kCollectionSectionDataSourceId];
        CYUICVHeader_base *header=  [collectionView dequeueReusableSupplementaryViewOfKind:arr[0] withReuseIdentifier:arr[1] forIndexPath:indexPath];
        header.object = [self.object valueForKey:kCollectionSectionDataSourceId][indexPath.section];
        return header;
    } else {
        
        UICollectionReusableView *header=  [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header_default"forIndexPath:indexPath];
        return header;
    }
}

@end

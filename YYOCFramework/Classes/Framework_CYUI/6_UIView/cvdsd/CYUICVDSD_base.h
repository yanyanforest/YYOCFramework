//
//  CYUICVDSD_base.h
//  KHMall
//
//  Created by 198 on 16/5/19.
//  Copyright © 2016年 198. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYBlock.h"
#define kCollectionCellDataSourceId @"content"
#define kCollectionSectionDataSourceId @"header"
@interface CYUICVDSD_base : NSObject<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSObject *object;
@property(nonatomic,strong)NSDictionary *classesByCellReuseId;
@property(nonatomic,strong)NSString *cellReuseIdentifier;
@property(nonatomic,strong)NSDictionary *classesBySuppViewKindAndReuseId;
@property(nonatomic,strong)CYBlock_Object block_itemSelected;
@property(nonatomic,strong)CYBlock_ObjectIndexpath block_itemAtIndexPathSelected;

-(id)itemAtIndexPath:(NSIndexPath *)indexpath;

@end

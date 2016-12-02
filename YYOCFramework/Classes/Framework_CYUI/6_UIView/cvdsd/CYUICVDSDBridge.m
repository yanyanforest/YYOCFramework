//
//  CYUICVDSDBridge.m
//  KHMall
//
//  Created by 198 on 16/5/20.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUICVDSDBridge.h"
@implementation CYUICVDSDBridge
+ (void)bridgeView:(UICollectionView *)cv dsd:(CYUICVDSD_base *)dsd
{
    cv.dataSource = dsd;
    cv.delegate = dsd;
    [self updateView:cv reuseChangeOnDsd:dsd];
}
+(void)updateView:(UICollectionView *)cv reuseChangeOnDsd:(CYUICVDSD_base *)dsd
{
    [cv registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header_default"];
    dsd.collectionView = cv;
    if (dsd.classesByCellReuseId) {
        [dsd.classesByCellReuseId enumerateKeysAndObjectsUsingBlock:^(id  key, id  obj, BOOL * stop) {
            Class cls = nil;

            if ([obj isKindOfClass:[NSString class]]) {
                cls = NSClassFromString(obj);
                NSAssert(cls, @"CLASS %@ not found,please check class name",obj);
            } else {
                cls = obj;
            }
            dsd.cellReuseIdentifier = key;
            [cv registerClass:cls forCellWithReuseIdentifier:key];
            
        }];
            [dsd.classesBySuppViewKindAndReuseId enumerateKeysAndObjectsUsingBlock:^(id  key, id  obj, BOOL * stop) {
                Class cls = nil;
                
                if ([obj isKindOfClass:[NSString class]]) {
                    cls = NSClassFromString(obj);
                    [cv registerClass:cls forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:key];

                    NSAssert(cls, @"CLASS %@ not found,please check class name",obj);
                }else if( [obj isKindOfClass:[NSArray class]]){
                    cls = NSClassFromString(obj[1]);
                    NSAssert(cls, @"CLASS %@ not found,please check class name",obj);
                    [cv registerClass:cls forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:obj[1]];

                }
            }];
       
    }
}
@end

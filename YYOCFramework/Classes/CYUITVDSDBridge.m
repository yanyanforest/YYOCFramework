//
//  CYUITVDSDBridge.m
//  KHMall
//
//  Created by 198 on 16/5/21.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUITVDSDBridge.h"

@implementation CYUITVDSDBridge
+(void)bridge:(UITableView *)tv dsd:(CYUITVDSD_base *)dsd{
    if (tv) {
        tv.delegate = dsd;
        tv.dataSource = dsd;
        dsd.tableView = tv;
    }
    [CYUITVDSDBridge updataView:tv dsd:dsd];
}
+(void)updataView:(UITableView *)tv dsd:(CYUITVDSD_base *)dsd{
    [dsd.classesIdbyReusedCells enumerateKeysAndObjectsUsingBlock:^(id   key, id   obj, BOOL * stop) {
        Class cls = nil;

        if ([obj isKindOfClass:[NSString class]]) {
            cls = NSClassFromString((NSString *)obj);

        } else {
            cls = obj;
        }
        dsd.reusedCellIdentifier = key;
        [tv registerClass: cls forCellReuseIdentifier:key];

    }];
    if (dsd.classesIdBySupplementView) {
        [dsd.classesIdBySupplementView enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            Class cls ;
            if ([obj isKindOfClass:[NSString class]]) {
                cls = NSClassFromString(obj);
                [tv registerClass:cls forHeaderFooterViewReuseIdentifier:key];
            } else {
                NSArray *objArr = obj;
                cls = NSClassFromString(objArr[1]);
                [tv registerClass:cls forHeaderFooterViewReuseIdentifier:objArr[0]];

            }
        }];
    }
    
}
@end

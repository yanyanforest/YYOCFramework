//
//  UIStory_UINC_base.m
//  KHMall
//
//  Created by 198 on 16/5/18.
//  Copyright © 2016年 198. All rights reserved.
//

#import "UIStory_UINC_base.h"
@interface UIStory_UINC_base(){
    UINavigationController *_navigationController;
}
@end
@implementation UIStory_UINC_base
- (UINavigationController *)navigationController{
    if (!_navigationController) {
        NSAssert(_rootController, @"rootController is nil,please init it before use");
        _navigationController = [[UINavigationController alloc]initWithRootViewController:_rootController];
        _navigationController.delegate = self;
    }
    return _navigationController;
}
@end

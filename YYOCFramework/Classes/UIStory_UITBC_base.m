//
//  UIStory_UITBC_base.m
//  KHMall
//
//  Created by 198 on 16/5/18.
//  Copyright © 2016年 198. All rights reserved.
//

#import "UIStory_UITBC_base.h"
@interface UIStory_UITBC_base()
{
    UITabBarController *_tabBarController;
}
@end
@implementation UIStory_UITBC_base
- (instancetype)init
{
    self = [super init];
    if (self) {
    
    }
    return self;
}
-(UITabBarController *)tabBarController{
    if (!_tabBarController) {
        _tabBarController = [[UITabBarController alloc]init];
        _tabBarController.delegate = self;
        
    }
    return _tabBarController;
}
-(void)setVcConfigs:(NSArray *)vcConfigs
{
    _vcConfigs = vcConfigs;
    NSMutableArray *vcsArr = [NSMutableArray array];
    for (UIViewController *vc in _vcConfigs) {
        if (!vc.tabBarItem.title) {
            vc.tabBarItem.title = vc.title;
        }
        [vcsArr addObject:vc];
    }
    self.tabBarController.viewControllers = vcsArr;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    _lastSelectedIndex = tabBarController.selectedIndex;
    return YES;
}
@end

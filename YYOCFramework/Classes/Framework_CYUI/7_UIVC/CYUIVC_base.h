//
//  CYUIVC_base.h
//  KHMall
//
//  Created by 198 on 16/5/18.
//  Copyright © 2016年 198. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYBlock.h"
@interface CYUIVC_base : UIViewController
- (void)addSubviews;

- (void)addBarButtons;
- (void)writeView;
- (void)hideTabBar:(BOOL)hide;
- (void)showFullScreen:(BOOL)fullScreen;
@property(nonatomic,strong)id object;
@end

//
//  CYUIView_Introduction.h
//  KHMall
//
//  Created by 198 on 16/6/17.
//  Copyright © 2016年 198. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYUIView_base.h"
@interface CYUIView_Introduction : CYUIView_base
@property(nonatomic,strong)NSString *cellIdentifier;
@property(nonatomic,strong,readonly)UIButton *guideButton;
@property(nonatomic,strong)CYBlock_Object block_guideClick;
- (void)showGuideViewWithImagesData:(NSArray *)imagesdata;

@end

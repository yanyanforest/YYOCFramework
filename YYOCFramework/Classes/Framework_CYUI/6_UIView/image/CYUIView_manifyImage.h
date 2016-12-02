//
//  CYUIView_manifyImage.h
//  KHMall
//
//  Created by 198 on 16/6/13.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUIView_base.h"
#import "CYBlock.h"

@interface CYUIView_manifyImage : CYUIView_base
@property(nonatomic,readonly)UIImageView *imageView;
// 是否置为初始状态
@property(nonatomic,assign) BOOL isResetInitial;
@property(nonatomic,strong) CYBlock_Object block_dismiss;
@end

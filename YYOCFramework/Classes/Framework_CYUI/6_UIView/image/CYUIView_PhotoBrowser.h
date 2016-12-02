//
//  CYUIView_PhotoBrowser.h
//  KHMall
//
//  Created by yanyan on 16/9/19.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUIView_base.h"
// 图片浏览控件
@interface CYUIView_PhotoBrowser : CYUIView_base
@property(nonatomic, assign)NSInteger currentIndex;//当前展示的图片的下标。从0开始。
@property(nonatomic,strong)CYBlock_Object block_dismiss;

/**
 *  存放图片的模型 :url && UIView
 */
@property (nonatomic, strong) NSArray *itemsArr;
// 是否需要右上角的按钮. Default is YES;
@property (nonatomic, assign) BOOL isNeedRightTopBtn;
// 是否展示 顶部 1 / 9 控件 ,Default is NO
@property (nonatomic, assign)BOOL isShowPageNumView;
// 是否展示 底部UIPageControl, Default is NO
@property (nonatomic, assign) BOOL isShowPageControl;
// 展现
- (void)present;
// 消失
- (void)dismiss;
@end

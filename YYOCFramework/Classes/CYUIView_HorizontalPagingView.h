//
//  CYUIView_HorizontalPagingView.h
//  KHMall
//
//  Created by 198 on 16/6/27.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUIView_base.h"

@interface CYUIView_HorizontalPagingView : CYUIView_base

@property (nonatomic, copy) void (^pagingViewSwitchBlock)(NSInteger switchIndex);

/**
 *  实例化横向分页控件
 *
 *  @param headerView     tableHeaderView
 *  @param headerHeight   tableHeaderView高度
 *  @param segmentButtons 切换按钮的数组
 *  @param segmentHeight  切换视图高度
 *  @param contentViews   内容视图的数组
 *
 *  @return  控件对象
 */
+ (CYUIView_HorizontalPagingView *)pagingViewWithFrame:(CGRect) rect contentViews:(NSArray *)contentViews;
- (void)showPagingViewAtIndex:(NSInteger)index;

@end

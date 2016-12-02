//
//  CYUIView_manifyImage.m
//  KHMall
//
//  Created by 198 on 16/6/13.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUIView_manifyImage.h"
@interface CYUIView_manifyImage()<UIScrollViewDelegate>{
    UIScrollView *scrollview;
}
@end

@implementation CYUIView_manifyImage
- (void)addSubviews
{
    [super addSubviews];
    _isResetInitial = YES;
    scrollview = [[UIScrollView alloc]initWithFrame:self.bounds];
    scrollview.delegate = self;
    scrollview.minimumZoomScale = 1;
    scrollview.maximumZoomScale = 20;
    scrollview.bounces = false;
    scrollview.zoomScale = 1;
    [self addSubview:scrollview];
    _imageView = [[UIImageView alloc]init];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;//UIViewContentModeScaleToFill;
    [scrollview addSubview:_imageView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gesture_dismissView)];
    tap.numberOfTapsRequired = 1;
    tap.cancelsTouchesInView = false;
    [scrollview addGestureRecognizer:tap];
}
-(void)gesture_dismissView{
    if (self.block_dismiss) {
        self.block_dismiss(self);
    }
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    //确保图像在屏幕中心
    CGFloat xcenter = scrollView.center.x;
    CGFloat ycenter = scrollView.center.y;
    
    xcenter = scrollView.contentSize.width > scrollView.frame.size.width ? scrollView.contentSize.width/2 : xcenter;
    
    ycenter = scrollView.contentSize.height > scrollView.frame.size.height ? scrollView.contentSize.height/2 : ycenter;
    [_imageView setCenter:CGPointMake(xcenter, ycenter)];
}
- (void)reloadFrames{
    CGRect frame = self.frame;
    if(_imageView.image){
        
        CGSize imageSize = _imageView.image.size;
        CGRect imageFrame = CGRectMake(0, 0, imageSize.width, imageSize.height);
        
        if (frame.size.width <= frame.size.height) { // 如果ScrollView的 宽 <= 高
            // 将图片的 宽 设置成 ScrollView的宽  ,高度 等比率 缩放
            CGFloat ratio = frame.size.width / imageFrame.size.width;
            imageFrame.size.height = imageFrame.size.height * ratio;
            imageFrame.size.width = frame.size.width;
            
        }else{
            
            // 将图片的 宽 设置成 ScrollView的宽  ,高度 等比率 缩放
            CGFloat ratio = frame.size.height / imageFrame.size.height;
            imageFrame.size.width = imageFrame.size.width*ratio;
            imageFrame.size.height = frame.size.height;
        }
        
        // 设置 imageView 的 frame
        _imageView.frame = imageFrame;
        
        // scrollView 的滚动区域
        scrollview.contentSize = _imageView.frame.size;
        
        // 将 scrollView.contentSize 赋值为 图片的大小. 再获取 图片的中心点
        _imageView.center = [self centerOfScrollViewContent:scrollview];
        
        // 获取 ScrollView 高 和 图片 高 的 比率
        CGFloat maxScale = frame.size.height / imageFrame.size.height;
        // 获取 宽度的比率
        CGFloat widthRadit = frame.size.width / imageFrame.size.width;
        
        // 取出 最大的 比率
        maxScale = widthRadit > maxScale?widthRadit:maxScale;
        // 如果 最大比率 >= 2 倍 , 则取 最大比率 ,否则去 2 倍
        maxScale = maxScale > 2?maxScale:2;
        
        // 设置 scrollView的 最大 和 最小 缩放比率
        scrollview.minimumZoomScale = 0.6;
        scrollview.maximumZoomScale = maxScale;
        
        // 设置 scrollView的 原始缩放大小
        scrollview.zoomScale = 1.0f;
        
    }else{
        frame.origin = CGPointZero;
        _imageView.frame = frame;
        scrollview.contentSize = _imageView.frame.size;
    }
    scrollview.contentOffset = CGPointZero;
}
- (CGPoint)centerOfScrollViewContent:(UIScrollView *)scrollView{
    // scrollView.bounds.size.width > scrollView.contentSize.width : 说明:scrollView 大小 > 图片 大小
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    
    CGPoint actualCenter = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                       scrollView.contentSize.height * 0.5 + offsetY);
    return actualCenter;
}
- (void)setIsResetInitial:(BOOL)isResetInitial
{
    _isResetInitial = isResetInitial;
    [scrollview setZoomScale:1.0f animated:NO];
    [self reloadFrames];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    scrollview.frame = self.bounds;
    CGFloat width = CGRectGetWidth(self.bounds) >= CGRectGetHeight(self.bounds)?CGRectGetHeight(self.bounds):CGRectGetWidth(self.bounds);
    _imageView.frame = CGRectMake(CGRectGetMidX(scrollview.bounds) - width/2,CGRectGetMidY(scrollview.bounds) - width/2, width, width);
    [self reloadFrames];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

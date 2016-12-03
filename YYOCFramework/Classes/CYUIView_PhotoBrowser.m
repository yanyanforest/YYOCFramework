//
//  CYUIView_PhotoBrowser.m
//  KHMall
//
//  Created by yanyan on 16/9/19.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUIView_PhotoBrowser.h"
#import "CYUICVCell_base.h"
#import "CYUIView_manifyImage.h"
#import "YYOCFramework.h"
@interface CYUICVCell_PhotoBrowser : CYUICVCell_base
@property(nonatomic, strong)CYUIView_manifyImage *photoBrowerView;
@property(nonatomic,strong) CYBlock_Object block_dismiss;
@end
@implementation CYUICVCell_PhotoBrowser

- (void)addSubviews
{
    [super addSubviews];
    __weak typeof(self) weakSelf = self;
    self.contentView.backgroundColor = [UIColor clearColor];
    _photoBrowerView = [[CYUIView_manifyImage alloc]init];
    [self.contentView addSubview:_photoBrowerView];
    [_photoBrowerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);

    }];
    _photoBrowerView.block_dismiss = ^(id sender){
        if (weakSelf.block_dismiss) {
            weakSelf.block_dismiss(sender);
        }
    };
}
- (void)setObject:(id)object
{
    [super setObject:object];
    [_photoBrowerView.imageView sd_setImageWithURL:[NSURL URLWithString:object] placeholderImage:nil];
    _photoBrowerView.isResetInitial = YES;
}

@end
@interface CYUIView_PhotoBrowser()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    
}
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong)UIPageControl *pageControl;// UIPageControl
@property(nonatomic,strong)UILabel *numLabel;// 展示 1 / 9 图片数
@property(nonatomic,assign)BOOL isFirstShow;// 是否是第一次 展示
@property(nonatomic,assign)CGFloat contentOffsetX; // 偏移量
@property(nonatomic,assign)NSInteger page; // 页数
@end

@implementation CYUIView_PhotoBrowser
- (void)addSubviews
{
    [super addSubviews];
    _isShowPageNumView = NO;
    _isShowPageControl = NO;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setItemSize:self.bounds.size];
    [layout setMinimumInteritemSpacing:0];
    [layout setMinimumLineSpacing:0];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    // 2.create collectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    [self.collectionView setPagingEnabled:YES];
    [self.collectionView setBounces:YES]; // 设置 collectionView的 弹簧效果,这样拉最后一张图时会有拉出来效果,再反弹回去
    
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    
    [self.collectionView setShowsHorizontalScrollIndicator:NO];
    [self.collectionView setShowsVerticalScrollIndicator:NO];
    [self.collectionView setDecelerationRate:0];
    [self.collectionView registerClass:[CYUICVCell_PhotoBrowser class] forCellWithReuseIdentifier:@"cell"];
    [self addSubview:self.collectionView];
    // pageControl
    self.pageControl = [[UIPageControl alloc] init];
    [self.pageControl setCurrentPage:_currentIndex];
    [self.pageControl setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];
    [self.pageControl setFrame:(CGRect){{0,self.bounds.size.height - 50},{self.bounds.size.width,30}}];
    [self.pageControl setHidden:!_isShowPageNumView];
    [self addSubview:self.pageControl];
    self.numLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 25, self.bounds.size.width, 25)];
    [self.numLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [self.numLabel setTextColor:[UIColor whiteColor]];
    [self.numLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.numLabel];
}
- (void)setCurrentIndex:(NSInteger)currentIndex {
    _currentIndex = currentIndex;
    if (currentIndex > self.itemsArr.count) {
        return;
    }
    [_numLabel setText:[NSString stringWithFormat:@"%ld / %lu",(long)self.currentIndex + 1,(unsigned long)self.itemsArr.count]];;
    [self.collectionView setContentOffset:(CGPoint){_currentIndex * (self.bounds.size.width),0} animated:NO];
    [self.pageControl setCurrentPage:_currentIndex];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _itemsArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    __weak typeof(self) weakSelf = self;
    CYUICVCell_PhotoBrowser *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    id items = _itemsArr[indexPath.row];
    cell.object = items;
    cell.block_dismiss = ^(id sender) {
        [weakSelf dissmissView:sender];
    };
    return cell;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _currentIndex = scrollView.contentOffset.x / (self.bounds.size.width);
    
    CGFloat scrollViewWidth = scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    NSInteger page = (x + scrollViewWidth / 2) / scrollViewWidth;
//    if(_page != page){
        _page = page;
        if(_page + 1 <= _itemsArr.count){
            [_numLabel setText:[NSString stringWithFormat:@"%ld / %lu",(long)self.currentIndex + 1,(unsigned long)self.itemsArr.count]];;
            [_pageControl setCurrentPage:_page];
        }
//    }
}
- (void)dissmissView:(id)sender{
    if (self.block_dismiss) {
        self.block_dismiss(sender);
    }
}
- (void)setItemsArr:(NSArray *)itemsArr
{
    _itemsArr = itemsArr;
    [_numLabel setText:[NSString stringWithFormat:@"%ld / %lu",(long)self.currentIndex + 1,(unsigned long)self.itemsArr.count]];;
    [self.pageControl setNumberOfPages:_itemsArr.count];
    [self.collectionView setContentOffset:(CGPoint){_currentIndex * (self.bounds.size.width),0} animated:NO];
    [self.pageControl setCurrentPage:_currentIndex];

}
- (void)setIsShowPageControl:(BOOL)isShowPageControl
{
    _isShowPageControl = isShowPageControl;
    [_pageControl setHidden:!isShowPageControl];
}
- (void)setIsShowPageNumView:(BOOL)isShowPageNumView
{
    _isShowPageNumView = isShowPageNumView;
    [_numLabel setHidden:!isShowPageNumView];
    [_numLabel setText:[NSString stringWithFormat:@"%ld / %lu",(long)self.currentIndex + 1,(unsigned long)self.itemsArr.count]];;

}
- (void)dismiss
{
    [self removeFromSuperview];
}
- (void)present
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [self setFrame:window.bounds];
    [window addSubview:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

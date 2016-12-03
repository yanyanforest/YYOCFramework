
//
//  CYUIView_HorizontalPagingView.m
//  KHMall
//
//  Created by 198 on 16/6/27.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUIView_HorizontalPagingView.h"
@interface CYUIView_HorizontalPagingView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionViewFlowLayout *layout;
}
@property (nonatomic, strong) UICollectionView *horizontalCollectionView;
@property (nonatomic, strong) NSArray *contentViews;
@property (nonatomic, weak) UIScrollView *currentScrollView;
@property (nonatomic, assign) BOOL isSwitching;
@end

@implementation CYUIView_HorizontalPagingView
@synthesize horizontalCollectionView = _horizontalCollectionView;
//static void *HHHorizontalPagingViewScrollContext = &HHHorizontalPagingViewScrollContext;

static void *HHHorizontalPagingViewPanContext    = &HHHorizontalPagingViewPanContext;
static NSString *pagingCellIdentifier            = @"PagingCellIdentifier";

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing          = 0.0;
        layout.minimumInteritemSpacing     = 0.0;
        layout.scrollDirection             = UICollectionViewScrollDirectionHorizontal;
        layout.headerReferenceSize = CGSizeZero;
        //        self.horizontalCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame)) collectionViewLayout:layout];
        self.horizontalCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        self.horizontalCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [self.horizontalCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:pagingCellIdentifier];
        self.horizontalCollectionView.backgroundColor = [UIColor clearColor];
        self.horizontalCollectionView.dataSource = self;
        self.horizontalCollectionView.delegate = self;
        self.horizontalCollectionView.pagingEnabled = YES;
        self.horizontalCollectionView.showsHorizontalScrollIndicator = NO;
//        self.horizontalCollectionView.canCancelContentTouches = YES;
//        self.horizontalCollectionView.delaysContentTouches = NO;
        [self addSubview:self.horizontalCollectionView];
        
    }
    return self;
}
+ (CYUIView_HorizontalPagingView *)pagingViewWithFrame:(CGRect)rect contentViews:(NSArray *)contentViews{
    CYUIView_HorizontalPagingView *pagingView = [[CYUIView_HorizontalPagingView alloc] initWithFrame:rect];
    pagingView.contentViews = contentViews;
    [pagingView configureContentView];
    return pagingView;
}

-(void)showPagingViewAtIndex:(NSInteger)index
{
//    [self.horizontalCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    [self.horizontalCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    self.currentScrollView = self.contentViews[index];

}
- (void)configureContentView {
    for(UIScrollView *v in self.contentViews) {

        [v setContentInset:UIEdgeInsetsMake(0, 0, v.contentInset.bottom, 0)];
        v.alwaysBounceVertical = YES;
        v.showsVerticalScrollIndicator = NO;
        [v.panGestureRecognizer addObserver:self forKeyPath:NSStringFromSelector(@selector(state)) options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:&HHHorizontalPagingViewPanContext];
//        [v addObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset)) options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:&HHHorizontalPagingViewScrollContext];

    }
    self.currentScrollView = [self.contentViews firstObject];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(__unused id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    if(context == &HHHorizontalPagingViewPanContext) {
        
        self.horizontalCollectionView.scrollEnabled = YES;
//        UIGestureRecognizerState state = [change[NSKeyValueChangeNewKey] integerValue];
//        [self.currentScrollView setContentOffset:self.currentScrollView.contentOffset animated:NO];

    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.contentViews count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    self.isSwitching = YES;
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:pagingCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    for(UIView *v in cell.contentView.subviews) {
        [v removeFromSuperview];
    }
    [cell.contentView addSubview:self.contentViews[indexPath.row]];
    
    UIScrollView *v = self.contentViews[indexPath.row];
    CGFloat scrollViewHeight = v.frame.size.height;
    v.translatesAutoresizingMaskIntoConstraints = NO;
    [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:scrollViewHeight == 0 ? 0 : -(cell.contentView.frame.size.height-v.frame.size.height)]];
    //    [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:scrollViewHeight]];
    [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    self.currentScrollView = v;
    return cell;
    
}



#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentPage = scrollView.contentOffset.x/[[UIScreen mainScreen] bounds].size.width;
    if(self.pagingViewSwitchBlock) {
        self.pagingViewSwitchBlock(currentPage);
    }
    self.currentScrollView = self.contentViews[currentPage];
}

- (void)dealloc {
    for(UIScrollView *v in self.contentViews) {
        [v.panGestureRecognizer removeObserver:self forKeyPath:NSStringFromSelector(@selector(state)) context:&HHHorizontalPagingViewPanContext];
    }
}

@end

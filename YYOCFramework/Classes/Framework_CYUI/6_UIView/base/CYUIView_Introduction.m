//
//  CYUIView_Introduction.m
//  KHMall
//
//  Created by 198 on 16/6/17.
//  Copyright © 2016年 198. All rights reserved.
//
#define kScreenBounds [UIScreen mainScreen].bounds
#import "CYUICVCell_base.h"

@interface CYGuideViewCell : CYUICVCell_base

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *button;

@end

@implementation CYGuideViewCell


- (void)addSubviews{
    [super addSubviews];

    self.layer.masksToBounds = YES;
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frame = self.bounds;
    self.imageView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:self.imageView];
    
    //    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //    button.hidden = YES;
    //    [button setFrame:CGRectMake(0, 0, 200, 44)];
    //    [button setTitle:@"Next" forState:UIControlStateNormal];
    //    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [button.layer setCornerRadius:5];
    //    [button.layer setBorderColor:[UIColor grayColor].CGColor];
    //    [button.layer setBorderWidth:1.0f];
    //    [button setBackgroundColor:[UIColor whiteColor]];
    //
    //    self.button = button;
    //
    //    [self.contentView addSubview:self.button];
    //
    //    [self.button setCenter:CGPointMake(kScreenBounds.size.width / 2, kScreenBounds.size.height - 100)];
}
- (CGSize)adapterSizeImageSize:(CGSize)is compareSize:(CGSize)cs
{
    CGFloat w = cs.width;
    CGFloat h = cs.width / is.width * is.height;
    
    if (h < cs.height) {
        w = cs.height / h * w;
        h = cs.height;
    }
    return CGSizeMake(w, h);
}
-(void)setObject:(id)object
{
    [super setObject:object];
    self.imageView.image = [UIImage imageNamed:object];
//    [self adapterSizeImageSize:self.imageView.image.size compareSize:self.bounds.size];
}

@end

#import "CYUIView_Introduction.h"
@interface CYUIView_Introduction()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionview;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *images;

@end
@implementation CYUIView_Introduction

-(void)addSubviews{
    self.cellIdentifier = @"cell";
    if (_collectionview == nil) {
        
        CGRect screen = [UIScreen mainScreen].bounds;
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.itemSize = screen.size;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionview = [[UICollectionView alloc] initWithFrame:screen collectionViewLayout:layout];
        _collectionview.bounces = NO;
        _collectionview.backgroundColor = [UIColor whiteColor];
        _collectionview.showsHorizontalScrollIndicator = NO;
        _collectionview.showsVerticalScrollIndicator = NO;
        _collectionview.pagingEnabled = YES;
        _collectionview.dataSource = self;
        _collectionview.delegate = self;
        
        [_collectionview registerClass:[CYGuideViewCell class] forCellWithReuseIdentifier:_cellIdentifier];
        [self addSubview:_collectionview];
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.frame = CGRectMake(0, 0, kScreenBounds.size.width, 44.0f);
        _pageControl.center = CGPointMake(kScreenBounds.size.width / 2, kScreenBounds.size.height - 50);
//        _pageControl.center = CGPointMake(kScreenBounds.size.width / 2, kScreenBounds.size.height - 60);
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        [self addSubview:_pageControl];
        _guideButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _guideButton.hidden = YES;
        
        [_guideButton setFrame:CGRectMake(0, 0, 200, 44)];
        [_guideButton setTitle:@"现在体验" forState:UIControlStateNormal];
        [_guideButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_guideButton.layer setCornerRadius:5];
        [_guideButton.layer setBorderColor:[UIColor whiteColor].CGColor];
        [_guideButton.layer setBorderWidth:1.0f];
        [_guideButton setBackgroundColor:[UIColor whiteColor]];
//        [_guideButton setCenter:CGPointMake(kScreenBounds.size.width / 2, kScreenBounds.size.height - 100)];
        [_guideButton setCenter:CGPointMake(kScreenBounds.size.width / 2, kScreenBounds.size.height - 80)];

        [_guideButton addTarget:self action:@selector(action_guideButton:) forControlEvents:UIControlEventTouchUpInside];

    }
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.images count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CYUICVCell_base *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellIdentifier forIndexPath:indexPath];
    
    cell.object = [self.images objectAtIndex:indexPath.row];
    if (indexPath.row == self.images.count - 1) {
        [_guideButton setHidden:NO];
        [cell addSubview:_guideButton];
    } else {
        [_guideButton setHidden:YES];
//        [_guideButton removeFromSuperview];
    }
    
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    self.pageControl.currentPage = (scrollView.contentOffset.x / kScreenBounds.size.width);
    if (self.pageControl.currentPage == self.images.count - 1) {
        [_guideButton setHidden:NO];
    } else {
        [_guideButton setHidden:YES];
    }
}

- (void)showGuideViewWithImagesData:(NSArray *)images {
    self.images = images;
    self.pageControl.numberOfPages = images.count;
    [self.collectionview reloadData];
}
- (void)action_guideButton:(id)sender {
    if (self.block_guideClick) {
        self.block_guideClick(sender);
    }
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

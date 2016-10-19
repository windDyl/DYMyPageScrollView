//
//  ViewController.m
//  DYMyPageScrollView
//
//  Created by Ethank on 2016/10/17.
//  Copyright © 2016年 DY. All rights reserved.
//

#import "ViewController.h"
#import "DYPageScrollView.h"
#import "DYPageCell.h"

#define Width [UIScreen mainScreen].bounds.size.width


@interface ViewController ()<DYPageScrollViewDelegate, DYPageScrollViewDataSource>
@property (nonatomic, strong)NSMutableArray *imageArray;
@property (nonatomic, strong)DYPageScrollView *pageScrollView;
@end

@implementation ViewController
- (void)dealloc {
    
    [self.pageScrollView stopTimer];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    for (int index = 0; index < 5; index++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"ad%zd",index+1]];
        [self.imageArray addObject:image];
    }
    
    [self setupViews];
}


- (void)setupViews {
    self.pageScrollView = [[DYPageScrollView alloc] initWithFrame:CGRectMake(0, 8, Width, (Width - 84) * 9 / 16 + 24)];
    _pageScrollView.backgroundColor = [UIColor whiteColor];
    _pageScrollView.delegate = self;
    _pageScrollView.dataSource = self;
    _pageScrollView.orginPageCount = self.imageArray.count;
    _pageScrollView.isOpenAutoScroll = YES;
    _pageScrollView.minimumPageAlpha = 0;
    
    [self.view addSubview:_pageScrollView];
    [_pageScrollView reloadData];
}
#pragma mark DYPageScrollViewDataSource
- (NSInteger)numberOfPagesInPageScrollView:(DYPageScrollView *)pageScrollView {
    
    return self.imageArray.count;
}

- (UIView *)pageScrollView:(DYPageScrollView *)pageScrollView cellForPageAtIndex:(NSInteger)index{
    
    DYPageCell *bannerView = (DYPageCell *)[pageScrollView dequeueReusableCell];
    if (!bannerView) {
        bannerView = [[DYPageCell alloc] initWithFrame:CGRectMake(60, 0, Width - 120, (Width - 120) * 9 / 16)];
        bannerView.layer.masksToBounds = YES;
    }
    
    //在这里下载网络图片
    //[bannerView.mainImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:hostUrlsImg,imageDict[@"img"]]] placeholderImage:[UIImage imageNamed:@""]];
    bannerView.mainImageView.image = self.imageArray[index];
    
    return bannerView;
}

- (void)didScrollToPage:(NSInteger)pageNumber inPageScrollView:(DYPageScrollView *)pageScrollView {
    
    NSLog(@"TestViewController 滚动到了第%zd页",pageNumber);
}
#pragma mark-DYPageScrollViewDelegate
/**
 *  单个子控件的Size
 *
 */
- (CGSize)sizeForPageInPageScrollView:(DYPageScrollView *)pageScrollView {
    return CGSizeMake(Width - 120, (Width - 120) * 9 / 16);
}

/**
 *  点击了第几个cell
 *
 */
- (void)didSelectCell:(UIView *)subView withSubViewIndex:(NSInteger)subIndex {
    NSLog(@"点击了第%ld张图",(long)subIndex + 1);
}
#pragma mark --懒加载
- (NSMutableArray *)imageArray {
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}
@end

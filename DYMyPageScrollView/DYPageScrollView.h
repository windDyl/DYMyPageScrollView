//
//  DYPageScrollView.h
//  DYMyPageScrollView
//
//  Created by Ethank on 2016/10/17.
//  Copyright © 2016年 DY. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DYPageScrollView;

typedef NS_ENUM(NSInteger, DYPageScrollViewOrientation) {
    DYPageScrollViewOrientationHorizontal = 0,
    DYPageScrollViewOrientationVertical
};

@protocol  DYPageScrollViewDelegate<NSObject>

/**
 *  单个子控件的Size
 *
 */
- (CGSize)sizeForPageInPageScrollView:(DYPageScrollView *)pageScrollView;

@optional
/**
 *  滚动到了某一列
 *
 */
- (void)didScrollToPage:(NSInteger)pageNumber inPageScrollView:(DYPageScrollView *)pageScrollView;

/**
 *  点击了第几个cell
 *
 */
- (void)didSelectCell:(UIView *)subView withSubViewIndex:(NSInteger)subIndex;

@end


@protocol DYPageScrollViewDataSource <NSObject>

/**
 *  返回显示View的个数
 *
 */
- (NSInteger)numberOfPagesInPageScrollView:(DYPageScrollView *)pageScrollView;

/**
 *  给某一列设置属性
 *
 */
- (UIView *)pageScrollView:(DYPageScrollView *)pageScrollView cellForPageAtIndex:(NSInteger)index;
@end


@interface DYPageScrollView : UIView
/**
 *  默认为横向
 */
@property (nonatomic,assign) DYPageScrollViewOrientation orientation;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic,assign) BOOL needsReload;

/**
 *  一页的尺寸
 */
@property (nonatomic,assign) CGSize pageSize;
/**
 *  总页数
 */
@property (nonatomic,assign) NSInteger pageCount;

@property (nonatomic,strong) NSMutableArray *cells;
@property (nonatomic,assign) NSRange visibleRange;
/**
 *  如果以后需要支持reuseIdentifier，这边就得使用字典类型了
 */
@property (nonatomic,strong) NSMutableArray *reusableCells;

@property (nonatomic,weak) id <DYPageScrollViewDataSource> dataSource;
@property (nonatomic,weak) id <DYPageScrollViewDelegate>   delegate;

/**
 *  指示器
 */
@property (nonatomic,retain)  UIPageControl *pageControl;

/**
 *  非当前页的透明比例
 */
@property (nonatomic, assign) CGFloat minimumPageAlpha;

/**
 *  非当前页的缩放比例
 */
@property (nonatomic, assign) CGFloat minimumPageScale;

/**
 *  是否开启自动滚动,默认为开启
 */
@property (nonatomic, assign) BOOL isOpenAutoScroll;

/**
 *  当前是第几页
 */
@property (nonatomic, assign, readonly) NSInteger currentPageIndex;

/**
 *  定时器
 */
@property (nonatomic, weak) NSTimer *timer;

/**
 *  自动切换视图的时间,默认是5.0
 */
@property (nonatomic, assign) CGFloat autoTime;

/**
 *  原始页数
 */
@property (nonatomic, assign) NSInteger orginPageCount;

/**
 *  刷新视图
 */
- (void)reloadData;

/**
 *  获取可重复使用的Cell
 *
 */
- (UIView *)dequeueReusableCell;

/**
 *  滚动到指定的页面
 *
 */
- (void)scrollToPage:(NSUInteger)pageNumber;

/**
 *  关闭定时器,关闭自动滚动
 */
- (void)stopTimer;

@end

//
//  DYPageCell.m
//  DYMyPageScrollView
//
//  Created by Ethank on 2016/10/17.
//  Copyright © 2016年 DY. All rights reserved.
//

#import "DYPageCell.h"

@implementation DYPageCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubview:self.mainImageView];
    }
    
    return self;
}

- (UIImageView *)mainImageView {
    
    if (_mainImageView == nil) {
        _mainImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _mainImageView.userInteractionEnabled = YES;
        _mainImageView.backgroundColor = [UIColor orangeColor];
    }
    return _mainImageView;
}

@end

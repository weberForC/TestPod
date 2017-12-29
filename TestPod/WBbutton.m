//
//  WBbutton.m
//  TestPod
//
//  Created by juanMac on 2017/7/7.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import "WBbutton.h"

@implementation WBbutton

+ (instancetype)buttonWithType:(UIButtonType)buttonType
{
    WBbutton *button = [super buttonWithType:buttonType];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.font = [UIFont systemFontOfSize:23];
    
    button.imageView.backgroundColor = [UIColor purpleColor];
    
    return button;
}

/**什么也不做就可以取消系统按钮的高亮状态*/
- (void)setHighlighted:(BOOL)highlighted{
    //    [super setHighlighted:highlighted];
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((contentRect.size.width - contentRect.size.height * 0.5) / 2, contentRect.size.height * 0.5, contentRect.size.height * 0.5, contentRect.size.height * 0.5);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((contentRect.size.width - contentRect.size.height * 0.8) / 2, 0, contentRect.size.height * 0.8, contentRect.size.height * 0.8);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

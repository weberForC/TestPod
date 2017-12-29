//
//  WBtabbar.m
//  TestPod
//
//  Created by juanMac on 2017/7/7.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import "WBtabbar.h"

@interface WBtabbar ()

@property (nonatomic , strong) WBbutton *selectedButton;

@end

@implementation WBtabbar

- (void)addSubButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    WBbutton *button = [WBbutton buttonWithType:UIButtonTypeCustom];
    button.image = image;
    button.selectedImage = selectedImage;
    [button setTitle:title forState:UIControlStateNormal];
    [self addSubview:button];
    
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    if (self.subviews.count == 1) {
        [self clickAction:button];
    }
}

- (void)clickAction:(WBbutton *)sender
{
    self.selectedButton.selected = NO;
    self.selectedButton = sender;
    self.selectedButton.selected = YES;
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:selectIndex:)]) {
        [self.delegate tabBar:self selectIndex:sender.tag];
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger num = self.subviews.count;
    for (int i = 0; i < num; i++) {
        WBbutton *btn = self.subviews[i];
        btn.tag = i;
        btn.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 green:(arc4random() % 256) / 255.0 blue:(arc4random() % 256) / 255.0 alpha:1];
        CGFloat X = i * self.bounds.size.width / num;
        CGFloat Y = 2;
        CGFloat width = self.bounds.size.width / num - 10;
        CGFloat height = self.bounds.size.height - 4;
        btn.frame = CGRectMake(X, Y, width, height);
        
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

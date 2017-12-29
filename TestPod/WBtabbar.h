//
//  WBtabbar.h
//  TestPod
//
//  Created by juanMac on 2017/7/7.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBbutton.h"
@class WBtabbar;

@protocol WBTabBarDelegate <NSObject>

- (void)tabBar:(WBtabbar *)tabbar selectIndex:(NSInteger)index;

@end

@interface WBtabbar : UIView

@property (nonatomic , weak) id<WBTabBarDelegate> delegate;

- (void)addSubButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title;

@end

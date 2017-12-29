//
//  WBTabbarController.h
//  TestPod
//
//  Created by juanMac on 2017/7/7.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBTabbarController : UITabBarController

@property (nonatomic , strong) NSArray *imageArray , *selectedImageArray , *titleArray;

- (instancetype)initWithArray:(NSArray *)titleArray;

@end

//
//  WBTabbarController.m
//  TestPod
//
//  Created by juanMac on 2017/7/7.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import "WBTabbarController.h"
#import "WBtabbar.h"
#import "WBbutton.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "FifthViewController.h"
#import "SixViewController.h"
#import "HtmlViewController.h"
#import "BaseNavigationController.h"

@interface WBTabbarController ()<WBTabBarDelegate>

@end

@implementation WBTabbarController

- (instancetype)initWithArray:(NSArray *)titleArray
{
    if (self == [super init]) {
        _titleArray = titleArray;
        [self initViews];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar resignFirstResponder];
    
}

- (void)initViews
{
    CGRect bounds = self.tabBar.bounds;
    WBtabbar *tabbar = [[WBtabbar alloc] init];
    tabbar.frame = bounds;
    tabbar.backgroundColor = [UIColor redColor];
    tabbar.delegate = self;
    [tabbar becomeFirstResponder];
    [self.tabBar addSubview:tabbar];
    
    _imageArray = @[@"",@"",@"",@""];
    _selectedImageArray = @[@"",@"",@"",@""];
    
    for (int i = 0; i < self.imageArray.count; i++) {
        UIImage *image = self.imageArray[i];
        UIImage *selectedImage = self.selectedImageArray[i];
        NSString *title = _titleArray[i];
        [tabbar addSubButtonWithImage:image selectedImage:selectedImage title:title];
    }
}
- (void)tabBar:(WBtabbar *)tabbar selectIndex:(NSInteger)index
{
    NSLog(@"%ld" , index);
    self.selectedIndex = index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"tabbarIndex = %@" , item.badgeValue);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

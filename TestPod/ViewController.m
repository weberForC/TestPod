//
//  ViewController.m
//  TestPod
//
//  Created by juanMac on 2017/6/21.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import <ReactiveCocoa.h>
#import <objc/runtime.h>
#import "PerpleModel.h"

@interface ViewController ()

@property (nonatomic , strong) UIView *theView;
@property (nonatomic , strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.title = @"首页";
    
    UIView * v  = [UIView new];
    UIView * v1 = [UIView new];
    UIView * v2 = [UIView new];
    UIView * v3 = [UIView new];
    v.backgroundColor  =[ UIColor blackColor];
    v1.backgroundColor =[ UIColor whiteColor];
    v2.backgroundColor =[ UIColor whiteColor];
    v3.backgroundColor =[ UIColor whiteColor];
    [self.view addSubview:v];
    [self.view addSubview:v1];
    [self.view addSubview:v2];
    [self.view addSubview:v3];
    self.theView = v3;
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(100, 20, 100, 20));
    }];
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(v.mas_centerY);
        make.left.equalTo(v.mas_left).with.offset(10);
        make.right.equalTo(v2.mas_left).with.offset(-10);
        make.height.equalTo(180);
        make.width.equalTo(v2);
    }];
    [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(v.mas_centerY);
        make.left.equalTo(v1.mas_right).with.offset(10);
        make.right.equalTo(v.mas_right).with.offset(-10);
        make.height.equalTo(v1.mas_height);
        make.width.equalTo(v1);
    }];
    [v3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.top.equalTo(v1.mas_bottom).with.offset(10);
        make.height.equalTo(50);
        make.width.equalTo(self.view).multipliedBy(.2);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [v3 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.centerX);
            make.top.equalTo(v1.mas_bottom).with.offset(10);
            make.height.equalTo(50);
            make.width.equalTo(self.view).multipliedBy(.5);
        }];
    });
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpAction)];
    [v addGestureRecognizer:tap];
    
    
}

- (void)jumpAction
{
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    firstVC.title = @"FirstVC";
    firstVC.delegateSingal = [RACSubject subject];
    [firstVC.delegateSingal subscribeNext:^(id x) {
        NSLog(@"点击事件");
    }];
    [self.navigationController pushViewController:firstVC animated:YES];
}

- (void)setObj:(id)toObj fromObj:(id)fromObj
{
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([toObj class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t pro = propertyList[i];
        const char *name = property_getName(pro);
        NSString *key = [NSString stringWithUTF8String:name];
        if ([fromObj valueForKey:key]) {
            [toObj setValue:[fromObj valueForKey:key] forKey:key];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

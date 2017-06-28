//
//  FirstViewController.m
//  TestPod
//
//  Created by juanMac on 2017/6/27.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SAMLabel *label = [[SAMLabel alloc] initWithFrame:CGRectMake(10, 80, SCREEN_WIDTH - 20, 80)];
    [self.view addSubview:label];
    label.backgroundColor = [UIColor redColor];
    label.numberOfLines = 0;
    label.text = @"你好，label，这是一个伤心的故事，我居然不知道这个label存在的意义是什么。。。。";
    label.verticalTextAlignment = SAMLabelVerticalTextAlignmentBottom;
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

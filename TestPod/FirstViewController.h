//
//  FirstViewController.h
//  TestPod
//
//  Created by juanMac on 2017/6/27.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import "RootViewController.h"
#import <objc/runtime.h>


@interface FirstViewController : RootViewController

@property (nonatomic , strong) RACSubject *delegateSingal;

@end

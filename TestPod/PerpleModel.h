//
//  PerpleModel.h
//  TestPod
//
//  Created by juanMac on 2017/6/30.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PerpleModel : NSObject

@property (nonatomic , strong) NSString *name , *sex , *address , *company;

- (void)getNameAction;
- (void)getSexAction;
- (void)getAddressAction;

@end

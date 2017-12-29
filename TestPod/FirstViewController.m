//
//  FirstViewController.m
//  TestPod
//
//  Created by juanMac on 2017/6/27.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import "FirstViewController.h"
#import "HtmlViewController.h"
#import "PerpleModel.h"

@interface FirstViewController ()
{
    SAMTextField *text;
    SAMTextField *text1;
}

@property (nonatomic , strong) SAMTextField *textField , *textFiled1;



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
    
    text = [[SAMTextField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(label.frame) + 20, SCREEN_WIDTH - 20, 30)];
    [self.view addSubview:text];
    text.layer.borderWidth = 1;
    text.layer.borderColor = [[UIColor cyanColor] CGColor];
    text.placeholder = @"请输入账号";
    text.layer.cornerRadius = 5;
    text.layer.masksToBounds = YES;
    text.textAlignment = NSTextAlignmentCenter;
    
    text1 = [[SAMTextField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(text.frame) + 20, SCREEN_WIDTH - 20, 30)];
    [self.view addSubview:text1];
    text1.layer.borderWidth = 1;
    text1.layer.borderColor = [[UIColor cyanColor] CGColor];
    text1.placeholder = @"请输入密码";
    text1.layer.cornerRadius = 5;
    text1.layer.masksToBounds = YES;
    text1.textAlignment = NSTextAlignmentCenter;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, CGRectGetMaxY(text1.frame) + 20, SCREEN_WIDTH - 20, 40);
    [self.view addSubview:button];
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    [button setTitle:@"点击测试" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor groupTableViewBackgroundColor];
    button.userInteractionEnabled = NO;
    
    
    id signals = @[[text rac_textSignal],[text1 rac_textSignal]];
    [[RACSignal combineLatest:signals] subscribeNext:^(RACTuple *x) {
        
        NSString *textStr = [x first];
        NSString *str = [x second];
        if (textStr.length >= 6 && str.length >= 6) {
            button.backgroundColor = [UIColor cyanColor];
            button.userInteractionEnabled = YES;
        }else{
            button.backgroundColor = [UIColor groupTableViewBackgroundColor];
            button.userInteractionEnabled = NO;
        }
        
        NSLog(@"%@",x);
        
    }];
    
    [[text.rac_textSignal map:^id(id value) {
        NSLog(@"value = %@", value);
        return @1;
    }] subscribeNext:^(id x) {
        NSLog(@"x  =  %@", x);
    }];
    
    
    [[text1.rac_textSignal filter:^BOOL(id value) {
        return value;
    }] subscribeNext:^(id x) {
        
    }];
    
    RACSignal *signal111 = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"1"];
        [subscriber sendNext:@"2"];
        [subscriber sendNext:@"3"];
        [subscriber sendNext:@"4"];
        [subscriber sendNext:@"5"];
        [subscriber sendCompleted];
        return nil;
    }] skip:2];
    
    [signal111 subscribeNext:^(id x) {
        NSLog(@"Next = %@",x);
    } completed:^{
        
    }];
    
    
    NSDictionary *dict = @{@"name":@"xmg",@"age":@18};
    [dict.rac_sequence.signal subscribeNext:^(RACTuple *x) {
        
        // 解包元组，会把元组的值，按顺序给参数里面的变量赋值
        RACTupleUnpack(NSString *key,NSString *value) = x;
        
        // 相当于以下写法
        //        NSString *key = x[0];
        //        NSString *value = x[1];
        
        NSLog(@"key = %@ , value = %@",key,value);
        
    }];
    
    
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [button setSelected:!button.isSelected];
        if (button.isSelected) {
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        }else{
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        }
        NSLog(@"账号 ：%@ , 密码 ：%@",text.text , text1.text);
        if (self.delegateSingal) {
            [self.delegateSingal sendNext:nil];
        }
        
        HtmlViewController *htmlVC = [[HtmlViewController alloc] init];
        [self.navigationController pushViewController:htmlVC animated:YES];
        
        
    }]; 
    
    PerpleModel *perple1 = [[PerpleModel alloc] init];
    perple1.name = @"张三";
    perple1.sex = @"男";
    perple1.address = @"石家庄市";
    perple1.company = @"飓安冠软";
    
    PerpleModel *perple2 = [[PerpleModel alloc] init];
    
    NSLog(@"perple2 = %@ , %@",perple2.name , perple2.address);
    
//    [self setObj:perple2 fromObj:perple1];
    
    NSLog(@"perple2 = %@ , %@",perple2.name , perple2.address);
    
//    [self getMethedsName:button];
    
    
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

- (void)getMethedsName:(id)object
{
    unsigned int count;
    Method *methodList = class_copyMethodList([object class], &count);
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        SEL name = method_getName(method);
        const char *name1 = sel_getName(name);
        NSString *key = [NSString stringWithUTF8String:name1];
        NSLog(@"methodName = %@",key);
    }
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

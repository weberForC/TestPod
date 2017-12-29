//
//  HtmlViewController.m
//  TestPod
//
//  Created by juanMac on 2017/7/5.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import "HtmlViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface HtmlViewController ()<UIWebViewDelegate,AVCaptureMetadataOutputObjectsDelegate>
{
    UIWebView *htmlWeb;
}

@property (nonatomic , strong) AVCaptureSession *session;
@property (nonatomic , strong) AVCaptureVideoPreviewLayer *previewLayer;


@end

@implementation HtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.session = [[AVCaptureSession alloc] init];
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (input) {
        [self.session addInput:input];
    }else{
        return;
    }
    AVCaptureMetadataOutput *outPut = [[AVCaptureMetadataOutput alloc] init];
    [self.session addOutput:outPut];
    [outPut setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    [outPut setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    
    
    
//    NSString *_urlStr = @"https://www.baidu.com";
//    htmlWeb = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    htmlWeb.backgroundColor = [UIColor cyanColor];
//    htmlWeb.scrollView.showsVerticalScrollIndicator = NO;
//    htmlWeb.scrollView.bounces = NO;
//    htmlWeb.delegate = self;
//    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]];
//    [htmlWeb loadRequest:request];
//    [self.view addSubview:htmlWeb];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [htmlWeb reload];
//    });
    
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    for (AVMetadataMachineReadableCodeObject *metadata in metadataObjects) {
        if ([metadata.type isEqualToString:AVMetadataObjectTypeQRCode]) {
            
            
        }
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
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

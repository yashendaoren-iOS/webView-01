//
//  ViewController.m
//  webView交互
//
//  Created by 王立震 on 17/4/5.
//  Copyright © 2017年 王立震. All rights reserved.
//

#import "ViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIWebViewDelegate>{

    UIWebView *_webView;
    UILabel *label;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatView];

}


- (void)creatView {
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    _webView.backgroundColor = [UIColor grayColor];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    NSURL *webUrl = [NSURL fileURLWithPath:htmlPath];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:webUrl
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:10];
    [_webView loadRequest:request];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 410, kWidth-60, 30)];
    [btn setTitle:@"原生按钮改变webView的视图" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(doSomeThing) forControlEvents:UIControlEventTouchUpInside];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 450, kWidth, 30)];
    label.backgroundColor = [UIColor purpleColor];
    label.text = @"原生按钮";
    [self.view addSubview:label];
}

- (void)doSomeThing{
    [_webView stringByEvaluatingJavaScriptFromString:@"changeView('点击l原生按钮,这一句话就是传进来的参数')"];
}

#pragma mark- UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSLog(@"request: %@",request.URL.host);
    
    if ([request.URL.host isEqualToString:@"hello"]) {
        
        label.text = [NSString stringWithFormat:@"webView传出来的参数是：%@", request.URL.host];
        label.backgroundColor = [UIColor yellowColor];
    }
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{

}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

}


@end

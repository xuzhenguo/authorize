//
//  LoginViewController.m
//  001新浪微博
//
//  Created by MS on 15/9/8.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登陆";
    
    
    UIBarButtonItem *cancelLogin = [[UIBarButtonItem alloc]initWithTitle:@"取消登陆" style:UIBarButtonItemStylePlain target:self action:@selector(cancelLogin:)];
    self.navigationItem.leftBarButtonItem = cancelLogin;
    
// 创建加载界面
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDHT, SCREEN_HEIGHT)];
    webView.delegate = self;
    
//    获取授权Url完整版     help2为帮助类可以获取完整版url
    NSURL *authorizeUrl = [help2 getAuthorizeURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:authorizeUrl];
    
//    请求登陆界面
    [webView loadRequest:request];
    
//    把请求界面添加当前视图
    [self.view addSubview:webView];
    
}
-(void)cancelLogin:(UIBarButtonItem*)item
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- UIWebViewDelegate

//将要请求时回调
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
   
//    http://hi.baidu.com/jt_one#access_token=2.00l8yl8DjoxjvD61da9f77370DRrVU&remind_in=642951&expires_in=642951&uid=3158793345}
    NSString *path = [request.URL absoluteString];
    
   NSArray *array = [path componentsSeparatedByString:@"#"];
    
    if (array.count > 1) {
//        登陆成功
        
        NSNotification *noti = [NSNotification notificationWithName:LOGIN_SUCESS object:path];
        [[NSNotificationCenter defaultCenter]postNotification:noti];
        
        return NO;
    }
    
    NSLog(@"%@",path);
    
     return YES;
}
//开始请求时回调
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
//请求成功时回调
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}
//请求失败时回到
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}



@end

//
//  LoginViewController.h
//  001新浪微博
//
//  Created by MS on 15/9/8.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UIWebViewDelegate>
{
    UIWebView *webView;  //用来加载登陆界面
}
@end

//
//  help.h
//  001新浪微博
//
//  Created by MS on 15/9/8.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#ifndef _01_____help_h

#define _01_____help_h
#define SINA_APP_KEY                @"3601604349"
#define SINA_APP_SECRET             @"7894dfdd1fc2ce7cc6e9e9ca620082fb"
#define redirect_uri @"http://hi.baidu.com/jt_one"

//授权登录的接口
#define SINA_AUTHORIZE_SEVER  @"https://api.weibo.com/oauth2/authorize"

//粉丝列表
#define SINA_FRIENDSHIPS @"https://api.weibo.com/2/friendships/followers.json"
//发微博带文字
#define SINA_UPLOAD @"https://api.weibo.com/2/statuses/update.json"

#define SCREEN_WIDHT [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


// 登陆通知
#define LOGIN_SUCESS @"LOGIN_SUCESS"
#endif

//图片加载
#import "UIImageView+WebCache.h"

//用于存取token值
#define ACCESS_TOKEN @"ACCESS_TOKEN"
// token过期时间
#define EXPIRES_DATE  @"EXPIRES_DATE"
//当前登录的用户ID
#define UID @"UID"

//封装的下载数据类
#import "DownLoadData.h"



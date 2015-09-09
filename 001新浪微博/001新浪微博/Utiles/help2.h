//
//  help2.h
//  001新浪微博
//
//  Created by MS on 15/9/8.
//  Copyright (c) 2015年 MS. All rights reserved.
//
//帮助类返回拼接好的URL
#import <Foundation/Foundation.h>



@interface help2 : NSObject

//通过这个方法可以获取倒授权登陆的完整的拼接好的接口
+(NSURL*)getAuthorizeURL;


//通过这个方法获取粉丝Url
+(NSURL *)getFollowersUrl;

//传入字典可以返回拼接好的接口
+(NSURL *)connectWithAuthorizeUrl:(NSString *)baseUrl andParams:(NSDictionary *)params;

//剥离字符串
+(NSString *)getContentFof:(NSString *)key andPath:(NSString *)path;

//判断登陆是否过期
+(BOOL)isNeedToRefreshTheToken;

@end

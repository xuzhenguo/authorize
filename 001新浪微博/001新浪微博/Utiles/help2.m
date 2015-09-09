//
//  help2.m
//  001新浪微博
//
//  Created by MS on 15/9/8.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "help2.h"

@implementation help2

NSString *path;
+(NSURL *)getAuthorizeURL
{
//    一个字典 Key  value

//    基本URL
    
//    https://api.weibo.com/2/friendships/followers.json?source=3601604349
    
    NSDictionary *params = @{@"client_id":SINA_APP_KEY,@"redirect_uri":redirect_uri,@"display":@"mobile",@
                             "response_type":@"token"};
    
    NSURL *authorizeUrl = [help2 connectWithAuthorizeUrl:SINA_AUTHORIZE_SEVER andParams:params];
    
    return authorizeUrl;
}
#pragma mark -- 粉丝Url
+(NSURL *)getFollowersUrl
{
    NSString *access_token = [[NSUserDefaults standardUserDefaults]objectForKey:ACCESS_TOKEN];
    NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:UID];
    
    NSDictionary *params = @{@"access_token":access_token,@"uid":uid};
    
    NSURL *friendshipsUrl = [help2 connectWithAuthorizeUrl:SINA_FRIENDSHIPS andParams:params];
    
    return friendshipsUrl;

    
}


+(NSURL *)connectWithAuthorizeUrl:(NSString *)baseUrl andParams:(NSDictionary *)params
{
    if (params == nil) {
        return [NSURL URLWithString:baseUrl];
    }else{
        NSMutableArray *keyValues = [[NSMutableArray alloc]init];
        
        for (NSString *key in params.keyEnumerator) {
            NSString *keyAndValue = [NSString stringWithFormat:@"%@=%@",key,params[key]];
            
            [keyValues addObject:keyAndValue];
            NSLog(@"%@",keyAndValue);
        }
        NSLog(@"%@",keyValues);
        
        path = [keyValues componentsJoinedByString:@"&"];
        NSLog(@"%@",path);
        
        path = [NSString stringWithFormat:@"%@?%@",baseUrl,path];
        
        
    }
    
    
    return [NSURL URLWithString:path];
}
+(NSString *)getContentFof:(NSString *)key andPath:(NSString *)path
{
    
    if ([path containsString:key]) {
        
        NSRange needRange = [path rangeOfString:key];
        
        NSString *subStr = [path substringFromIndex:needRange.location];
        
        needRange = [subStr rangeOfString:key];
        
        NSRange yuRange = [subStr rangeOfString:@"&"];
        
        if (yuRange.location == NSNotFound) {
            return [subStr substringFromIndex:needRange.location + needRange.length];
        }
        
        
        NSRange newRange = NSMakeRange(needRange.location + needRange.length, yuRange.location - (needRange.location + needRange.length));
        
        return [subStr substringWithRange:newRange];
   
        
    }else  {
        return nil;
    }
    
    return nil;
    
}
+(BOOL)isNeedToRefreshTheToken
{
    NSDate *expireDate = [[NSUserDefaults standardUserDefaults]objectForKey:EXPIRES_DATE];
    
    
    NSComparisonResult result = [expireDate compare:[NSDate date]];
    
    if (result == NSOrderedDescending) {
        return NO;  //没有过期
    }
    return YES;  //过期
}
@end

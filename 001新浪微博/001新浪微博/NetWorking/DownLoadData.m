//
//  DownLoadData.m
//  007AFN的使用
//
//  Created by 黎跃春 on 15/5/18.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import "DownLoadData.h"
#import "AFAppDotNetAPIClient.h"
#import "FenSiMode.h"

@implementation DownLoadData

+ (NSURLSessionDataTask *)getFenSiPageData:(void (^) (id obj, NSError *err))block withPage:(int)page
{
    
      NSURL *url = [help2 getFollowersUrl];
    
       NSString *urlStr = [url absoluteString];
 
    
    return [[AFAppDotNetAPIClient sharedClient] GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        
        
        NSArray *apps = responseObject[@"users"];
        //        创建一个可变数组存储数据模型
        
        NSMutableArray *applications = [NSMutableArray array];

        //        遍历数组创建数据模型
        [apps enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
            //            创建数据模型
            FenSiMode *app = [FenSiMode applicationWithDic:dic];
            //            将数据模型添加到数组中
            [applications addObject:app];

        }];

//        NSLog(@"%@",applications);

//        通过block回调数据
        if (block) {
            block(applications,nil);
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"数据下载失败");
        if (block) {
            block(nil,error);
        }
    }];

    
}


//发送微博不带图片
//https://api.weibo.com/2/statuses/update.json
+ (NSURLSessionDataTask *)sendWeiboWithBlock:(void (^)(id obj, NSError *error))block andContent:(NSString*)content
{
    
     NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:ACCESS_TOKEN];
        NSDictionary *params = @{@"access_token":token,@"status":content};
    
    return [[AFAppDotNetAPIClient sharedClient]POST:SINA_UPLOAD parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (block) {
            block(responseObject,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        if (block) {
            block(nil,error);
        }
    }];
    
}
//发送微博带图片
//https://api.weibo.com/2/statuses/upload.json
//https://upload.api.weibo.com/2/statuses/upload.json
+ (NSURLSessionDataTask *)sendWeiboWithBlock:(void (^)(id obj, NSError *error))block andContent:(NSString*)content andImage:(UIImage*)image
{
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"ACCESS_TOKEN"];
    
        NSDictionary *params = @{@"access_token":token,@"status":content};
    
    return [[AFAppDotNetAPIClient sharedClient] POST:@"https://upload.api.weibo.com/2/statuses/upload.json" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    [formData appendPartWithFileData:UIImagePNGRepresentation(image) name:@"pic" fileName:@"pic" mimeType:@"image/png"];
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        if (block) {
            block(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];
    
    
}
@end










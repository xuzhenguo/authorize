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


//限免页面接口
//http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%d
//block   void (^) (id obj, NSError *err)
//+ (NSURLSessionDataTask *)getILimitFreePageData:(void (^) (id obj, NSError *err))block withPage:(int)page {
//
//    NSString *url = [NSString stringWithFormat:@"free/applications/limited?currency=rmb&page=%d",page];
//    
//    return [[AFAppDotNetAPIClient sharedClient] GET:url parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
//        NSArray *apps = responseObject[@"applications"];
//        //        创建一个可变数组存储数据模型
//        NSMutableArray *applications = [NSMutableArray array];
//        
//        //        遍历数组创建数据模型
//        [apps enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
//            //            创建数据模型
//            Application *app = [Application applicationWithDic:dic];
//            //            将数据模型添加到数组中
//            [applications addObject:app];
//            
//        }];
//        
////        NSLog(@"%@",applications);
//        
////        通过block回调数据
//        if (block) {
//            block(applications,nil);
//        }
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"数据下载失败");
//        if (block) {
//            block(nil,error);
//        }
//    }];
//    
//    
//}


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

@end










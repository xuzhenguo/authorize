//
//  DownLoadData.h
//  007AFN的使用
//
//  Created by 黎跃春 on 15/5/18.
//  Copyright (c) 2015年 黎跃春. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownLoadData : NSObject

// 获取首页所有数据
//+ (NSURLSessionDataTask *)getAllDataWithBlock:(void (^)(NSDictionary *result))block;


//限免页面接口
//http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%d
//block   void (^) (id obj, NSError *err)
+ (NSURLSessionDataTask *)getFenSiPageData:(void (^) (id obj, NSError *err))block withPage:(int)page;


@end
















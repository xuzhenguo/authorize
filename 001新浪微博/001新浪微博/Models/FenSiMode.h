//
//  FenSiMode.h
//  001新浪微博
//
//  Created by MS on 15/9/8.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FenSiMode : NSObject


@property(nonatomic,copy)NSString *screen_name;
@property(nonatomic,copy)NSString *profile_image_url;
@property(nonatomic,copy)NSString *avatar_hd;


- (instancetype)initWithDic:(NSDictionary*)dic;

//工厂方法
+ (FenSiMode*)applicationWithDic:(NSDictionary*)dic;
@end

//
//  FenSiMode.m
//  001新浪微博
//
//  Created by MS on 15/9/8.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "FenSiMode.h"

@implementation FenSiMode


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
}


- (id)valueForUndefinedKey:(NSString *)key {
    
    return nil;
}

-(instancetype)initWithDic:(NSDictionary*)dic {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
        
    }
    
    return self;
}

//工厂方法
+ (FenSiMode*)applicationWithDic:(NSDictionary*)dic {
    
    FenSiMode *app = [[FenSiMode alloc] initWithDic:dic];
    return app;
}
@end

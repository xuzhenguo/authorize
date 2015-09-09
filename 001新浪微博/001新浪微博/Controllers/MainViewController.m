//
//  MainViewController.m
//  001新浪微博
//
//  Created by MS on 15/9/8.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "FansListViewController.h"
#import "AttentionListViewController.h"
#import "MineViewController.h"
#import "MineWeiBoViewController.h"
#import "RDVTabBarItem.h"

#include "LoginViewController.h"
@interface MainViewController ()<RDVTabBarControllerDelegate>

@end

@implementation MainViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginSucess:) name:LOGIN_SUCESS object:nil];
    
    
    [self setViewControllers];
    
}
#pragma mark -- 登陆成功回调方法
-(void)loginSucess:(NSNotification *)noti
{
//    登陆成功接收到的数据
    NSString *content = noti.object;
 
    
    
      NSString *access_token = [help2 getContentFof:@"access_token=" andPath:content];
      NSString *remind_in = [help2 getContentFof:@"remind_in=" andPath:content];
      NSString *expires_in = [help2 getContentFof:@"expires_in=" andPath:content];
      NSString *uid = [help2 getContentFof:@"uid=" andPath:content];
    
    
    
//    保存 access_token 和 remind_in    expires_in
    [[NSUserDefaults standardUserDefaults]setObject:access_token forKey:ACCESS_TOKEN];
    [[NSUserDefaults standardUserDefaults]setObject:uid forKey:UID];
    
    if (expires_in != nil) {
        long long time = [expires_in longLongValue] - 3600;
        NSDate *expirexDate = [NSDate dateWithTimeIntervalSinceNow:time];
        [[NSUserDefaults standardUserDefaults]setValue:expirexDate forKey:EXPIRES_DATE];
        [[NSUserDefaults standardUserDefaults]synchronize];
        NSLog(@"%@",NSHomeDirectory());
    }
    
       self.selectedIndex = 4;
}
#pragma mark -- RDVTabBarControllerDelegate

- (BOOL)tabBarController:(RDVTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSLog(@"func---%s%@",__func__,viewController);
    
    NSArray *vcs = tabBarController.viewControllers;

    NSInteger index = [vcs indexOfObject:viewController];
    
    
//    先取token ，如果token为nil 必须登陆 ，token不为空，过期，必须登陆，token不为空，切不过期，无需再次登陆
   
//    取access_token
    NSString *access_token = [[NSUserDefaults standardUserDefaults]objectForKey:ACCESS_TOKEN];
    if (access_token == nil || [help2 isNeedToRefreshTheToken]) {
    
//        登陆想
        if (index == 4) {
            LoginViewController *loginVc = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
            UINavigationController *longinNav = [[UINavigationController alloc]initWithRootViewController:loginVc];
            [self presentViewController:longinNav animated:YES completion:nil];
            return NO;
        }

        
    }
    
    
    return YES;
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    
    
    //    取access_token
    NSString *access_token = [[NSUserDefaults standardUserDefaults]objectForKey:ACCESS_TOKEN];
    if (access_token == nil || [help2 isNeedToRefreshTheToken]) {
        
            LoginViewController *loginVc = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
            UINavigationController *longinNav = [[UINavigationController alloc]initWithRootViewController:loginVc];
            [self presentViewController:longinNav animated:YES completion:nil];

    }
}

//配置控制器

-(void)setViewControllers
{
    
    HomeViewController *home = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:home];
    
    
    
    FansListViewController *fans = [[FansListViewController alloc]initWithNibName:@"FansListViewController" bundle:nil];
    UINavigationController *fansNav = [[UINavigationController alloc]initWithRootViewController:fans];

    MineViewController *mine = [[MineViewController alloc]initWithNibName:@"MineViewController" bundle:nil];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mine];


    AttentionListViewController *atten = [[AttentionListViewController alloc]initWithNibName:@"AttentionListViewController" bundle:nil];
    UINavigationController *attenNav = [[UINavigationController alloc]initWithRootViewController:atten];


     MineWeiBoViewController *MineWeiBo = [[MineWeiBoViewController alloc]initWithNibName:@"MineWeiBoViewController" bundle:nil];
    UINavigationController *MineWeiBoNav = [[UINavigationController alloc]initWithRootViewController:MineWeiBo];
    
    
    
    [self setViewControllers:@[homeNav,fansNav,MineWeiBoNav,attenNav,mineNav]];
    [self customizeTabBarForController:self];

}
- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"tabbar_limitfree", @"tabbar_reduceprice", @"tabbar_appfree",@"tabbar_subject",@"tabbar_rank"];
    
    NSArray *titles = @[@"主页",@"粉丝列表",@"我的微博",@"关注列表",@"我的"];
    
    NSInteger index = 0;
    
    NSDictionary *textAttributes_normal = nil;
    NSDictionary *textAttributes_selected = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        textAttributes_normal = @{
                                  NSFontAttributeName: [UIFont systemFontOfSize:12],
                                  NSForegroundColorAttributeName: [UIColor colorWithRed:65/255.0 green:65/255.0 blue:65/255.0 alpha:1.0],
                                  };
        textAttributes_selected = @{
                                    NSFontAttributeName: [UIFont systemFontOfSize:12],
                                    NSForegroundColorAttributeName: [UIColor colorWithRed:14/255.0 green:154/255.0 blue:255/255.0 alpha:1.0],
                                    };
    }
    
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        
        
        item.unselectedTitleAttributes = textAttributes_normal;
        item.selectedTitleAttributes = textAttributes_selected;
        
        
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_press",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        item.title = titles[index];
        
        index++;
        
        
        
    }
}


@end




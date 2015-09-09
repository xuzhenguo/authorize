//
//  HomeViewController.m
//  001新浪微博
//
//  Created by MS on 15/9/8.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "HomeViewController.h"
#import "SendWieiBoViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"主页";
    
    UIBarButtonItem *sendweiBoBnt = [[UIBarButtonItem alloc]initWithTitle:@"发微博" style:UIBarButtonItemStylePlain target:self action:@selector(sendeweiBo:)];
    
    self.navigationItem.rightBarButtonItem = sendweiBoBnt;
    
}
-(void)sendeweiBo:(id)sender
{
    SendWieiBoViewController *sendWeiBoVc = [[SendWieiBoViewController alloc]init];
    
    [self.navigationController pushViewController:sendWeiBoVc animated:YES];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

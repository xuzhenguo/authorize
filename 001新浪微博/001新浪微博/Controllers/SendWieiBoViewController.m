//
//  SendWieiBoViewController.m
//  001新浪微博
//
//  Created by MS on 15/9/9.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "SendWieiBoViewController.h"
#import "RDVTabBarController.h"
@interface SendWieiBoViewController ()

@end

@implementation SendWieiBoViewController
{
    UITextView *_textView;   // 用于输入微博内容
    UIImageView *_imageView;  //展示图片
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发送微博";
    
//    1.UITextView
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDHT, 100)];
    textView.backgroundColor = [UIColor redColor];
    [self.view addSubview:textView];
    
//    2.UIimageView
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 164+20, 160 , 220)];
    _imageView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_imageView];
    
//    3.UIButton
    
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn.frame = CGRectMake(220, 220, 100, 100);
    [selectBtn addTarget:self action:@selector(selectphoto:)forControlEvents:UIControlEventTouchUpInside];
    selectBtn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:selectBtn];
    
    
//    4.右上角发送微博的按钮
    UIBarButtonItem *senBtn = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(sendeWeibo:)];
    self.navigationItem.rightBarButtonItem = senBtn;
    
}

-(void)selectphoto:(id)btn
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"插入相册" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"拍照",@"相册", nil];
    [alertView show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) { //拍照
        
    }else if (buttonIndex == 2){
        
        
        
    }//相册
}

//发送微博
-(void)sendeWeibo:(id)sender
{
    NSLog(@"发微博");
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

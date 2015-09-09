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
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDHT, 100)];
    _textView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_textView];
    
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
        [self takePhoto];
        
    }else if (buttonIndex == 2){
        [self selectPhoto];
        
        
    }//相册
}
//拍照
-(void)takePhoto
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        支持拍照
        //    1.创建UIImagePickerController
        UIImagePickerController *pickerVc = [[UIImagePickerController alloc]init];
        //    2.设置从相机选择照片
        pickerVc.sourceType = UIImagePickerControllerSourceTypeCamera;
        //    3.设置委托
        pickerVc.delegate = self;
        
        //    4.是否允许编辑
        pickerVc.allowsEditing = YES;
        
        [self presentViewController:pickerVc animated:YES completion:nil];
        
        
        
    }else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"本机不支持拍照" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [alertView show];
    }
    
}
//从相册里面选择照片
-(void)selectPhoto
{
   
//    1.创建UIImagePickerController
    UIImagePickerController *pickerVc = [[UIImagePickerController alloc]init];
//    2.设置从相册选择照片
    pickerVc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    3.设置委托
    pickerVc.delegate = self;
    
//    4.是否允许编辑
    pickerVc.allowsEditing = YES;
    
    [self presentViewController:pickerVc animated:YES completion:nil];
    
}


//发送微博
-(void)sendeWeibo:(id)sender
{
//
    
    NSLog(@"%@",_textView.text);
    
    if (_imageView.image == nil) { //不带图片
       
        [DownLoadData sendWeiboWithBlock:^(id obj, NSError *error) {
            
            NSString *message = nil;
            if (obj) {
                message = @"发送成功";
            } else {
                message = @"发送失败";
            }
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alertView show];
            alertView = nil;
            //            返回主页
            [self.navigationController popViewControllerAnimated:YES];
            
            
        } andContent:_textView.text];
        
        
            
    }else{ //带图片
        
        [DownLoadData sendWeiboWithBlock:^(id obj, NSError *error) {
            
            NSString *message = nil;
            if (obj) {
                message = @"发送成功";
            } else {
                message = @"发送失败";
            }
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alertView show];
            alertView = nil;
            //            返回主页
            [self.navigationController popViewControllerAnimated:YES];
            
        } andContent:_textView.text andImage:_imageView.image];
    }

    
    NSLog(@"发微博");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -- UIImagePickerControllerDelegate

//照片选择回到方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    
    _imageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

////照片选择完回调方法
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//     NSLog(@"照片选择完回调方法");
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

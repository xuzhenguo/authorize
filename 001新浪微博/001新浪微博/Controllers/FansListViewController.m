//
//  FansListViewController.m
//  001新浪微博
//
//  Created by MS on 15/9/8.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "FansListViewController.h"
#import "FenSiTableViewCell.h"
#import "FenSiMode.h"
@interface FansListViewController ()

@end

@implementation FansListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"粉丝列表";
    [DownLoadData getFenSiPageData:^(id obj, NSError *err) {
        
        self.dataSouce = obj;
        [self.table reloadData];
        
    } withPage:0];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *string = @"string";
    FenSiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    
    if (cell == nil) {
        
       UINib *nib = [UINib nibWithNibName:@"FenSiTableViewCell" bundle:nil];
       NSArray *arr = [nib instantiateWithOwner:nil options:nil];
        
        cell = (FenSiTableViewCell *)arr[0];
    }
    if (self.dataSouce.count > 0) {
        FenSiMode *fensimode = self.dataSouce[indexPath.row];
        [cell updateCellWithApplication:fensimode];
    }

    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSouce.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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

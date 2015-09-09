//
//  FenSiTableViewCell.h
//  001新浪微博
//
//  Created by MS on 15/9/8.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FenSiMode;
@interface FenSiTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iamgeView;
@property (strong, nonatomic) IBOutlet UILabel *myLable;
- (IBAction)myBtn:(id)sender;

-(void)updateCellWithApplication:(FenSiMode *)app;
@end

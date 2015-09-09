//
//  FenSiTableViewCell.m
//  001新浪微博
//
//  Created by MS on 15/9/8.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "FenSiTableViewCell.h"
#import "FenSiMode.h"
@implementation FenSiTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:
                reuseIdentifier]) {

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)updateCellWithApplication:(FenSiMode *)app
{
    self.myLable.text = app.screen_name;
    NSString *path = app.avatar_hd;
    NSURL *url = [NSURL URLWithString:path];
    NSLog(@"%@",url);
    [self.iamgeView setImageWithURL:url];
    
}

- (IBAction)myBtn:(id)sender {
}
@end

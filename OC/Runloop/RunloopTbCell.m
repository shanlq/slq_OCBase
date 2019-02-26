//
//  RunloopTbCell.m
//  OC
//
//  Created by ZSY on 2018/10/23.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "RunloopTbCell.h"

@implementation RunloopTbCell
{
    __weak IBOutlet UIImageView *_imgView;
    __weak IBOutlet UILabel *_titleLab;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)loadDataToView:(NSDictionary *)dic
{
    _imgView.image = [UIImage imageNamed:dic[@"img"]];
    _titleLab.text = dic[@"title"];
}

@end

//
//  CommandImplement.m
//  OC
//
//  Created by ZSY on 2018/4/24.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "CommandImplement.h"

@implementation CommandImplement

-(void)operateBtnWithType:(NSString *)type btn:(UIButton *)btn
{
    self.type = type;
    int num = btn.titleLabel.text.intValue;
    if([type isEqualToString:@"add"]){
        num++;
    }
    else{
        num--;
    }
    [btn setTitle:[NSString stringWithFormat:@"%d", num] forState:UIControlStateNormal];
}

@end

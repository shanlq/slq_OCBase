//
//  adaptorView.m
//  OC
//
//  Created by ZSY on 2018/5/17.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "adaptorView.h"

@implementation adaptorView

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 150, 20)];
        lab.textColor = [UIColor redColor];
        lab.tag = 1;
        [self addSubview:lab];
    }
    return self;
}

-(void)loadDataToLab:(id<adaptorProtocol>)person
{
    UILabel *lab = (UILabel *)[self viewWithTag:1];
    lab.text = [NSString stringWithFormat:@"%@今年%@岁", person.getPersonName, person.getPersonYear];
}

@end

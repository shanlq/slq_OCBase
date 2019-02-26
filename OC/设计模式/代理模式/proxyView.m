//
//  proxyView.m
//  OC
//
//  Created by ZSY on 2018/5/14.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "proxyView.h"

@implementation proxyView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor blueColor];
        [btn addTarget:self action:@selector(touch:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(200, 100, 100, 50);
        [self addSubview:btn];
    }
    return self;
}

-(void)touch:(UIButton *)btn
{
    [_delegate touchWithBtn];
}

@end

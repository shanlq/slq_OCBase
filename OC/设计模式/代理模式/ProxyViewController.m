//
//  ProxyViewController.m
//  OC
//
//  Created by ZSY on 2018/5/14.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "ProxyViewController.h"
#import "SProxyViewController.h"

@interface ProxyViewController ()
@end

@implementation ProxyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:btn];
}

-(void)touch
{
    [self.navigationController pushViewController:[SProxyViewController new] animated:YES];
}

@end

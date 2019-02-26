//
//  AdapterViewController.m
//  OC
//
//  Created by ZSY on 2018/5/17.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "AdapterViewController.h"
#import "adaptorView.h"
#import "adaptorModel.h"

@interface AdapterViewController ()

@end

@implementation AdapterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    adaptorView *view = [[adaptorView alloc] initWithFrame:self.view.frame];
    [view loadDataToLab:[[adaptorModel alloc] initWithName:@"yl" year:@"23"]];
    [self.view addSubview:view];
}

@end

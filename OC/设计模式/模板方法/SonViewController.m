//
//  SonViewController.m
//  OC
//
//  Created by ZSY on 2018/4/24.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "SonViewController.h"

@interface SonViewController ()

@end

@implementation SonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //使用“模板方法”继承的控件（算法），可以保证不改变btn属性的情况下再添加一些属性。
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [self creatBtn];
    btn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:btn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

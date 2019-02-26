//
//  ObserverViewController.m
//  OC
//
//  Created by ZSY on 2018/4/24.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "ObserverViewController.h"

@interface ObserverViewController ()

@end

@implementation ObserverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TestObserver" object:nil userInfo:@{@"test":@"shanlq"}];
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

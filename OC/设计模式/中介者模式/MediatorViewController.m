//
//  MediatorViewController.m
//  OC
//
//  Created by ZSY on 2018/5/9.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "MediatorViewController.h"
#import "mediator.h"

@interface MediatorViewController ()

@end

@implementation MediatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mediator *mObject = [[mediator alloc] init];
    mslq *slq = [[mslq alloc] init];
    slq.name = @"slq";
    slq.address = @"guangzhou";
    myl *yl = [[myl alloc] init];
    [mObject saveUserInfo:slq];
    yl.address = mObject.thisUser.address;                     //mslq类和myl类间没有直接交互
    yl.name = @"slq";
    NSLog(@"yl's boy friend is '%@' and in the future yl will go to '%@'", yl.name, yl.address);
    
    Class viewController = NSClassFromString(@"ResultViewController");
    UIViewController *vc = [[viewController alloc] init];
    
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

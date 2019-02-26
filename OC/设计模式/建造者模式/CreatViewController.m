//
//  CreatViewController.m
//  OC
//
//  Created by ZSY on 2018/4/23.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "CreatViewController.h"
#import "girlFriend.h"
#import "yl.h"
#import "Friend.h"

@interface CreatViewController ()

@end

@implementation CreatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //原型模式
    Friend *friend1 = [[Friend alloc] init];
    Friend *friend2 = [friend1 copy];
    friend2.name = @"shanlq";
    
    //1、将属性赋值过程封装到具体的子类yl中，直接使用yl类创建对象
//    yl *ll = [[yl new] getGrilInfo];
//    girlFriend *gril = [[girlFriend new] MyGrilFriendWithInfo:ll];
    
    //2、将属性赋值过程封装到block体中，不用创建grilInfo的子类
    girlFriend *gril = [[girlFriend new] MyGrilFriendWithGrilBlock:^(grilInfo *info) {
        info.name = @"yl";
        info.year = @"23";
        info.height = @"168";
    }];
    NSLog(@"%@ heigth %@ and his grilFriend name is %@, %@ year, height is %@", friend2.name, friend2.year, gril.name, gril.year, gril.height);
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

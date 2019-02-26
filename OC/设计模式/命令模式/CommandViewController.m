//
//  CommandViewController.m
//  OC
//
//  Created by ZSY on 2018/4/24.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "CommandViewController.h"
#import "CommandImplement.h"
#import "CommandManager.h"

@interface CommandViewController ()

typedef enum : NSUInteger{                         //tag值 枚举
    FIRSTBTNTAG = 1,
    SECONDBTNTAG = 2,
    THREEBTNTAG = 3,
    THIRDBTNTAG = 4
}btnTag;

@end

@implementation CommandViewController
{
    CommandManager *_manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _manager = [CommandManager shareInstance];
    [self creatView];
}

-(void)creatView
{
    [self creatBtnWithTag:FIRSTBTNTAG frame:CGRectMake(100, 100, 50, 50) title:@"加" Color:[UIColor blackColor]];
    [self creatBtnWithTag:SECONDBTNTAG frame:CGRectMake(150, 100, 50, 50) title:@"0" Color:[UIColor redColor]];
    [self creatBtnWithTag:THREEBTNTAG frame:CGRectMake(200, 100, 50, 50) title:@"减" Color:[UIColor greenColor]];
    
    [self creatBtnWithTag:THIRDBTNTAG frame:CGRectMake(130, 200, 90, 50) title:@"撤销" Color:[UIColor blackColor]];
}

-(void)creatBtnWithTag:(int)tag frame:(CGRect)frame title:(NSString *)title Color:(UIColor *)color
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = tag;
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = color;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClick:(UIButton *)btn
{
    UIButton *numBtn = [self.view viewWithTag:SECONDBTNTAG];
    [_manager countWithBtn:numBtn operate:btn.tag == FIRSTBTNTAG ? @"add" : (btn.tag == THREEBTNTAG ? @"reduce" : @"revoke")];
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

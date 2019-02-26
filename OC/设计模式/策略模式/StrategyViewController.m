//
//  StrategyViewController.m
//  OC
//
//  Created by ZSY on 2018/5/8.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "StrategyViewController.h"
#import "thisStrategy.h"

@interface StrategyViewController ()

@property (nonatomic, strong) UILabel *promptLab;
@property (nonatomic, strong) thisStrategy *stategy;

@end

@implementation StrategyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 100, 100, 50);
    [btn setTitle:@"slq" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blackColor]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(slqInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(170, 100, 100, 50);
    [btn1 setTitle:@"yl" forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor blackColor]];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(ylInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    NSArray *arr = @[@"weak", @"school", @"address"];
    for(int i = 0; i < 3; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(30 + i * 80, 200, 70, 40);
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor blackColor]];
        btn.tag = i + 1;
        btn.hidden = YES;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    _promptLab = [[UILabel alloc] initWithFrame:CGRectMake(50, 300, self.view.frame.size.width - 50, 30)];
    _promptLab.textColor = [UIColor blackColor];
    [self.view  addSubview:_promptLab];
    
}

-(void)slqInfo
{
    if(_stategy){
        _stategy = nil;
    }
    _stategy = [[thisStrategy alloc] initWithType:@"slq"];
    for(int i = 0; i < 3; i++){
        UIButton *btn = [self.view viewWithTag:i + 1];
        btn.hidden = NO;
    }
}

-(void)ylInfo
{
    if(_stategy){
        _stategy = nil;
    }
    _stategy = [[thisStrategy alloc] initWithType:@"yl"];
    for(int i = 0; i < 3; i++){
        UIButton *btn = [self.view viewWithTag:i + 1];
        btn.hidden = NO;
    }
}

-(void)click:(UIButton *)btn
{
    if(btn.tag == 1){
        _promptLab.text = [_stategy joinToWeak];
    }
    if(btn.tag == 2){
        _promptLab.text = [_stategy toSchool];
    }
    if(btn.tag == 3){
        _promptLab.text = [_stategy toTargetAddress];
    }
    
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

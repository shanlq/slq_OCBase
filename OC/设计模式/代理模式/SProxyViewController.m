//
//  SProxyViewController.m
//  OC
//
//  Created by ZSY on 2018/5/14.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "SProxyViewController.h"
#import "proxyView.h"

@interface SProxyViewController ()<proxyProtocol>

@property (nonatomic, strong) proxyView *testView;

@end

@implementation SProxyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _testView = [[proxyView alloc] initWithFrame:self.view.frame];
    _testView.delegate = self;
    [self.view addSubview:_testView];
}

-(void)dealloc
{
    //执行dealloc表示未造成引用循环，否则即出现了引用循环导致self未被释放
    NSLog(@"释放了内存，未引用循环");
}

#pragma mark proxyProtocol
-(void)touchWithBtn
{
    NSLog(@"点击了view中的btn");
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

//
//  MyThread.m
//  OC
//
//  Created by apple on 2017/11/28.
//  Copyright © 2017年 shanlq. All rights reserved.
//

#import "MyThread.h"

@implementation MyThread

-(void)dealloc
{
    NSLog(@"线程销毁：%s", __func__);
}

@end

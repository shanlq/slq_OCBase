//
//  SonOperation.m
//  OC
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 shanlq. All rights reserved.
//

#import "SonOperation.h"

@implementation SonOperation

//自定义NSOperation子类时常用的两个重写类
-(void)main      //不知道为什么没有执行这个方法？？？？？？
{
    NSLog(@"自定义的NSOperation子类任务：%@", [NSThread currentThread]);
}

-(void)start
{
    NSLog(@"自定义的NSOperation子类任务：%@", [NSThread currentThread]);
}

@end

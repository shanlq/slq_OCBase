//
//  SonClass.m
//  OC
//
//  Created by apple on 2017/11/24.
//  Copyright © 2017年 shanlq. All rights reserved.
//

#import "SonClass.h"

@implementation SonClass

+(void)load
{
    NSLog(@"子类的Load");
}

+(void)initialize
{
    NSLog(@"子类的initialize");
}

-(id)init
{
    NSLog(@"子类init方法");
    return self;
}

@end

//
//  FatherClass.m
//  OC
//
//  Created by apple on 2017/11/24.
//  Copyright © 2017年 shanlq. All rights reserved.
//

#import "FatherClass.h"

@implementation FatherClass

+(void)load
{
    NSLog(@"父类的Load");
}

+(void)initialize
{
    NSLog(@"父类的initialize");
}

-(id)init
{
    NSLog(@"父类init方法");
    return self;
}

@end

//
//  Friend.m
//  OC
//
//  Created by ZSY on 2018/4/23.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "Friend.h"

@implementation Friend

-(id)init
{
    if(self = [super init])
    {
        self.name = @"slq";
        self.year = @"178";
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone
{
    //使用allocWithZone方法深拷贝self的类即[self class]，然后返回创建的实例对象
    return [[[self class] allocWithZone:zone] init];
}

@end

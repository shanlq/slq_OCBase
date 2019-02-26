//
//  AbstractFactory.m
//  OC
//
//  Created by ZSY on 2018/4/16.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "AbstractFactory.h"

@implementation AbstractFactory
-(id)CreatPeople
{
    return nil;
}
@end

@implementation AbstractManClass
-(id)CreatPeople
{
    ManUserInfo *man = [[ManUserInfo alloc] init];
    man.name = @"slq";
    man.age = 24;
    return man;
}
@end

@implementation AbstractWomanClass
-(id)CreatPeople
{
    WomanUserInfo *woman = [[WomanUserInfo alloc] init];
    woman.name = @"yl";
    woman.year = 23;
    return woman;
}
@end

@implementation People
@end

@implementation ManUserInfo
@end

@implementation WomanUserInfo
@end

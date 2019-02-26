//
//  strategy.m
//  OC
//
//  Created by ZSY on 2018/5/8.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "thisStrategy.h"

@implementation slq

-(NSString *)joinToWeak
{
    return @"slq to weak with ios";
}
-(NSString *)toSchool
{
    return @"slq to huanghuaixueyuan";
}
-(NSString *)toTargetAddress
{
    return @"slq to guangzhou";
}

@end

@implementation myYl

-(NSString *)joinToWeak
{
    return @"yl to weak with kefu";
}
-(NSString *)toSchool
{
    return @"yl to huabeiligongdaxue";
}
-(NSString *)toTargetAddress
{
    return @"yl to zhengzhou";
}

@end

@implementation thisStrategy

-(instancetype)initWithType:(NSString *)type
{
    if(self = [super init])
    {
        [self initWithStrategyType:type];
    }
    return self;
}

-(void)initWithStrategyType:(NSString *)type       //动态类型：根据不同的参数值找到对应的算法类
{
    if([type isEqualToString:@"slq"]){
        _person = [[slq alloc] init];
    }
    if([type isEqualToString:@"yl"]){
        _person = [[myYl alloc] init];
    }
}

- (NSString *)joinToWeak {
    return [_person joinToWeak];
}

- (NSString *)toSchool {
    return [_person toSchool];
}

- (NSString *)toTargetAddress {
    return [_person toTargetAddress];
}

@end

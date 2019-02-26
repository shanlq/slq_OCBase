//
//  DecorateObject.m
//  OC
//
//  Created by ZSY on 2018/5/17.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "DecorateObject.h"

@implementation DecorateObject
{
    NSString *_name;
    NSString *_year;
}
-(instancetype)initWithName:(NSString *)name year:(NSString *)year
{
    if(self = [super init])
    {
        _name = name;
        _year = year;
    }
    return self;
}
-(NSString *)getManName
{
    return _name;
}
-(NSString *)getManYear
{
    return _year;
}
@end

@implementation firstWoman
-(instancetype)initWithObject:(id<manProtocol>)object
{
    if(self = [super init])
    {
        _thisMan = object;
    }
    return self;
}
-(NSString *)getManName
{
    return [NSString stringWithFormat:@"%@ + yl", _thisMan.getManName];
}
-(NSString *)getManYear
{
    return [NSString stringWithFormat:@"%@ + 23", _thisMan.getManYear];
}
@end

@implementation secondWoman
-(instancetype)initWithObject:(id<manProtocol>)object
{
    if(self = [super init])
    {
        _thisMan = object;
    }
    return self;
}
-(NSString *)getManName
{
    return [NSString stringWithFormat:@"%@ + lll", _thisMan.getManName];
}
-(NSString *)getManYear
{
    return [NSString stringWithFormat:@"%@ + 23", _thisMan.getManYear];
}
@end

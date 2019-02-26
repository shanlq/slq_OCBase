//
//  girlFriend.m
//  OC
//
//  Created by ZSY on 2018/4/23.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "girlFriend.h"

@implementation girlFriend

-(id)MyGrilFriendWithInfo:(grilInfo *)info
{
    self.name = info.name;
    self.year = info.year;
    self.height = info.height;
    
    return self;
}

-(id)MyGrilFriendWithGrilBlock:(grilBlock)block
{
    NSParameterAssert(block);                   //为block设置断言来判断是否创建了block变量，即是否正确传入了grilInfo参数
    grilInfo *info = [[grilInfo alloc] init];
    block(info);                                     //将block块中设置的grilInfo对象赋值给这里创建的info
    return [self MyGrilFriendWithInfo:info];    //仍然需要使用本类的构造方法创建对象
}

@end

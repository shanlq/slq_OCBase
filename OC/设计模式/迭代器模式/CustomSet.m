//
//  Set.m
//  OC
//
//  Created by ZSY on 2018/4/23.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "CustomSet.h"

@implementation CustomSet

-(id)init
{
    if(self = [super init])
    {
        _count = 0;
    }
    return self;
}

-(void)addOtherElement:(Element *)element
{
    if(!element){
        element = [Element creatElementWithIndex:_count];
    }
    
}

@end

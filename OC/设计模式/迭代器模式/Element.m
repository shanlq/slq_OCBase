//
//  Element.m
//  OC
//
//  Created by ZSY on 2018/4/23.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "Element.h"

@implementation Element

+(id)creatElementWithIndex:(int)index
{
    Element *element = [[self.class alloc] init];
    element.index = index;
    return element;
}

@end

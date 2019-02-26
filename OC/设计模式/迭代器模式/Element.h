//
//  Element.h
//  OC
//
//  Created by ZSY on 2018/4/23.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Element : NSObject

@property (nonatomic, strong) Element *nextElement;                       //下一个元素
@property (nonatomic, assign) int index;                                   //这个元素的内容

+(id)creatElementWithIndex:(int)index;

@end

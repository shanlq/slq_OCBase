//
//  Set.h
//  OC
//
//  Created by ZSY on 2018/4/23.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Element.h"

@interface CustomSet : NSObject

@property (nonatomic, strong) Element *currentElement;
@property (nonatomic, readonly) int count;

@end

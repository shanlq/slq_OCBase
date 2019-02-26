//
//  user.h
//  OC
//
//  Created by ZSY on 2018/5/9.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>

@class mediator;
@interface user : NSObject                                     //客户基类

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;

@end

@interface mslq : user                                
@end

@interface myl : user
@end

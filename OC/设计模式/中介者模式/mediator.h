//
//  mediator.h
//  OC
//
//  Created by ZSY on 2018/5/9.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "user.h"

/*
 *** 中介者模式：用一个中介对象封装一系列的对象交互。
 */

@interface mediator : NSObject                            //中介类（需使用多个中介类时可将此类作为抽象基类，具体对象交互过程放在其子类中实现）

@property (nonatomic, strong) user *thisUser;

-(void)saveUserInfo:(user *)user;

@end

//
//  girlFriend.h
//  OC
//
//  Created by ZSY on 2018/4/23.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "grilInfo.h"

/*
 ** 创建者模式：将一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不同的表示。
    说明：即当创建对象并需初始化属性时，将属性的初始化赋值过程封装起来（grilInfo属性赋值基类->yl具体的属性赋值类），使用具体的属性赋值类对象（如yl）代替直接为对象赋值的过程。创建grilInfo基类是为了后面创建不同属性值的具体子类。
 */

@interface girlFriend : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *height;

//@property (nonatomic, strong) void(^grilBlock)(grilInfo *info);
typedef void(^grilBlock)(grilInfo *info);

-(id)MyGrilFriendWithInfo:(grilInfo *)info;
-(id)MyGrilFriendWithGrilBlock:(grilBlock)block;

@end

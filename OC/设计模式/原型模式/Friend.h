//
//  Friend.h
//  OC
//
//  Created by ZSY on 2018/4/23.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 *** 使用原型实例指定创建对象的种类，并通过复制这个原型创建新的对象
即使用alloc：init方式创建对象a，并使用copy方法深拷贝该对象进而生成新对象b，并使用新对象做额外的操作（b含有a所有的属性值，所以称a是b的原型）
注：类必须遵循NSCoping协议并重写-(id)copyWithZone: 方法
 */

@interface Friend : NSObject<NSCopying>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *year;

@end

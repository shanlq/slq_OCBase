//
//  proxyView.h
//  OC
//
//  Created by ZSY on 2018/5/14.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *** 代理模式：为其他对象提供一种代理以控制对这个对象的访问
 */

@protocol proxyProtocol
@optional
-(void)touchWithBtn;
-(void)jump;
@end

@interface proxyView : UIView

@property (nonatomic, strong) id<proxyProtocol> delegate;                      //该属性即为“代理对象”，注意这里必须是weak属性 否则会造成循环引用

@end

//
//  CommandImplement.h
//  OC
//
//  Created by ZSY on 2018/4/24.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CommandImplement : NSObject

@property (nonatomic, strong) NSString *type;

-(void)operateBtnWithType:(NSString *)type btn:(UIButton *)btn;                 //命令对应的具体操作过程

@end

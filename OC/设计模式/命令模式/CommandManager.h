//
//  CommandManager.h
//  OC
//
//  Created by ZSY on 2018/4/24.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandImplement.h"

@interface CommandManager : NSObject

@property (nonatomic, strong) NSMutableArray *arr;                          //记录“命令对象”
@property (nonatomic, strong) CommandImplement *implement;                     //“命令对象”

+(CommandManager *)shareInstance;

-(void)countWithBtn:(UIButton *)btn operate:(NSString *)type;

@end

//
//  CommandManager.m
//  OC
//
//  Created by ZSY on 2018/4/24.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommandManager.h"

@implementation CommandManager

static CommandManager * shareManager;

+(CommandManager *)shareInstance
{
    static dispatch_once_t once;                    //注意这里必须是静态变量（只创建一次）
    dispatch_once(&once, ^{
        if(!shareManager){
            shareManager = [[CommandManager alloc] init];
        }
    });

    return shareManager;
}

-(void)countWithBtn:(UIButton *)btn operate:(NSString *)type
{
    if([type isEqualToString:@"revoke"]){
        if(self.arr.count > 0)
        {
            CommandImplement *this = self.arr[self.arr.count - 1];
            if([this.type isEqualToString:@"add"]){
                CommandImplement *last = [[CommandImplement alloc] init];
                [last operateBtnWithType:@"reduce" btn:btn];
            }
            if([this.type isEqualToString:@"reduce"]){
                CommandImplement *last = [[CommandImplement alloc] init];
                [last operateBtnWithType:@"add" btn:btn];
            }
            [self.arr removeObject:self.arr.lastObject];
        }
    }
    else{
        CommandImplement *implement = [[CommandImplement alloc] init];
        [implement operateBtnWithType:type btn:btn];
        [self.arr addObject:implement];
    }
}

-(NSMutableArray *)arr
{
    if(!_arr){
        _arr = [NSMutableArray arrayWithCapacity:0];
    }
    return _arr;
}

@end

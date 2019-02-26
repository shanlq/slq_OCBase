//
//  adaptorView.h
//  OC
//
//  Created by ZSY on 2018/5/17.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "adaptorProtocol.h"

@interface adaptorView : UIView

-(void)loadDataToLab:(id<adaptorProtocol>)person;           //这里没有直接引入对象模型（adapterModel），降低了view与model的耦合度

@end

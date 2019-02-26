//
//  grilInfo.h
//  OC
//
//  Created by ZSY on 2018/4/23.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface grilInfo : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *height;

-(id)getGrilInfo;

@end

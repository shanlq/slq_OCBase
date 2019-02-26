//
//  KVCViewController.h
//  OC
//
//  Created by ZSY on 2018/4/12.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondModel : NSObject

@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *weight;

@end

@interface KVCModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *work;
@property (nonatomic, strong) SecondModel *dataModel;
@end

@interface KVCViewController : UIViewController

@end

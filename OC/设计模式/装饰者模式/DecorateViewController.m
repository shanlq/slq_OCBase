//
//  DecorateViewController.m
//  OC
//
//  Created by ZSY on 2018/5/17.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "DecorateViewController.h"
#import "DecorateObject.h"

@interface DecorateViewController ()

@end

@implementation DecorateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     id<manProtocol> man = [[DecorateObject alloc] initWithName:@"slq" year:@"24"];
    NSLog(@"name = %@, year = %@", man.getManName, man.getManYear);
    man = [[firstWoman alloc] initWithObject:man];
    NSLog(@"name = %@, year = %@", man.getManName, man.getManYear);
    man = [[secondWoman alloc] initWithObject:man];
    NSLog(@"name = %@, year = %@", man.getManName, man.getManYear);
}

@end

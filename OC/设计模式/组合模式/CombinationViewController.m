//
//  CombinationViewController.m
//  OC
//
//  Created by ZSY on 2018/5/16.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "CombinationViewController.h"
#import "TestObject.h"

@interface CombinationViewController ()

@end

@implementation CombinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TestObject *object = [[TestObject alloc] init];
    [object addPerson:[[secondObject alloc] initWithName:@"单金墩" year:83]];
    [object addPerson:[[secondObject alloc] initWithName:@"单树元" year:53]];
    [object addPerson:[[secondObject alloc] initWithName:@"姜梅花" year:53]];
    [object addPerson:[[secondObject alloc] initWithName:@"单萍萍" year:31]];
    [object addPerson:[[secondObject alloc] initWithName:@"单月彬" year:28]];
    [object addPerson:[[secondObject alloc] initWithName:@"单粮棋" year:24]];
    [object addPerson:[[secondObject alloc] initWithName:@"杨柳" year:23]];
    
    [object gather];
}

@end

//
//  CaptureObjectData.m
//  Block
//
//  Created by Csy on 2018/11/11.
//  Copyright © 2018 Csy. All rights reserved.
//

#import "CaptureObjectData.h"

NSObject *objectC;
static NSObject *objectD;

@implementation CaptureObjectData

- (void)test {
    NSObject *objectA = [[NSObject alloc] init];
    void (^block0)(void) = ^(){
        NSLog(@"%@",objectA);
    };
    
    static NSObject *objectB;
    void (^block1)(void) = ^(){
        NSLog(@"%@",objectB);
    };
    
    void (^block2)(void) = ^(){
        NSLog(@"%@",objectC);
        NSLog(@"%@",objectD);
    };
    
    void (^block3)(void) = ^(){
        NSLog(@"%@",self);
    };
    
    void (^block4)(void) = ^(){
        NSLog(@"%d",_age);
    };
    
    NSLog(@"block0:%@",block0);
    NSLog(@"block1:%@",block1);
    NSLog(@"block1:%@",block2);
    NSLog(@"block1:%@",block3);
    NSLog(@"block1:%@",block4);
}

@end

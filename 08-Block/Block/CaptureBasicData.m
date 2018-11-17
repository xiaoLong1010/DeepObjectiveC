//
//  CaptureBasicData.m
//  Block
//
//  Created by Csy on 2018/11/11.
//  Copyright © 2018 Csy. All rights reserved.
//

#import "CaptureBasicData.h"

int c = 11;
static int d = 12;

@implementation CaptureBasicData

- (void)test {
    int a = 9;
    void (^block0)(void) = ^(){
        NSLog(@"%d",a);
    };
    
    static int b = 10;
    void (^block1)(void) = ^(){
        NSLog(@"%d",b);
    };
    
    void (^block2)(void) = ^(){
        NSLog(@"%d",c);
        NSLog(@"%d",d);
    };
    
    NSLog(@"block0:%@",block0);
    NSLog(@"block1:%@",block1);
    NSLog(@"block2:%@",block2);
}

@end

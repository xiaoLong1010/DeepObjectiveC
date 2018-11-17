//
//  RetainCycle.m
//  Block
//
//  Created by Csy on 2018/11/17.
//  Copyright © 2018 Csy. All rights reserved.
//

#import "RetainCycle.h"

@implementation RetainCycle

- (void)retainCycle1 {
    __weak typeof(self) weakSelf = self;
    __unsafe_unretained typeof(self) unretainedSelf = self;
    
    self.block = ^{
//        NSLog(@"%@",self);
        NSLog(@"%@",weakSelf);
        NSLog(@"%@",unretainedSelf);
    };
}

- (void)retainCycle2 {
    __block id blockSelf = self;
    
    self.block = ^{
        NSLog(@"%@",blockSelf);
        blockSelf = nil;
    };
    
    if (self.block) {
        self.block();
    }
}

@end

//
//  BlockType.m
//  Block
//
//  Created by Csy on 2018/11/11.
//  Copyright © 2018 Csy. All rights reserved.
//

#import "BlockType.h"

@implementation BlockType

- (void)blockIsObject {
    // __NSGlobalBlock__ : __NSGlobalBlock : NSBlock : NSObject
    void (^block)(void) = ^{
        NSLog(@"Block");
    };
    
    NSLog(@"%@", [block class]);
    NSLog(@"%@", [[block class] superclass]);
    NSLog(@"%@", [[[block class] superclass] superclass]);
    NSLog(@"%@", [[[[block class] superclass] superclass] superclass]);
}

- (void)testGlobalBlock {
    void (^block1)(void) = ^{
        NSLog(@"Block");
    };
    
    void (^block2)(int) = ^(int a){
        NSLog(@"Block - %d",a);
    };
    
    static int a = 4;
    void (^block3)(void) = ^{
        NSLog(@"Block - %d",a);
    };
    
    NSLog(@"block1: %@", [block1 class]);
    NSLog(@"block2: %@", [block2 class]);
    NSLog(@"block3: %@", [block3 class]);
}

- (void)testStackBlock {
    int a = 10;
    NSLog(@"block: %@",  [^{NSLog(@"%d",a);} class]);
}

- (void)testMallocBlock {
    int a = 10;
    void (^block)(void) = ^{
        NSLog(@"%d", a);
    };
    NSLog(@"block: %@",  [block class]);
}

@end

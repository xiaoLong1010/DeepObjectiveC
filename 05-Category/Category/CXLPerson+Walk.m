//
//  CXLPerson+Walk.m
//  Category
//
//  Created by Csy on 2018/10/28.
//  Copyright © 2018 Csy. All rights reserved.
//

#import "CXLPerson+Walk.h"

@implementation CXLPerson (Walk)

+ (void)load {
    NSLog(@"CXLPerson (Walk) +load");
}

- (void)instanceWalk {
    NSLog(@"-----%@",NSStringFromSelector(_cmd));
}
- (void)instanceWalk2 {
    NSLog(@"-----%@",NSStringFromSelector(_cmd));
}
+ (void)classWalk {
    NSLog(@"-----%@",NSStringFromSelector(_cmd));
}
+ (void)classWalk2 {
    NSLog(@"-----%@",NSStringFromSelector(_cmd));
}

@end

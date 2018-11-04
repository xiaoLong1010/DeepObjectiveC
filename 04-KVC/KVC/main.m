//
//  main.m
//  KVC
//
//  Created by Csy on 2018/10/28.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXLPerson : NSObject

@end

@implementation CXLPerson

+ (BOOL)accessInstanceVariablesDirectly {
    // 如果是NO，就不能直接读取成员变量
    // 默认是YES
    return YES;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}

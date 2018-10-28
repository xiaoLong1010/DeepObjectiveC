//
//  CXLPerson.h
//  TheClass
//
//  Created by Csy on 2018/10/28.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXLPerson : NSObject {
    int _age;
}

@property (nonatomic, copy) NSString *name;

+ (void)test;
- (void)personInstanceMethod;
+ (void)personClassMethod;

@end

NS_ASSUME_NONNULL_END

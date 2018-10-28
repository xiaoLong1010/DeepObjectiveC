//
//  CXLStudent.h
//  TheClass
//
//  Created by Csy on 2018/10/28.
//  Copyright © 2018 Csy. All rights reserved.
//

#import "CXLPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface CXLStudent : CXLPerson <NSCoding> {
    int _weight;
}

@property (nonatomic, assign) int height;

- (void)studentInstanceMethod;
+ (void)studentClassMethod;

@end

NS_ASSUME_NONNULL_END

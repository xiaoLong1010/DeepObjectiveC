//
//  CXLPerson+Walk.h
//  Category
//
//  Created by Csy on 2018/10/28.
//  Copyright © 2018 Csy. All rights reserved.
//

#import "CXLPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface CXLPerson (Walk)

- (void)instanceWalk;
- (void)instanceWalk2;
+ (void)classWalk;
+ (void)classWalk2;


@end

NS_ASSUME_NONNULL_END

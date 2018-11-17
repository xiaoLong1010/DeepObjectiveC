//
//  RetainCycle.h
//  Block
//
//  Created by Csy on 2018/11/17.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Block) (void);

NS_ASSUME_NONNULL_BEGIN

@interface RetainCycle : NSObject

@property (nonatomic, copy) Block block;

@end

NS_ASSUME_NONNULL_END

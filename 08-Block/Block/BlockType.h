//
//  BlockType.h
//  Block
//
//  Created by Csy on 2018/11/11.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlockType : NSObject

- (void)blockIsObject;
- (void)testGlobalBlock;
- (void)testStackBlock;
- (void)testMallocBlock;

@end

NS_ASSUME_NONNULL_END

//
//  main.m
//  Block
//
//  Created by Csy on 2018/11/11.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXLPerson.h"
#import "BlockType.h"
#import "__BlockData.h"

typedef void (^Block) (void);

void testWeakRefer(void) {
    CXLPerson *person = [[CXLPerson alloc] init];
    
    __weak CXLPerson *weakPerson = person;
    Block block =  ^() {
        NSLog(@"-----%@",weakPerson);
    };
}

void testNoReferInARC(void) {
    {
        CXLPerson *person = [[CXLPerson alloc] init];
        // ARC下，这是一个Stack Block，并不会持有person，
        // 在整个代码块结束之后,person会被释放
        ^() {
            NSLog(@"-----%@",person);
        };
    }
    NSLog(@"123");
}

void testNoReferInMRC(void) {
    Block block;
    {
        CXLPerson *person = [[CXLPerson alloc] init];
        // MRC下，这是一个Stack Block，并不会持有person，
        // 在整个代码块结束之后,block还存在，但是person会被释放
//        block =  [^() {
//            NSLog(@"-----%@",person);
//        } copy];
        block =  ^() {
            NSLog(@"-----%@",person);
        };
        
//        [block release];
//        [block copy];
//        [block release];
        
//        [person release];
    }
    NSLog(@"123");
}

void test__Block() {
    __BlockData *__blockObject = [[__BlockData alloc] init];
//    [__blockObject change__BlockVar];
    [__blockObject __BlockObjectVarARC];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        test__Block();
        
//        testNoReferInMRC();
//        BlockType *type = [[BlockType alloc] init];
//        [type testGlobalBlock];
    }
    return 0;
}

void test2(void) {
    void (^block1)(int) = ^(int a){
        NSLog(@"%d",a);
    };
    
    int b = 9;
    void (^block2)(void) = ^(){
        NSLog(@"%d",b);
    };
    
    NSObject *object = [[NSObject alloc] init];
    void (^block3)(void) = ^(){
        NSLog(@"%@",object);
    };
    
    NSLog(@"block1:%@",[block1 class]);
    NSLog(@"block2:%@",[block2 class]);
    NSLog(@"block3:%@",[block3 class]);
}



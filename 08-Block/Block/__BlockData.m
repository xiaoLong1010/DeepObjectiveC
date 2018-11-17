//
//  __BlockData.m
//  Block
//
//  Created by Csy on 2018/11/16.
//  Copyright © 2018 Csy. All rights reserved.
//

#import "__BlockData.h"
#import "CXLPerson.h"

typedef void (^Block) (void);

struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

struct ____BlockData__change__BlockVar_block_desc_0 {
    size_t reserved;
    size_t Block_size;
    void (*copy)(void);
    void (*dispose)(void);
};

struct __Block_byref_height_0 {
    void *__isa;
    struct __Block_byref_height_0 *__forwarding;
    int __flags;
    int __size;
    int height;
};

struct ____BlockData__change__BlockVar_block_impl_0 {
    struct __block_impl impl;
    struct ____BlockData__change__BlockVar_block_desc_0* Desc;
    struct __Block_byref_height_0 *height; // by ref
};

@implementation __BlockData

- (void)canNotChangeVar {
    int a = 10;
    Block block = ^(void){
//        a = 12;
    };
}

- (void)changeStaticVar {
    static int a = 10;
    Block block = ^(void){
        a = 12;
    };
}

- (void)change__BlockVar {
    __block int height = 10;
    NSLog(@"before height address : %p",&height);

    Block block = ^(void){
        height = 12;
    };
    
    struct ____BlockData__change__BlockVar_block_impl_0 *blockStruct =
    (__bridge struct ____BlockData__change__BlockVar_block_impl_0 *)block;

    NSLog(@"blockStruct height address : %p", &(blockStruct->height->height));
    NSLog(@"after height address : %p",&height);
}

- (void)__BlockObjectVarARC {
    {
        __block CXLPerson *person = [[CXLPerson alloc] init];
        
        ^(void){
            NSLog(@"%@", person);
        };
    }
    NSLog(@"person is dealloc");
    
    Block block;
    {
        CXLPerson *person = [[CXLPerson alloc] init];
        
        __weak __block CXLPerson *weakPerson = person;
        
        block = ^(void){
            NSLog(@"%@", weakPerson);
        };
    }
    NSLog(@"person is dealloc");
}

@end

//
//  main.m
//  TheClass
//
//  Created by Csy on 2018/10/28.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "CXLPerson.h"
#import "CXLStudent.h"
#import "CXLClassStruct.h"

void testGetClass(void);
void testGetMetaClass(void);
void testClassMethodToInstanceMethod(void);
void testInstanceISA(void);
void testClassISA(void);
void testClassStructInfo(void);

struct Person_Instance_Impl {
    Class isa;
};

struct Person_Class_Impl {
    Class isa;
    Class superclass;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        testClassStructInfo();
    }
    return 0;
}

void testGetClass() {
    NSObject *object = [[NSObject alloc] init];
    
    Class objectClass1 = [object class];
    Class objectClass2 = [NSObject class];
    Class objectClass3 = object_getClass(object);
    Class objectClass4 = objc_getClass("NSObject");
    
    NSLog(@"%p %p %p %p",
          objectClass1,
          objectClass2,
          objectClass3,
          objectClass4);
}

void testGetMetaClass() {
    Class objectMetaClass1 = object_getClass([NSObject class]);
    Class objectMetaClass2 = [[NSObject class] class];
    
    BOOL isMeta1 = class_isMetaClass(objectMetaClass1);
    BOOL isMeta2 = class_isMetaClass(objectMetaClass2);
    
    if (isMeta1) {
        NSLog(@"%p is meta class", objectMetaClass1);
    }
    
    if (isMeta2) {
        NSLog(@"%p is meta class", objectMetaClass2);
    }
}

void testClassMethodToInstanceMethod(void) {
    // 调用类方法，最后会调用NSObject的实例test方法
    [CXLPerson test];
}

void testInstanceISA(void) {
    CXLPerson *person = [[CXLPerson alloc] init];
    Class personClass = [CXLPerson class];
    
    NSLog(@"在此断点，使用LLDB查看地址");

    // 将OC对象转换成对struct，获取isa指针
    struct Person_Instance_Impl *personStruct = (__bridge struct Person_Instance_Impl *)(person);
    long instanseISA = (long)personStruct->isa;
    long transISA = instanseISA & ISA_MASK;
    long classAddress = (long)personClass;
    
    if (transISA == classAddress) {
        NSLog(@"instance & ISA_MASK success");
    }
}

void testClassISA(void) {
    Class personClass = [CXLPerson class];
    Class personMetaClass = object_getClass(personClass);
    
    struct Person_Class_Impl *personClassStruct = (__bridge struct Person_Class_Impl *)(personClass);
    long classISA = (long)personClassStruct->isa;
    long transISA = classISA & ISA_MASK;
    long metaAddress = (long)personMetaClass;
    
    if (transISA == metaAddress) {
        NSLog(@"Class & ISA_MASK success");
    }
}

void testClassStructInfo(void) {
    cxl_objc_class *studentClass = (__bridge cxl_objc_class *)([CXLStudent class]);
    cxl_objc_class *personClass = (__bridge cxl_objc_class *)([CXLPerson class]);
    
    class_rw_t *studentClassData = studentClass->data();
    class_rw_t *personClassData = personClass->data();
    
    class_rw_t *studentMetaClassData = studentClass->metaClass()->data();
    class_rw_t *personMetaClassData = personClass->metaClass()->data();
    
    NSLog(@"断点，查看方法，属性，协议，成员列表");
}


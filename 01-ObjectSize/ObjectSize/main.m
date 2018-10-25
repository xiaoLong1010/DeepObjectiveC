//
//  main.m
//  ObjectSize
//
//  Created by Csy on 2018/10/25.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

// sizeof是运算符，接收数据类型或者变量
// 如果是传入变量，其实是变量对应的类型占据的空间
// 在编译时就能确定
// stu是指针，所以占据8个字节
//    int size = sizeof(stu);

@interface Person : NSObject {
    @public
    int _age;
}
@end

@implementation Person

@end

@interface Student : Person {
    @public
    int _num;
}
@property (nonatomic, assign) int score;

@end

@implementation Student

@end

// NSObeject转换成的结构体
struct NSObject_IMPL {
    Class isa;
};

// Person转换成的结构体
struct Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _age;
};

// Student转换成的结构体
struct Student_IMPL {
    struct Person_IMPL Person_IVARS;
    int _num;
    int _score;
};


void theSizeOfNSObject(void);
void theSizeOfPerson(void);
void theSizeOfStudent(void);
void instanceToStruct(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        theSizeOfNSObject();
        
        theSizeOfPerson();
        
        theSizeOfStudent();
        
        instanceToStruct();
    }
    return 0;
}

void theSizeOfNSObject() {
    NSObject *object = [[NSObject alloc] init];
    
    // 根据objc源码，class_getInstanceSize表示成员变量占据的空间大小,8个字节。
    NSLog(@"NSObject class_getInstanceSize: %zd", class_getInstanceSize([NSObject class]));
    // 根据objc源码，malloc_size表示改实例对象占据的空间大小，最小是16个字节
    NSLog(@"NSObject alloc size: %zd", malloc_size((__bridge const void *)object));
}

void theSizeOfPerson() {
    Person *person = [[Person alloc] init];
    person->_age = 16;
    
    // Person的成员变量累加占据的空间是12，因为结构体字节对齐，实际是16个字节
    NSLog(@"Person class_getInstanceSize: %zd", class_getInstanceSize([Person class]));
    
    // 实例对象占据的空间大小，16个字节
    NSLog(@"Person alloc size: %zd", malloc_size((__bridge const void *)person));
}

void theSizeOfStudent() {
    Student *stu = [[Student alloc] init];
    stu->_num = 4;
    
    // Student的成员变量累加占据的空间是20，因为结构体字节对齐，实际是24
    NSLog(@"Student class_getInstanceSize: %zd", class_getInstanceSize([Student class]));
    
    // 根据libmalloc源码，分配给对象的空间，是16的倍数，32个字节
    NSLog(@"Student alloc size: %zd", malloc_size((__bridge const void *)stu));
}

void instanceToStruct() {
    Person *person = [[Person alloc] init];
    person->_age = 4;

    struct Person_IMPL *personImpl = (__bridge struct Person_IMPL *)person;
    NSLog(@"person instance age is %d,struct personImpl age is %d", person->_age, personImpl->_age);
}

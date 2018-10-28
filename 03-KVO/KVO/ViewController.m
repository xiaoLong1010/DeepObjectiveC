//
//  ViewController.m
//  KVO
//
//  Created by Csy on 2018/10/28.
//  Copyright © 2018 Csy. All rights reserved.
//

#import "ViewController.h"
#import "CXLPerson.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong) CXLPerson *person;

@end

@implementation ViewController

- (void)dealloc {
    [self.person removeObserver:self forKeyPath:@"age"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person = [[CXLPerson alloc] init];
    self.person.age = 12;
    self.person.numArray = [NSMutableArray array];
    
    NSLog(@"person添加KVO监听之前 - %@",
          object_getClass(self.person));
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person addObserver:self forKeyPath:@"age" options:options context:nil];
//    [self.person addObserver:self forKeyPath:@"numArray" options:options context:nil];
    
    NSLog(@"person添加KVO监听之后 - %@",
          object_getClass(self.person));
    [self printMethodNamesOfClass:object_getClass(self.person)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSInteger randNum = rand();
    self.person.age = randNum;
//    [[self.person mutableArrayValueForKey:@"numArray"] addObject:@(randNum)];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (![keyPath isEqualToString:@"age"]) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}

- (void)printMethodNamesOfClass:(Class)cls
{
    unsigned int count;
    // 获得方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    
    // 存储方法名
    NSMutableString *methodNames = [NSMutableString string];
    
    // 遍历所有的方法
    for (int i = 0; i < count; i++) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        // 拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@", "];
    }
    
    // 释放
    free(methodList);
    
    // 打印方法名
    NSLog(@"%@ %@", cls, methodNames);
}



@end

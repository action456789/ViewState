//
//  NSObject+StatePattern.m
//  ViewState
//
//  Created by YouXianMing on 15/6/30.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "NSObject+StatePattern.h"
#import <objc/runtime.h>

@implementation NSObject (StatePattern)


- (void)registerState:(NSString *)stateString stateBlock:(NSObjectBlock_t)stateBlock {

    [self setup];
    
    [self.stateDictionary setObject:stateBlock forKey:stateString];
}


- (void)switchToState:(NSString *)stateString {

    [self setup];
    
    NSObjectBlock_t block = [self.stateDictionary objectForKey:stateString];
    
    if (block) {
        
        __weak id weakSelf = self;
        block(weakSelf);
    }
}


- (void)setup {
    
    if (self.stateDictionary == nil) {
        self.stateDictionary = [NSMutableDictionary dictionary];
    }
}


#pragma mark - runtime属性
@dynamic stateDictionary;
NSString * const _recognizerStateDictionary = @"_recognizerStateDictionary";

- (void)setStateDictionary:(NSMutableDictionary *)stateDictionary {
    
    objc_setAssociatedObject(self, (__bridge const void *)(_recognizerStateDictionary), stateDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)stateDictionary {
    
    return objc_getAssociatedObject(self, (__bridge const void *)(_recognizerStateDictionary));
}


@end

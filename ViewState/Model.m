//
//  Model.m
//  ViewState
//
//  Created by YouXianMing on 15/6/30.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "Model.h"

@implementation Model

- (NSString *)description {
    
    return [NSString stringWithFormat:@"name = %@, age = %@", self.name, self.age];
}

- (void)dealloc {

    NSLog(@"资源释放");
}

@end

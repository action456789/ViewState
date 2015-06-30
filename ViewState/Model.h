//
//  Model.h
//  ViewState
//
//  Created by YouXianMing on 15/6/30.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+StatePattern.h"

@interface Model : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;

- (NSString *)description;

@end

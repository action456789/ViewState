//
//  NSObject+StatePattern.h
//  ViewState
//
//  Created by YouXianMing on 15/6/30.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NSObjectBlock_t)(id object);

@interface NSObject (StatePattern)

/**
 *  存储状态的字典
 */
@property (nonatomic, strong, readonly) NSMutableDictionary  *stateDictionary;

/**
 *  注册状态
 *
 *  @param stateString 状态标签值
 *  @param stateBlock  保存状态的block
 */
- (void)registerState:(NSString *)stateString stateBlock:(NSObjectBlock_t)stateBlock;

/**
 *  切换到指定标签的状态
 *
 *  @param stateString 状态标签值
 */
- (void)switchToState:(NSString *)stateString;

@end

//
//  ViewController.m
//  ViewState
//
//  Created by YouXianMing on 15/6/30.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()

@property (nonatomic, strong) UIView   *colorView;
@property (nonatomic, strong) NSTimer  *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
 
    /////////////////////////////////////////////////////////
    
    Model *model = [Model new];
    
    // 注册状态A
    [model registerState:@"A" stateBlock:^(id object) {
        
        Model *A = object;
        A.name   = @"YouXianMing";
        A.age    = @(27);
    }];
    
    // 注册状态B
    [model registerState:@"B" stateBlock:^(id object) {
        
        Model *A = object;
        A.name   = @"NoZuoNoDie";
        A.age    = @(100);
    }];
    
    // 切换到状态A
    [model switchToState:@"A"];

    // 打印信息
    NSLog(@"%@", model.description);
    
    /////////////////////////////////////////////////////////
    
    self.colorView = [[UIView alloc] init];
    [self.view addSubview:self.colorView];
    
    // 注册状态A
    [self.colorView registerState:@"A" stateBlock:^(id object) {
        UIView *tmpView            = object;
        tmpView.frame              = CGRectMake(100, 100, 100, 100);
        tmpView.backgroundColor    = [UIColor redColor];
        tmpView.layer.cornerRadius = 0;
        tmpView.layer.borderWidth  = 0.f;
    }];
    
    // 注册状态B
    [self.colorView registerState:@"B" stateBlock:^(id object) {
        UIView *tmpView            = object;
        tmpView.frame              = CGRectMake(200, 50, 100, 150);
        tmpView.backgroundColor    = [UIColor greenColor];
        tmpView.layer.cornerRadius = 0;
        tmpView.layer.borderWidth  = 0.f;
    }];
    
    // 注册状态C
    [self.colorView registerState:@"C" stateBlock:^(id object) {
        UIView *tmpView            = object;
        tmpView.frame              = CGRectMake(200, 300, 100, 200);
        tmpView.backgroundColor    = [UIColor yellowColor];
        tmpView.layer.cornerRadius = 10.f;
        tmpView.layer.borderWidth  = 0.f;
    }];
    
    // 注册状态D
    [self.colorView registerState:@"D" stateBlock:^(id object) {
        UIView *tmpView            = object;
        tmpView.frame              = CGRectMake(150, 150, 100, 200);
        tmpView.backgroundColor    = [UIColor clearColor];
        tmpView.layer.cornerRadius = 10.f;
        tmpView.layer.borderWidth  = 2.f;
        tmpView.layer.borderColor  = [UIColor redColor].CGColor;
    }];
    
    [self.colorView switchToState:@"A"];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.2 target:self selector:@selector(timerEvent) userInfo:nil repeats:YES];
}

- (void)timerEvent {
    
    NSInteger random = arc4random() % 4;
    
    
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:0 options:0 animations:^{
        
        if (random == 0) {
            [self.colorView switchToState:@"A"];
        } else if (random == 1) {
            [self.colorView switchToState:@"B"];
        } else if (random == 2) {
            [self.colorView switchToState:@"C"];
        } else if (random == 3) {
            [self.colorView switchToState:@"D"];
        }
        
    } completion:^(BOOL finished) {
        
    }];
    
}

@end

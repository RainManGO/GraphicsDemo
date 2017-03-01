//
//  TestViewController.m
//  GraphicsDemo
//
//  Created by apple on 2017/3/1.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "TestViewController.h"
#import "BezierPathTestView.h"
#import "CGContextRefView.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  =  [UIColor whiteColor];
    [self  addSubViewAccordingFrom];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

//根据来源不同使用不同的画法
-(void)addSubViewAccordingFrom{
    if (_from==BezierPath) {
        [self useBezierPathDraw];
    }else if (_from==Context){
        [self useContextPathDraw];
    }
}

-(void)useBezierPathDraw{
    BezierPathTestView  *   BezierPathView  = [[BezierPathTestView alloc]init];
    BezierPathView.frame  =  self.view.frame;
    [self.view addSubview:BezierPathView];
}


-(void)useContextPathDraw{
    CGContextRefView  *   ContextRefView  = [[CGContextRefView alloc]init];
    ContextRefView.frame  =  self.view.frame;
    [self.view addSubview:ContextRefView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

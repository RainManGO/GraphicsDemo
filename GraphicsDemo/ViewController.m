//
//  ViewController.m
//  GraphicsDemo
//
//  Created by apple on 2017/3/1.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ViewController.h"
#import "DrawLayerViewController.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//直接画在Layer上并带动画效果
- (IBAction)drawInLayerWithAnimation:(UIButton *)sender {
    
    DrawLayerViewController  *  drawLayerController  =  [[DrawLayerViewController  alloc]init];
    drawLayerController.title = sender.titleLabel.text;
    [self.navigationController pushViewController:drawLayerController animated:YES];
    
}

//此类是Core Graphics框架关于path的一个封装。使用此类可以定义简单的形状
- (IBAction)useBezierPathDraw:(UIButton *)sender {
    [self pushTestVcFrom:BezierPath];
}

//Graphics Context是图形上下文,可以将其理解为一块画布,我们可以在上面进行绘画操作,绘制完成后,将画布放到我们的view中显示即可,view看作是一个画框
- (IBAction)useCGContextRefDraw:(UIButton *)sender {
    [self pushTestVcFrom:Context];
}

//push到子页面，到子页面判断来源
-(void)pushTestVcFrom:(From)from{
    TestViewController  *  testVc  =  [[TestViewController  alloc]init];
    testVc.from                    =  from;
    [self.navigationController pushViewController:testVc animated:YES];
}

@end

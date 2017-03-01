//
//  DrawLayerViewController.m
//  GraphicsDemo
//
//  Created by apple on 2017/3/1.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "DrawLayerViewController.h"

@interface DrawLayerViewController ()

@end

@implementation DrawLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _BezierPath =  [[UIBezierPath alloc] init];
    _drawMap    =  [CAShapeLayer layer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)drawArrow:(UIButton *)sender {
    
    [self setArrowAttrute];
    [self drawArrowPath];
    [self drawAtlayer];
}


- (IBAction)drawSinglePerson:(UIButton *)sender {

    [self setSingleAttrute];
    [self drawSingePersonPath];
    [self drawAtlayer];
    
}

//设置画笔属性
-(void)setArrowAttrute{
    _pinteColor  =  [UIColor greenColor];
    _lineWidth   = 5;
}

//设置画笔属性
-(void)setSingleAttrute{
    _pinteColor  =  [UIColor yellowColor];
    _lineWidth   = 5;
}

- (IBAction)cleanDraw:(UIButton *)sender {
    [_BezierPath removeAllPoints];
    [self drawAtlayer];
}

//画小人的路径
-(void)drawSingePersonPath{
    //create path
    [_BezierPath removeAllPoints];
    [_BezierPath moveToPoint:CGPointMake(175, 100)];
    [_BezierPath addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [_BezierPath moveToPoint:CGPointMake(150, 125)];
    [_BezierPath addLineToPoint:CGPointMake(150, 175)];
    [_BezierPath addLineToPoint:CGPointMake(125, 225)];
    [_BezierPath moveToPoint:CGPointMake(150, 175)];
    [_BezierPath addLineToPoint:CGPointMake(175, 225)];
    [_BezierPath moveToPoint:CGPointMake(100, 150)];
    [_BezierPath addLineToPoint:CGPointMake(200, 150)];
}


//画对号的路径
-(void)drawArrowPath{
    //create path
    [_BezierPath removeAllPoints];
    CGPoint pathCenter = CGPointMake(self.drawView.frame.size.width/2, self.drawView.frame.size.height/2 - 50);
    [_BezierPath addArcWithCenter:pathCenter radius:40 startAngle:0 endAngle:2*M_PI clockwise:YES];
    _BezierPath.lineCapStyle = kCGLineCapRound;
    _BezierPath.lineJoinStyle = kCGLineCapRound;
    CGFloat x = self.drawView.frame.size.width/2.5 + 15;
    CGFloat y = self.drawView.frame.size.height/2 - 45;
    //勾的起点
    [_BezierPath moveToPoint:CGPointMake(x, y)];
    //勾的最底端
    CGPoint p1 = CGPointMake(x+20, y+ 10);
    [_BezierPath addLineToPoint:p1];
    //勾的最上端
    CGPoint p2 = CGPointMake(x+45,y-20);
    [_BezierPath addLineToPoint:p2];
}

//把轨迹画在画板上
-(void)drawAtlayer{
    
    _drawMap.strokeColor = _pinteColor.CGColor;
    _drawMap.fillColor = [UIColor clearColor].CGColor;
    _drawMap.lineWidth = _lineWidth;
    _drawMap.lineJoin = kCALineJoinRound;
    _drawMap.lineCap = kCALineCapRound;
    _drawMap.path = _BezierPath.CGPath;
    [self addAnimationInDrawMapWithLayer:_drawMap];
    [self.drawView.layer addSublayer:_drawMap];
}

//画图放慢动画
-(void)addAnimationInDrawMapWithLayer:(CAShapeLayer *)layer{
   
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 3;
    [layer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];

}


@end

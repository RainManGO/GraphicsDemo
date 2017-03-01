//
//  DrawLayerViewController.h
//  GraphicsDemo
//
//  Created by apple on 2017/3/1.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawLayerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *drawView;

@property (strong,nonatomic)UIBezierPath * BezierPath;//画笔
@property (strong,nonatomic)CAShapeLayer * drawMap;//画布
@property (strong,nonatomic)UIColor * pinteColor;//画笔颜色
@property (assign,nonatomic)CGFloat   lineWidth;//画笔粗细

- (IBAction)drawArrow:(UIButton *)sender;
- (IBAction)drawSinglePerson:(UIButton *)sender;
- (IBAction)cleanDraw:(UIButton *)sender;

@end

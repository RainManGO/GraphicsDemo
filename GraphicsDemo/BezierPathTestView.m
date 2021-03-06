//
//  BezierPathTestView.m
//  GraphicsDemo
//
//  Created by apple on 2017/3/1.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "BezierPathTestView.h"

@implementation BezierPathTestView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGSize size = self.bounds.size;
    CGFloat margin = 10;
    //rintf：四舍五入函数
    CGFloat radius = rintf(MIN(size.height - margin, size.width - margin) / 4);
    CGFloat xOffset, yOffset;
    
    CGFloat offset = rintf((size.height - size.width) / 2);
    if (offset > 0) {
        xOffset = (CGFloat)rint(margin / 2);
        yOffset = offset;
    } else {
        xOffset = -offset;
        yOffset = rintf(margin / 2);
    }
    
    [[UIColor redColor] setFill];
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(radius * 2 + xOffset, radius + yOffset)
                    radius:radius
                startAngle:(CGFloat)-M_PI
                  endAngle:0
                 clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius * 3 + xOffset, radius * 2 + yOffset)
                    radius:radius
                startAngle:(CGFloat)-M_PI_2
                  endAngle:(CGFloat)M_PI_2
                 clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius * 2 + xOffset, radius * 3 + yOffset)
                    radius:radius
                startAngle:0
                  endAngle:(CGFloat)M_PI
                 clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius + xOffset, radius * 2 + yOffset)
                    radius:radius
                startAngle:(CGFloat)M_PI_2
                  endAngle:(CGFloat)-M_PI_2
                 clockwise:YES];
    [path closePath];
    [path fill];
}

@end

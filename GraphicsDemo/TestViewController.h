//
//  TestViewController.h
//  GraphicsDemo
//
//  Created by apple on 2017/3/1.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,From){
    BezierPath,
    Context
};

@interface TestViewController : UIViewController
@property(nonatomic,assign)From  from;
@end

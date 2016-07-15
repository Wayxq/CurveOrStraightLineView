//
//  CurveView.h
//  CurveView
//
//  Created by way on 16/7/15.
//  Copyright © 2016年 way. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Line;
@interface CurveView : UIView

@property (strong,nonatomic) NSMutableArray * lines;
@property (strong,nonatomic) Line * line;
@property (assign,nonatomic) int numberOfLines;
@property (strong,nonatomic) NSMutableArray * points;

@property (strong,nonatomic) UIColor * afColor;
@property (strong,nonatomic) UIColor * bfColor;

@end

@interface Line : NSObject

@property (assign,nonatomic) CGPoint firstPoint;
@property (assign,nonatomic) CGPoint secondPoint;

@end

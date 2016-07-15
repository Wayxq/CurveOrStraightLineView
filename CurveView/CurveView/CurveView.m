//
//  CurveView.m
//  CurveView
//
//  Created by way on 16/7/15.
//  Copyright © 2016年 way. All rights reserved.
//

#import "CurveView.h"

@implementation CurveView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        _numberOfLines = 5;
        
        self.afColor = [UIColor colorWithRed:123.0/255.0 green:207.0/255.0 blue:35.0/255.0 alpha:1.0];
        self.bfColor = [UIColor colorWithRed:97.0/255.0 green:173.0/255.0 blue:244.0/255.0 alpha:1.0];
        
        [self setZuoBiao];
    }
    return self;
}

-(void)setZuoBiao{
    
    for (int i = 0; i < _numberOfLines; i ++) {
        
        UILabel * label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor whiteColor];
        NSString * str = [NSString stringWithFormat:@"%d0",_numberOfLines-1 - i];
        if ([str isEqualToString:@"00"]) {
            str = @"0";
        }
        label.text = str;
        
        CGFloat labelH = 20;
        CGFloat maxginY = (self.frame.size.height - _numberOfLines*labelH)/_numberOfLines;
        
        label.frame = CGRectMake(0, labelH + i*maxginY + labelH*i, labelH, labelH);
        
        [self addSubview:label];
    }
}

-(void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(context, 1);
    
    for (int i = 0; i < self.lines.count; i ++) {
        Line * line = self.lines[i];
        
        CGContextMoveToPoint(context, line.firstPoint.x, line.firstPoint.y);
        CGContextAddLineToPoint(context, line.secondPoint.x, line.secondPoint.y);
    }

    CGContextStrokePath(context);
    
    
    // 1线 (折线)
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path setLineWidth:2];
    for (int i = 0; i < [[self.points objectAtIndex:0] count] - 1; i ++) {
        
        CGPoint firstPoint = [[[self.points objectAtIndex:0] objectAtIndex:i] CGPointValue];
        CGPoint secondPoint = [[[self.points objectAtIndex:0] objectAtIndex:i+1] CGPointValue];
        [path moveToPoint:firstPoint];
        [path addLineToPoint:secondPoint];
        
        [self.bfColor set];
    }
    path.lineCapStyle = kCGLineCapRound;
    [path strokeWithBlendMode:kCGBlendModeNormal alpha:1];

    // 1线 (曲线)
    UIBezierPath * path1 = [UIBezierPath bezierPath];
    [path1 setLineWidth:2];
    for (int i = 0; i < [[self.points objectAtIndex:0] count] - 1; i ++) {
        
        CGPoint firstPoint = [[[self.points objectAtIndex:0] objectAtIndex:i] CGPointValue];
        CGPoint secondPoint = [[[self.points objectAtIndex:0] objectAtIndex:i+1] CGPointValue];
        [path1 moveToPoint:firstPoint];
        [path1 addCurveToPoint:secondPoint controlPoint1:CGPointMake((secondPoint.x-firstPoint.x)/2+firstPoint.x, firstPoint.y) controlPoint2:CGPointMake((secondPoint.x-firstPoint.x)/2+firstPoint.x, secondPoint.y)];
        
        [[UIColor redColor] set];
    }
    path1.lineCapStyle = kCGLineCapRound;
    [path1 strokeWithBlendMode:kCGBlendModeNormal alpha:1];
    
    // 1点
    for(int i=0; i<[[self.points firstObject] count]; i++){
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGPoint point = [[[self.points firstObject] objectAtIndex:i] CGPointValue];
        CGContextFillEllipseInRect(ctx, CGRectMake(point.x-4, point.y-4, 8, 8));
        CGContextSetFillColorWithColor(ctx, self.bfColor.CGColor);
        CGContextFillPath(ctx);
    }
    
    // 2线 (折线)
    UIBezierPath * path2 = [UIBezierPath bezierPath];
    [path2 setLineWidth:2];
    for (int i = 0; i < [[self.points objectAtIndex:1] count] - 1; i ++) {
        
        CGPoint firstPoint = [[[self.points objectAtIndex:1] objectAtIndex:i] CGPointValue];
        CGPoint secondPoint = [[[self.points objectAtIndex:1] objectAtIndex:i+1] CGPointValue];
        [path2 moveToPoint:firstPoint];
        [path2 addLineToPoint:secondPoint];
        
        [self.afColor set];
    }
    path2.lineCapStyle = kCGLineCapRound;
    [path2 strokeWithBlendMode:kCGBlendModeNormal alpha:1];
    
    
    // 2线 (曲线)
    UIBezierPath * path22 = [UIBezierPath bezierPath];
    [path22 setLineWidth:2];
    for (int i = 0; i < [[self.points objectAtIndex:1] count] - 1; i ++) {
        
        CGPoint firstPoint = [[[self.points objectAtIndex:1] objectAtIndex:i] CGPointValue];
        CGPoint secondPoint = [[[self.points objectAtIndex:1] objectAtIndex:i+1] CGPointValue];
        [path22 moveToPoint:firstPoint];
        [path22 addCurveToPoint:secondPoint controlPoint1:CGPointMake((secondPoint.x-firstPoint.x)/2+firstPoint.x, firstPoint.y) controlPoint2:CGPointMake((secondPoint.x-firstPoint.x)/2+firstPoint.x, secondPoint.y)];
        
        [[UIColor cyanColor] set];
    }
    path22.lineCapStyle = kCGLineCapRound;
    [path22 strokeWithBlendMode:kCGBlendModeNormal alpha:1];
    
    // 2点
    for(int i=0; i<[[self.points firstObject] count]; i++){
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGPoint point = [[[self.points lastObject] objectAtIndex:i] CGPointValue];
        CGContextFillEllipseInRect(ctx, CGRectMake(point.x-4, point.y-4, 8, 8));
        CGContextSetFillColorWithColor(ctx, self.afColor.CGColor);
        CGContextFillPath(ctx);
    }
}

@end

@implementation Line

- (id)init
{
    if(self=[super init]){
        
    }
    return self;
}

@end

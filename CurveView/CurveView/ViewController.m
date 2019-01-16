//
//  ViewController.m
//  CurveView
//
//  Created by way on 16/7/15.
//  Copyright © 2016年 way. All rights reserved.
//
// push local branch pushTest to origin

#import "ViewController.h"
#import "CurveView.h"
#import "PointView.h"
@interface ViewController ()

@property (strong,nonatomic) CurveView * curveView;
@property (strong,nonatomic) PointView * pointView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CurveView * curveView = [[CurveView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
    self.curveView = curveView;
    
    curveView.points = [NSMutableArray arrayWithArray:[self returnPointXandYWithNumberOfLines:5]];
    
    curveView.lines = [NSMutableArray array];
    
    Line * line = [[Line alloc] init];
    line.firstPoint = CGPointMake(20, 0);
    line.secondPoint = CGPointMake(20, 300);
    [curveView.lines addObject:line];
    
    Line * line1 = [[Line alloc] init];
    line1.firstPoint = CGPointMake(20, 280);
    line1.secondPoint = CGPointMake([UIScreen mainScreen].bounds.size.width - 10, 280);
    [curveView.lines addObject:line1];
    
    [self.view addSubview:curveView];
    
    // 1
    for(int i =0; i<[[curveView.points objectAtIndex:0] count]; i++){
        self.pointView = [[PointView alloc]init];
        [curveView addSubview:self.pointView];
        self.pointView.oringinPoint = [[[curveView.points objectAtIndex:0]objectAtIndex:i] CGPointValue];
        self.pointView.pointLabel.text = [NSString stringWithFormat:@"%.0f %.0f",self.pointView.oringinPoint.x,self.pointView.oringinPoint.y];
        [self.pointView sizeToFit];
    }
    [self.pointView setNeedsDisplay];
    
    // 2
    for(int i =0; i<[[curveView.points objectAtIndex:1] count]; i++){
        self.pointView = [[PointView alloc]init];
        [curveView addSubview:self.pointView];
        self.pointView.oringinPoint = [[[curveView.points objectAtIndex:1]objectAtIndex:i] CGPointValue];
        self.pointView.pointLabel.text = [NSString stringWithFormat:@"%.0f %.0f",self.pointView.oringinPoint.x,self.pointView.oringinPoint.y];
        [self.pointView sizeToFit];
    }
    [self.pointView setNeedsDisplay];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray* )returnPointXandYWithNumberOfLines:(int)numberOfLines
{
    NSMutableArray * bfPoints = [[NSMutableArray alloc]init];
    NSMutableArray * afPoints = [[NSMutableArray alloc]init];
    int gap = self.curveView.frame.size.width/(numberOfLines-2)-20;
    if((numberOfLines-2) * gap>=250){
        gap-= 2;
    }
    for(int i = 0; i < numberOfLines - 1; i ++){
        CGPoint point1 = CGPointMake(20 + gap * i, arc4random()% 260 + 20);
        CGPoint point2 = CGPointMake(20 + gap * i, arc4random()% 180 + 20);
        [bfPoints addObject:[NSValue valueWithCGPoint:point1]];
        [afPoints addObject:[NSValue valueWithCGPoint:point2]];
    }
    return [NSArray arrayWithObjects:bfPoints,afPoints, nil];
}

@end

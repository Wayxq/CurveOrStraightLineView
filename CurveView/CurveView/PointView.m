//
//  PointView.m
//  CurveView
//
//  Created by way on 16/7/15.
//  Copyright © 2016年 way. All rights reserved.
//

#import "PointView.h"

@implementation PointView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.pointLabel = [[UILabel alloc] init];
        self.pointLabel.font = [UIFont systemFontOfSize:10];;
        self.pointLabel.backgroundColor = [UIColor clearColor]; self.pointLabel.textColor = [UIColor colorWithRed:123.0/255.0 green:207.0/255.0 blue:35.0/255.0 alpha:.8];
        self.pointLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        
        self.pointLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.pointLabel];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)init {
    if((self = [self initWithFrame:CGRectZero])) {
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.pointLabel sizeToFit];
    
    self.pointLabel.frame = CGRectMake(self.oringinPoint.x - self.pointLabel.frame.size.width/2, self.oringinPoint.y, self.pointLabel.frame.size.width, self.pointLabel.frame.size.height);
    
}


@end

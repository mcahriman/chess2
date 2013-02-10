//
//  C2Board.m
//  chess2
//
//  Created by Berkus on 10 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2Board.h"

@implementation C2Board {
    CGGradientRef _whiteGradient;
    CGGradientRef _blackGradient;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawGradientRect:(CGRect)rect forBlackSide:(BOOL)black;
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGGradientRef gradient = black ? [self blackGradient] : [self whiteGradient];
    CGPoint startPoint = CGPointMake(0.0, 0.0);
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
}

-(CGGradientRef)blackGradient
{
    if (nil == _blackGradient)
    {
        CGFloat colors[6] = {
            138.0f / 255.0f, 1.0f,
            162.0f / 255.0f, 1.0f,
            206.0f / 255.0f, 1.0f};
        CGFloat locations[3] = { 0.05f, 0.45f, 0.95f };
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
        _blackGradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, 3);
        CGColorSpaceRelease(colorSpace);
    }
    return _blackGradient;
}

-(CGGradientRef)whiteGradient
{
    if (nil == _whiteGradient)
    {
        CGFloat colors[6] = {
            138.0f / 255.0f, 1.0f,
            162.0f / 255.0f, 1.0f,
            206.0f / 255.0f, 1.0f};
        CGFloat locations[3] = { 0.05f, 0.45f, 0.95f };
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
        _whiteGradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, 3);
        CGColorSpaceRelease(colorSpace);
    }
    return _whiteGradient;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Divide rect into 8x8 subrects
    CGFloat width = (CGRectGetMaxX(rect) - CGRectGetMinX(rect))/8.0;
    CGFloat height = (CGRectGetMaxY(rect) - CGRectGetMinY(rect))/8.0;
    
    [self drawGradientRect:rect forBlackSide:YES];
}

@end

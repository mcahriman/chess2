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
    CGContextSaveGState(context);
    CGContextClipToRect(context, rect);
    CGGradientRef gradient = black ? [self blackGradient] : [self whiteGradient];
    CGPoint startPoint = rect.origin; //CGPointMake(0.0, 0.0);
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    NSLog(@"Drawing gradient rect from %@ to %@", NSStringFromCGPoint(startPoint), NSStringFromCGPoint(endPoint));
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
}

-(CGGradientRef)blackGradient
{
    if (nil == _blackGradient)
    {
        CGFloat colors[8] = {
            130.0f / 255.0f, 121.0f / 255.0f, 127.0f / 255.0f, 1.0f,
            146.0f / 255.0f, 142.0f / 255.0f, 148.0f / 255.0f, 1.0f,
        };
        CGFloat locations[2] = { 0.0f, 1.0f };
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        _blackGradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, 2);
        CGColorSpaceRelease(colorSpace);
    }
    return _blackGradient;
}

-(CGGradientRef)whiteGradient
{
    if (nil == _whiteGradient)
    {
        CGFloat colors[8] = {
            248.0f / 255.0f, 250.0f / 255.0f, 247.0f / 255.0f, 1.0f,
            253.0f / 255.0f, 255.0f / 255.0f, 252.0f / 255.0f, 1.0f,
        };
        CGFloat locations[2] = { 0.0f, 1.0f };
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        _whiteGradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, 2);
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
    CGFloat startX = CGRectGetMinX(rect);
    CGFloat startY = CGRectGetMinY(rect);
    NSLog(@"startX %f, startY %f, width %f, height %f", startX, startY, width, height);
    
    for (int rank = 0; rank < 8; ++rank) {
        for (int file = 0; file < 8; ++ file) {
            CGRect r = CGRectMake(startX + width * file, startY + height * rank, width, height);
            NSLog(@"Drawing a gradient in %@", NSStringFromCGRect(r));
            [self drawGradientRect:r forBlackSide:!(file%2==rank%2)];
        }
    }
}

@end

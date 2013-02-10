//
//  C2Board.m
//  chess2
//
//  Created by Berkus on 10 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2Board.h"
#import "C2BoardState.h"
#import "C2Piece.h"

@implementation C2Board {
    CGGradientRef _whiteGradient;
    CGGradientRef _blackGradient;
    C2BoardState* board;
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
    CGPoint startPoint = rect.origin;
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
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

- (void)setState:(C2BoardState*)state;
{
    self->board = state;
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
    
    // Draw the board (only in one orientation atm).
    for (int rank = 0; rank < 8; ++rank) {
        for (int file = 0; file < 8; ++ file) {
            CGRect r = CGRectMake(startX + width * file, startY + height * rank, width, height);
            [self drawGradientRect:r forBlackSide:!(file%2==rank%2)];
        }
    }
    
    // Draw the pieces.
    if (!self->board)
        return;

    for (int rank = 0; rank < 8; ++rank) {
        for (int file = 0; file < 8; ++ file) {
            CGPoint p = CGPointMake(startX + width * file, startY + height * rank);
            CGSize s = CGSizeMake(width, height);
            [[self->board pieceAtRank:rank andFile:file] drawAt:p withSize:s];
        }
    }
}

@end

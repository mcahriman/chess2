//
//  C2Rook.m
//  chess2
//
//  Created by Berkus on 10 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2Rook.h"

@implementation C2Rook {
    UIImage* image;
}

- (C2Piece*)initWithColor:(int)color;
{
    self = [super initWithColor:color];
    self->image = [UIImage imageNamed:@"black_rook.png"];
    return self;
}

- (void)drawAt:(CGPoint)location withSize:(CGSize)size;
{
    NSLog(@"Rook is requested to draw itself at %@ with size %@", NSStringFromCGPoint(location), NSStringFromCGSize(size));
    CGRect rect = {location, size};
    [self->image drawInRect:rect];
}

@end

//
//  C2Piece.m
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2Piece.h"

@implementation C2Piece {
    UIImage* m_image;
}

@synthesize image = m_image;

- (C2Piece*)initWithColor:(int)color;
{
	self.side = color;
	return self;
}

- (NSArray*)pseudoLegalMoves;
{
    return [[NSArray alloc] init];
}

- (BOOL)canJumpOverOthers;
{
	return NO;
}

- (void)drawAt:(CGPoint)location withSize:(CGSize)size;
{
    CGRect rect = {location, size};
    [self.image drawInRect:rect];
}

@end

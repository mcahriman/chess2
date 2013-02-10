//
//  C2Piece.m
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2Piece.h"

@implementation C2Piece

- (NSArray*)pseudoLegalMoves;
{
    return [[NSArray alloc] init];
}

- (BOOL)canJumpOverOthers;
{
	return NO;
}

@end

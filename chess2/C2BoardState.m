//
//  C2BoardState.m
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2BoardState.h"
#import "C2Piece.h"

@implementation C2BoardState {
	C2Piece* board[8][8];
}

- (C2BoardState*)initWithInitialState;
{
    return self;
}

- (C2BoardState*)makeMove:(C2Move*)move;
{
	return nil;
}

- (BOOL)isLegalMove:(C2Move*)move;
{
	return NO;
}

@end

//
//  C2BoardState.m
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2BoardState.h"
#import "C2Piece.h"
#import "C2Empty.h"
#import "C2Pawn.h"
#import "C2Rook.h"
#import "C2Knight.h"
#import "C2Bishop.h"
#import "C2Queen.h"
#import "C2King.h"

@implementation C2BoardState {
	C2Piece* board[8][8];
}

- (C2BoardState*)initWithInitialState;
{
	board[0][0] = board[0][7] = [[C2Rook alloc] initWithColor:WHITE];
	board[0][1] = board[0][6] = [[C2Knight alloc] initWithColor:WHITE];
	board[0][2] = board[0][5] = [[C2Bishop alloc] initWithColor:WHITE];
	board[0][3] = [[C2Queen alloc] initWithColor:WHITE];
	board[0][4] = [[C2King alloc] initWithColor:WHITE];
	for (int file = 0; file < 8; ++file)
		board[1][file] = [[C2Pawn alloc] initWithColor:WHITE];

	board[7][0] = board[7][7] = [[C2Rook alloc] initWithColor:BLACK];
	board[7][1] = board[7][6] = [[C2Knight alloc] initWithColor:BLACK];
	board[7][2] = board[7][5] = [[C2Bishop alloc] initWithColor:BLACK];
	board[7][3] = [[C2Queen alloc] initWithColor:BLACK];
	board[7][4] = [[C2King alloc] initWithColor:BLACK];
	for (int file = 0; file < 8; ++file)
		board[6][file] = [[C2Pawn alloc] initWithColor:BLACK];

	for (int rank = 2; rank < 6; ++rank)
		for (int file = 0; file < 8; ++file)
			board[rank][file] = [[C2Empty alloc] init];

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

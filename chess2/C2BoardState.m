//
//  C2BoardState.m
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2BoardState.h"

static Square_t initialBoardState [8][8] =
{
    {{ROOK, WHITE, NO}, {KNIGHT, WHITE, NO}, {BISHOP, WHITE, NO}, {QUEEN, WHITE, NO}, {KING, WHITE, NO}, {BISHOP, WHITE, NO}, {KNIGHT, WHITE, NO}, {ROOK, WHITE, NO}},
    {{PAWN, WHITE, NO}, {PAWN, WHITE, NO}, {PAWN, WHITE, NO}, {PAWN, WHITE, NO}, {PAWN, WHITE, NO}, {PAWN, WHITE, NO}, {PAWN, WHITE, NO}, {PAWN, WHITE, NO}},
    {{0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}},
    {{0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}},
    {{0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}},
    {{0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}, {0, 0, NO}},
    {{PAWN, BLACK, NO}, {PAWN, BLACK, NO}, {PAWN, BLACK, NO}, {PAWN, BLACK, NO}, {PAWN, BLACK, NO}, {PAWN, BLACK, NO}, {PAWN, BLACK, NO}, {PAWN, BLACK, NO}},
    {{ROOK, BLACK, NO}, {KNIGHT, BLACK, NO}, {BISHOP, BLACK, NO}, {QUEEN, BLACK, NO}, {KING, BLACK, NO}, {BISHOP, BLACK, NO}, {KNIGHT, BLACK, NO}, {ROOK, BLACK, NO}}
};

@implementation C2BoardState
{
	Square_t board [8][8];
    BOOL     targets [8][8];
}

- (C2BoardState*)initWithInitialState;
{
	memcpy (board, initialBoardState, sizeof (board));
    memset (targets, 0, sizeof (targets));
    
    return self;
}

- (NSInteger)pieceAtRank:(NSInteger)rank andFile:(NSInteger)file;
{
    assert((rank >= 0) && (rank <= 7));
    assert((file >= 0) && (file <= 7));
    
    return (board [rank][file].piece | board [rank][file].color);
}

- (BOOL)moveTargetAtRank:(NSInteger)rank andFile:(NSInteger)file;
{
    return NO;
}

- (void)selectAtRank:(NSInteger)rank andFile:(NSInteger)file;
{
    
}

@end

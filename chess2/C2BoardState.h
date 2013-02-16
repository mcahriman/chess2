//
//  C2BoardState.h
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    NONE   = 0x00,
    PAWN   = 0x01,
    KNIGHT = 0x02,
    BISHOP = 0x03,
    ROOK   = 0x04,
    QUEEN  = 0x05,
    KING   = 0x06
} Piece_t;

typedef enum
{
    BLACK = 0x00,
    WHITE = 0x10
} Piece_color_t;

typedef struct
{
    Piece_t       piece;
    Piece_color_t color;
    BOOL          moved;
} Square_t;

//
// Board state representation.
// Can be used for evaluating feasibility as well as legality of the moves.
// This state is used by UI C2Board to display the current position.
//
@interface C2BoardState : NSObject

/**
 * Create a board in initial state.
 */
- (C2BoardState*)initWithInitialState;

- (NSInteger)pieceAtRank:(NSInteger)rank andFile:(NSInteger)file;

- (BOOL)moveTargetAtRank:(NSInteger)rank andFile:(NSInteger)file;

- (void)selectAtRank:(NSInteger)rank andFile:(NSInteger)file;

@end

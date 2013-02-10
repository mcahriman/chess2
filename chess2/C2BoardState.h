//
//  C2BoardState.h
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import <Foundation/Foundation.h>

@class C2Move;

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

/**
 * Make a move in the current board state.
 * Returns a new state or nil if the move is not valid.
 */
- (C2BoardState*)makeMove:(C2Move*)move;

/**
 * Check if the move is valid in current board position.
 * Takes into account piece movement rules.
 */
- (BOOL)isLegalMove:(C2Move*)move;

@end

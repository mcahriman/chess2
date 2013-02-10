//
//  C2Piece.h
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "C2Move.h"

/**
 * Abstract interface class for board pieces.
 */
@interface C2Piece : NSObject

@property (nonatomic, assign) CGPoint position;

/**
 * Return all possible moves this piece could make from its current position without
 * paying attention to the board state.
 * Implemented in subclasses with specific moves for particular pieces.
 */
- (NSArray*)pseudoLegalMoves;

/**
 * Rules movement function: returns true for KNIGHT and false for everybody else.
 * FIXME: needed?
 */
- (BOOL)canJumpOverOthers;

@end
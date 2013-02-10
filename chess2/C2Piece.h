//
//  C2Piece.h
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "C2Move.h"

// Sides
#define WHITE 1
#define BLACK 2

/**
 * Abstract interface class for board pieces.
 */
@interface C2Piece : NSObject

@property (nonatomic, retain) UIImage* image;
@property (atomic, assign) NSInteger side;     // WHITE or BLACK
@property (atomic, assign) NSInteger position; // 0x88 board position

- (C2Piece*)initWithColor:(int)color;

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

/**
 * Presentation layer: causes piece to draw it's presentation at the given location in the current UI graphics context.
 */
- (void)drawAt:(CGPoint)location withSize:(CGSize)size;

@end

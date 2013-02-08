//
//  C2Knight.h
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2Piece.h"

@interface C2Knight : C2Piece

- (NSArray*)legalMoves; // implement to return an array of all possible moves that knight does, not fully filtered for legality (the Board would filter it further)

@end

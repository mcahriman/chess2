//
//  C2Piece.h
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "C2Move.h"

@interface C2Piece : NSObject

@property (nonatomic, assign) CGPoint position;

- (NSArray*)legalMoves;

@end

//
//  C2Board.h
//  chess2
//
//  Created by Berkus on 10 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "C2BoardState.h"

@class C2BoardState;

@interface C2Board : UIView

- (void)setState:(C2BoardState*)state;

- (void)drawPiece:(Piece_t)piece atPoint:(CGPoint)point withSize:(CGSize)size;

@end

//
//  C2BoardState.h
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "C2Move.h"

//
// Board state representation.
// Can be used for evaluating feasibility as well as legality of the moves.
//
@interface C2BoardState : NSObject

- (BOOL)isLegalMove:(C2Move*)move;

@end

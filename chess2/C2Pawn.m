//
//  C2Pawn.m
//  chess2
//
//  Created by Berkus on 10 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2Pawn.h"

@implementation C2Pawn

- (C2Piece*)initWithColor:(int)color;
{
    self = [super initWithColor:color];
    if (color == WHITE) {
        self.image = [UIImage imageNamed:@"white_pawn.png"];
    } else {
        self.image = [UIImage imageNamed:@"black_pawn.png"];
    }
    return self;
}


@end

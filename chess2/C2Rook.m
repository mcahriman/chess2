//
//  C2Rook.m
//  chess2
//
//  Created by Berkus on 10 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2Rook.h"

@implementation C2Rook

- (C2Piece*)initWithColor:(int)color;
{
    self = [super initWithColor:color];
    if (color == WHITE) {
        self.image = [UIImage imageNamed:@"white_rook.png"];
    } else {
        self.image = [UIImage imageNamed:@"black_rook.png"];
    }
    return self;
}


@end

//
//  C2Knight.m
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2Knight.h"

@implementation C2Knight

- (C2Piece*)initWithColor:(int)color;
{
    self = [super initWithColor:color];
    if (color == WHITE) {
        self.image = [UIImage imageNamed:@"white_knight.png"];
    } else {
        self.image = [UIImage imageNamed:@"black_knight.png"];
    }
    return self;
}

- (NSArray*)legalMoves;
{
    return [[NSArray alloc] init];
}

- (BOOL)canJumpOverOthers;
{
	return YES;
}

@end

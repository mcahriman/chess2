//
//  C2Queen.m
//  chess2
//
//  Created by Berkus on 10 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2Queen.h"

@implementation C2Queen

- (C2Piece*)initWithColor:(int)color;
{
    self = [super initWithColor:color];
    if (color == WHITE) {
        self.image = [UIImage imageNamed:@"white_queen.png"];
    } else {
        self.image = [UIImage imageNamed:@"black_queen.png"];
    }
    return self;
}

@end

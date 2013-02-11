//
//  C2King.m
//  chess2
//
//  Created by Berkus on 10 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2King.h"

@implementation C2King

- (C2Piece*)initWithColor:(int)color;
{
    self = [super initWithColor:color];
    if (color == WHITE) {
        self.image = [UIImage imageNamed:@"white_king.png"];
    } else {
        self.image = [UIImage imageNamed:@"black_king.png"];
    }
    return self;
}

@end

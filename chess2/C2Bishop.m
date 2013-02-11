//
//  C2Bishop.m
//  chess2
//
//  Created by Berkus on 10 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2Bishop.h"

@implementation C2Bishop

- (C2Piece*)initWithColor:(int)color;
{
    self = [super initWithColor:color];
    if (color == WHITE) {
        self.image = [UIImage imageNamed:@"white_bishop.png"];
    } else {
        self.image = [UIImage imageNamed:@"black_bishop.png"];
    }
    return self;
}

@end

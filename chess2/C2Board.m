//
//  C2Board.m
//  chess2
//
//  Created by Berkus on 10 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2Board.h"
#import "C2BoardState.h"

@implementation C2Board
{
    C2BoardState *board;
    UIImage      *boardImage;
    NSDictionary *pieceImages;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {

    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder;
{
    self = [super initWithCoder:decoder];
    
    if (self)
    {
        pieceImages = [[NSDictionary alloc] initWithObjectsAndKeys:
                       [UIImage imageNamed:@"white_pawn.png"],   @(PAWN | WHITE),
                       [UIImage imageNamed:@"white_knight.png"], @(KNIGHT | WHITE),
                       [UIImage imageNamed:@"white_bishop.png"], @(BISHOP | WHITE),
                       [UIImage imageNamed:@"white_rook.png"],   @(ROOK | WHITE),
                       [UIImage imageNamed:@"white_queen.png"],  @(QUEEN | WHITE),
                       [UIImage imageNamed:@"white_king.png"],   @(KING | WHITE),
                       [UIImage imageNamed:@"black_pawn.png"],   @(PAWN | BLACK),
                       [UIImage imageNamed:@"black_knight.png"], @(KNIGHT | BLACK),
                       [UIImage imageNamed:@"black_bishop.png"], @(BISHOP | BLACK),
                       [UIImage imageNamed:@"black_rook.png"],   @(ROOK | BLACK),
                       [UIImage imageNamed:@"black_queen.png"],  @(QUEEN | BLACK),
                       [UIImage imageNamed:@"black_king.png"],   @(KING | BLACK),
                       nil];
        boardImage = [UIImage imageNamed:@"board_iphone.png"];
    }
    
    return self;
}

- (void)setState:(C2BoardState*)state;
{
    self->board = state;
}

- (void)drawPiece:(Piece_t)piece atPoint:(CGPoint)point withSize:(CGSize)size;
{
    if (piece)
    {
        UIImage *image = [pieceImages objectForKey:[NSNumber numberWithUnsignedInt:piece]];
        CGRect rect = {point, size};
        
        assert(image != nil);
        
        [image drawInRect:rect];
    }
}

// @Fixme: this depends on the device metrics
#define TOP_OFFSET 21
#define LEFT_OFFSET 21

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Divide rect into 8x8 subrects
    CGFloat width = (CGRectGetMaxX(rect) - CGRectGetMinX(rect) - 2*LEFT_OFFSET)/8.0;
    CGFloat height = (CGRectGetMaxY(rect) - CGRectGetMinY(rect) - 2*TOP_OFFSET)/8.0;
    CGFloat startX = CGRectGetMinX(rect) + LEFT_OFFSET;
    CGFloat startY = CGRectGetMinY(rect) + TOP_OFFSET;
    
    // Draw the board (only in one orientation atm).
    [boardImage drawInRect:rect];
    
    // Draw the pieces.
    if (!self->board)
        return;

    for (int rank = 0; rank < 8; ++rank)
    {
        for (int file = 0; file < 8; ++ file)
        {
            CGPoint p = CGPointMake(startX + width * file, startY + height * rank);
            CGSize s = CGSizeMake(width, height);
            
            [self drawPiece:[board pieceAtRank:rank andFile:file] atPoint:p withSize:s];
        }
    }
}

@end

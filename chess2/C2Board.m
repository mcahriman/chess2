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
    int           TOP_OFFSET;
    int           LEFT_OFFSET;
    CGFloat       FONT_SIZE;
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
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            boardImage = [UIImage imageNamed:@"board_iphone.png"];
            TOP_OFFSET = 21;
            LEFT_OFFSET = 21;
            FONT_SIZE = 14.0;
        }
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        {
            boardImage = [UIImage imageNamed:@"board_ipad.png"];
            TOP_OFFSET = 50;
            LEFT_OFFSET = 50;
            FONT_SIZE = 21.0;
        }
    }
    
    return self;
}

- (void)setState:(C2BoardState*)state;
{
    board = state;
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

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Divide rect into 8x8 subrects
    CGFloat width = (CGRectGetMaxX(rect) - CGRectGetMinX(rect) - 2*LEFT_OFFSET)/8.0;
    CGFloat height = (CGRectGetMaxY(rect) - CGRectGetMinY(rect) - 2*TOP_OFFSET)/8.0;
    CGFloat startX = CGRectGetMinX(rect);
    CGFloat endX = CGRectGetMaxX(rect) - LEFT_OFFSET;
    CGFloat startY = CGRectGetMinY(rect);
    CGFloat endY = CGRectGetMaxY(rect) - TOP_OFFSET;
    
    // Draw the board (only in one orientation atm).
    [boardImage drawInRect:rect];
    
    // Draw board text labels, rank and file.
    UIFont* font = [UIFont systemFontWithSize:FONT_SIZE];

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextClipToRect(context, rect);

    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetRGBFillColor(context, /*R*/0.7, /*G*/0.7, /*B*/0.7, /*A*/0.7);

    for (int rank = 0; rank < 8; ++rank)
    {
        NSString* ranks = [NSString stringWithFormat:@"%d", rank+1];
        CGSize dim = [ranks sizeWithFont:font];
        CGPoint locl = CGPointMake(startX + (LEFT_OFFSET - dim.width)/2, startY + TOP_OFFSET + dim.height/2 + height * rank);
        CGPoint locr = CGPointMake(endX   + (LEFT_OFFSET - dim.width)/2, startY + TOP_OFFSET + dim.height/2 + height * rank);
        [ranks drawAtPoint:locl withFont:font];
        [ranks drawAtPoint:locr withFont:font];
    }
    for (int file = 0; file < 8; ++ file)
    {
        NSString* files = [NSString stringWithFormat:@"%c", "hgfedcba"[file]];
        CGSize dim = [files sizeWithFont:font];
        CGPoint loct = CGPointMake(startX + LEFT_OFFSET + (width - dim.width)/2 + width * file, startY + (TOP_OFFSET - dim.height)/2);
        CGPoint locb = CGPointMake(startX + LEFT_OFFSET + (width - dim.width)/2 + width * file, endY   + (TOP_OFFSET - dim.height)/2);
        [files drawAtPoint:loct withFont:font];
        [files drawAtPoint:locb withFont:font];
    }

    CGContextRestoreGState(context);

    // Draw the pieces.
    if (!board)
        return;

    for (int rank = 0; rank < 8; ++rank)
    {
        for (int file = 0; file < 8; ++ file)
        {
            CGPoint p = CGPointMake(startX + LEFT_OFFSET + width * file, startY + TOP_OFFSET + height * rank);
            CGSize s = CGSizeMake(width, height);
            
            [self drawPiece:[board pieceAtRank:rank andFile:file] atPoint:p withSize:s];
        }
    }
}

@end

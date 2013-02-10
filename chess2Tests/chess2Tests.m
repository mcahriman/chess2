//
//  chess2Tests.m
//  chess2Tests
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "chess2Tests.h"
#import "C2BoardState.h"
#import "C2Move.h"

@implementation chess2Tests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testClassicMovesInInitialBoardState
{
	C2BoardState* bs = [[C2BoardState alloc] initWithInitialState];
	// WHITE
	// Pawns
	STAssertTrue([bs isLegalMove:[C2Move from:@"E2" to:@"E4"]], @"Pawns can go from start position");
	// Knights
	// Rooks
	// Bishops
	// Queen
	// King
	// BLACK
	// Pawns
	// Knights
	// Rooks
	// Bishops
	// Queen
	// King
}

- (void)testInvalidMovesInInitialBoardState
{
	C2BoardState* bs = [[C2BoardState alloc] initWithInitialState];
	// WHITE
	// Pawns
	STAssertTrue([bs isLegalMove:[C2Move from:@"E2" to:@"E4"]], @"Pawns can go from start position");
}

@end

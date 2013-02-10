//
//  C2Move.h
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import <Foundation/Foundation.h>

//
// Represents a move from source square to target in 0x88 board notation.
//
@interface C2Move : NSObject

@property (nonatomic, assign) NSInteger from;
@property (nonatomic, assign) NSInteger to;

// Construct a 0x88 NSInteger from rankAndFile notation.
+ (NSInteger)rankAndFileTo0x88:(NSString*)rankAndFile;

// Construct a move from:"E2" to:"E4"
+ (C2Move*)from:(NSString*)from to:(NSString*)to;

@end

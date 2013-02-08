//
//  C2Move.h
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import <Foundation/Foundation.h>

// Represents a move from source square to target.
@interface C2Move : NSObject

@property (nonatomic, assign) CGPoint from;
@property (nonatomic, assign) CGPoint to;
//todo: add setter=setFrom:(id) and allow passing in string like "A2" as well as coords (0,1)

@end

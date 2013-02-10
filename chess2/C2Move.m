//
//  C2Move.m
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2Move.h"

@implementation C2Move

+ (C2Move*)moveFrom:(NSString*)rankAndFileFrom to:(NSString*)rankAndFileTo;
{
	C2Move* m = [[C2Move alloc] init];
	m.from = [C2Move rankAndFileTo0x88:rankAndFileFrom];
	m.to = [C2Move rankAndFileTo0x88:rankAndFileTo];
	return m;
}

+ (NSInteger)rankAndFileTo0x88:(NSString*)rankAndFile;
{
	
}

@end

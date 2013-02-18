//
//  C2ViewController.m
//  chess2
//
//  Created by Berkus on 8 Feb 13.
//  Copyright (c) 2013 Berkus. All rights reserved.
//

#import "C2ViewController.h"
#import "C2BoardState.h"

@interface C2ViewController ()

@end

@implementation C2ViewController

@synthesize board = _board;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	C2BoardState* bs = [[C2BoardState alloc] initWithInitialState];
    [_board setState:bs];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

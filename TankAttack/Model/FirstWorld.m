//
//  FirstWorld.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/15/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "FirstWorld.h"

@implementation FirstWorld

- (void)createInitialSprites {
    
    [self createMinionSprites];

}

- (void)createMinionSprites {
    
    Minion *minion = [[Minion alloc] initWithX:300 WithY:300 WithLeftXLimit:50 WithRightXLimit:200 WithIsGoingRight:true IntoWorld:self];

}

@end

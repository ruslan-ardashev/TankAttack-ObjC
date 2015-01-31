//
//  SillyBoss.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/30/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "World.h"
#import "SillyBoss.h"

@implementation SillyBoss {
    
    double _leftLimit, _rightLimit;
    
}

- (id)initWithX:(double)x WithY:(double)y IntoWorld:(World *)world WithLeftLimit:(double)left WithRightLimit:(double)right {
    
    if (self = [super initWithX:x WithY:y IntoWorld:world]) {
        
        _leftLimit = left;
        _rightLimit = right;
        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}

- (void)updateEnemyXYWithPlayerX:(CGFloat)playerX {
    
    if (![self isAlive]) {
        
        return;
        
    }
    
    // Eliminate jitter
    if (ABS(playerX - [self position].x) < 1) {
        
        return;
        
    }
    
    else if ((playerX > [self position].x) && ([self position].x < _rightLimit)) {
        
        [self goRight];
        
    }
    
    else if ((playerX < [self position].x)
             &&
             ([self position].x > _leftLimit)) {
        
        [self goLeft];
        
    }
    
}

@end

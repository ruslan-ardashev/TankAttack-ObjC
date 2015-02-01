//
//  Minion.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "Minion.h"
#import "World.h"

@implementation Minion {
    
    double _leftXLimit, _rightXLimit;
    Boolean _isGoingRight;
    
}

- (id)initWithX:(double)x WithY:(double)y WithLeftXLimit:(double)leftXLimit WithRightXLimit:(double)rightXLimit WithIsGoingRight:(Boolean)isGoingRight IntoWorld:(id)world {
    
    self = [super initWithImageNamed:MINION_IMAGE_NAME];
    
    if (self) {
        
        _rightXLimit = rightXLimit;
        _leftXLimit = leftXLimit;
        
        [self setFollowsPlayer:false];
        [self initHealthBar];
        [self setPosition:CGPointMake(x, y)];
        [self setScale:SMALL_TANK_SCALE_FACTOR];
        
        [world addChild:self];
        return self;
        
    }
    
    else {
        
        return nil;
    
    }
    
}

- (void)initHealthBar {
    
    HealthBar *hb = [[HealthBar alloc] initWithHealth:100.0 WithParentWidth:self.size.width WithParentHeight:self.size.height WithParent:self];
    [self setHealthBar:hb];
    
}

- (void)updateEnemyXY {
    
    if (![self isAlive]) {
        
        return;
        
    }
    
    if (_isGoingRight) {
        
        CGFloat rightDestination = [self position].x + [self size].width/2 + [GameViewController minionSpeed];
        
        if (rightDestination >= _rightXLimit) {
            
            _isGoingRight = false;
            [self goLeft];
            
        }
        // Update x ++
        
        else {
            
            [self goRight];
            
        }
        
    }
    
    else {
        
        // Update x --
        CGFloat leftDestination = [self position].x - [self size].width/2 - [GameViewController minionSpeed];
        
        if (leftDestination <= _leftXLimit) {
            
            _isGoingRight = true;
            [self goRight];
            
        }
        
        else {
            
            [self goLeft];
            
        }
        
    }
    
}

- (void)goRight {
    
    CGPoint newPosition = CGPointMake([self position].x + [GameViewController minionSpeed], [self position].y);
    [self setPosition:newPosition];
    
}

- (void)goLeft {
    
    CGPoint newPosition = CGPointMake([self position].x - [GameViewController minionSpeed], [self position].y);
    [self setPosition:newPosition];
    
}

- (Boolean)isFiring {
    
    if ([self isAlive]) {
        
        return ((arc4random() % 100)/100.0f < 0.13);
        
    }
    
    else {
        
        return false;
        
    }
    
}

@end




















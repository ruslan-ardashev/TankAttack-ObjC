//
//  Player.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/15/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "Player.h"

@implementation Player {
    
    CGFloat _bottomBoundary, _topBoundary, _leftBoundary, _rightBoundary;
    
}


- (id)initWithLocation:(CGPoint)location WithBottomBoundary:(CGFloat)bottomBoundary WithTopBoundary:(CGFloat)topBoundary WithLeftBoundary:(CGFloat)leftBoundary WithRightBoundary:(CGFloat)rightBoundary {
    
    self = [super initWithImageNamed:@"tank"];
    
    if (self != nil) {
        
        _bottomBoundary = bottomBoundary;
        
        [self setName:@"playerSprite"];
        [self setScale:0.25];
        [self setPosition:location];
        [self setUserInteractionEnabled:NO];
        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}

- (void)updateLocationWithX:(double)xIncrement WithY:(double)yIncrement {
    
    CGPoint position = [self position];
    CGFloat newX = position.x + xIncrement*PLAYER_SPEED;
    CGFloat newY = position.y + yIncrement*PLAYER_SPEED;
    CGPoint newPosition = CGPointMake(newX, newY);
    
    [self setPosition:newPosition];
    
}


@end

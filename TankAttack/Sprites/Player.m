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
    
    self = [super initWithImageNamed:PLAYER_IMAGE_NAME];
    
    if (self != nil) {
        
        [self setIsAlive:true];
        
        _topBoundary = topBoundary;
        _bottomBoundary = bottomBoundary;
        _leftBoundary = leftBoundary;
        _rightBoundary = rightBoundary;
        
        [self setName:@"playerSprite"];
        [self initHealthBar];                       // HAS to go before scaling
        [self setScale:SMALL_TANK_SCALE_FACTOR];
        [self setPosition:location];
        [self setUserInteractionEnabled:NO];
        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}


- (void)initHealthBar {
        
    HealthBar *hb;
    
    if ([GameViewController difficulty] == 1) {
        
        hb = [[HealthBar alloc] initWithHealth:200.0 WithParentWidth:self.size.width WithParentHeight:self.size.height WithParent:self];
        
    }
    
    else if ([GameViewController difficulty] == 2) {
        
        hb = [[HealthBar alloc] initWithHealth:100.0 WithParentWidth:self.size.width WithParentHeight:self.size.height WithParent:self];
        
    }
    
    else if ([GameViewController difficulty] == 3) {
        
        hb = [[HealthBar alloc] initWithHealth:50.0 WithParentWidth:self.size.width WithParentHeight:self.size.height WithParent:self];
        
    }
    
    [self setHealthBar:hb];
    
}

- (void)updateLocationWithX:(double)xIncrement WithY:(double)yIncrement {
    
    CGPoint position = [self position];
    CGFloat widthTank = [self size].width/2;
    
    CGFloat newX = [self updateXUsingPosition:position WithWidth:widthTank WithXIncrement:xIncrement];
    CGFloat newY = [self updateYUsingPosition:position WithWidth:widthTank WithYIncrement:yIncrement];
    
    CGPoint newPosition = CGPointMake(newX, newY);

    [self setPosition:newPosition];
    
}

- (CGFloat)updateXUsingPosition:(CGPoint)position WithWidth:(CGFloat)widthTank WithXIncrement:(CGFloat)xIncrement {
    
    CGFloat newX;
    
    if (position.x + xIncrement*PLAYER_SPEED + widthTank > _rightBoundary) {
        
        newX = position.x;
        
    }
    
    else if (position.x+ xIncrement*PLAYER_SPEED - widthTank < _leftBoundary) {
        
        newX = position.x;
        
    }
    
    else {
        
        newX = position.x + xIncrement*PLAYER_SPEED;
        
    }
    
    return newX;
    
}

- (CGFloat)updateYUsingPosition:(CGPoint)position WithWidth:(CGFloat)widthTank WithYIncrement:(CGFloat)yIncrement {
    
    CGFloat newY;
    
    if (position.y + yIncrement*PLAYER_SPEED + widthTank > _topBoundary) {
        
        newY = position.y;
        
    }
    
    else if (position.y + yIncrement*PLAYER_SPEED - widthTank < _bottomBoundary) {
        
        newY = position.y;
        
    }
    
    else {
        
        newY = position.y + yIncrement*PLAYER_SPEED;
        
    }
    
    return newY;
    
}

- (void)checkIfAlive {
    
    if ([[self healthBar] health] == 0.0) {
        
        [self setIsAlive:false];
        [self death];
        
    }
    
}



@end























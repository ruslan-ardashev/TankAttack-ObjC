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
        
        [self initializeScreenRelatedParametersWithLocation:location];
        
        [self setUserInteractionEnabled:NO];
        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}

- (void)initializeScreenRelatedParametersWithLocation:(CGPoint)location {
    
    [self setScale:[ScalingManager smallTankScaleFactor]];
    
    // 6 Plus fractional size: 0.154589
    // 6 fractional size: 0.170667
    // 5 fractional size: 0.200000
    // 4S fractional size: 0.200000
    
    // NSLog(@"size player: %f, %f, fractional size: %f", self.size.width, self.size.height, self.size.width / [ScalingManager size].width);
    
    [self setPosition:location];
    
    // 6P x location: 207.000000, y location: 245.333333, % up screen: 0.333333, % width screen: 0.500000
    // 6  x location: 187.500000, y location: 222.333333, % up screen: 0.333333, % width screen: 0.500000
    // 5  x location: 160.000000, y location: 189.333328, % up screen: 0.333333, % width screen: 0.500000
    // 4S x location: 160.000000, y location: 160.000000, % up screen: 0.333333, % width screen: 0.500000
    
    // NSLog(@"x location: %f, y location: %f, %% up screen: %f, %% width screen: %f", location.x, location.y, location.y / [ScalingManager size].height, location.x / [ScalingManager size].width);
    
}


- (void)initHealthBar {
    
    HealthBar *hb = [[HealthBar alloc] initWithHealth:100.0 WithParentWidth:self.size.width WithParentHeight:self.size.height WithParent:self];
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























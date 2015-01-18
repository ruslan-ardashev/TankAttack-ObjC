//
//  HealthBar.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "HealthBar.h"

@implementation HealthBar {
    
    Boolean _didCheatToIncreaseHealth;
    
    double _initialHealth;
    SKSpriteNode *_redBar, *_greenBar;
    double _widthBar;
    
}

- (id)initWithHealth:(double)health WithWidth:(double)width WithHeight:(double)height WithParent:(SKSpriteNode *)parent{
    
    self = [super init];
    
    if (self) {
        
        [self setZPosition:2.0];
        [self setInternalParametersWithHealth:health WithWidth:width];
        [self initRectanglesWithWidth:width WithHeight:height WithParent:parent];
        [parent addChild:self];
        
        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}

- (void)setInternalParametersWithHealth:(double)health WithWidth:(double)width {
    
    _health = health;
    _initialHealth = health;
     _didCheatToIncreaseHealth = false;
    _widthBar = width;
    
}

- (void)initRectanglesWithWidth:(double)width WithHeight:(double)height WithParent:(SKSpriteNode *)parent{
    
    _redBar = [[SKSpriteNode alloc] initWithColor:[UIColor redColor] size:CGSizeMake(width, height)];
    
    if ([[parent name] isEqualToString:@"playerSprite"]) {                  // Player
        
        [_redBar setPosition:CGPointMake(0, -[parent size].height*2/6)];    // -2/3's up the bottom half of the parent
        
    }
    
    else {                                                                  // Enemy
        
        [_redBar setPosition:CGPointMake(0, [parent size].height*2/6)];     // 2/3's up the top half of the parent
        
    }
    
    _greenBar = [[SKSpriteNode alloc] initWithColor:[UIColor greenColor] size:CGSizeMake(width, height)];
    
    if ([[parent name] isEqualToString:@"playerSprite"]) {                  // Player
        
        [_greenBar setPosition:CGPointMake(0, -[parent size].height*2/6)];    // -2/3's up the bottom half of the parent
        
    }
    
    else {                                                                  // Enemy
        
        [_greenBar setPosition:CGPointMake(0, [parent size].height*2/6)];     // 2/3's up the top half of the parent
        
    }
    
    [self addChild:_redBar];
    [self addChild:_greenBar];
    
}

- (void)decrementHealthByAmount:(double)amount {
    
    _health -= amount;
    [self readjustSizeOfRectanglesByAmount:amount];
    
}

- (void)readjustSizeOfRectanglesByAmount:(double)amount {
    
    if (!_didCheatToIncreaseHealth) {
        
        double percent;
        
        if (amount == -1.0) {
            
            percent = 0.0;          // Instant death case
            
        }
        
        else {
            
            percent = _health / _initialHealth;
            
        }
        
        [_greenBar setSize:CGSizeMake(_widthBar * percent, [_greenBar size].height)];
        
    }
    
    else {
        
        // Cheated
        [_greenBar setSize:CGSizeMake(_widthBar, [_greenBar size].height)];
        
    }
    
}

- (void)instantDeath {
    
    if (!_didCheatToIncreaseHealth) {
        
        _health = 0;
        [self readjustSizeOfRectanglesByAmount:-1.0];
        
    }
    
}

- (void)infiniteHealth {
    
    _health = DBL_MAX;
    _didCheatToIncreaseHealth = true;
    
}

@end




















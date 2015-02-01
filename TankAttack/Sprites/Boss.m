//
//  Boss.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "Boss.h"
#import "World.h"

@implementation Boss

- (id)initWithX:(double)x WithY:(double)y IntoWorld:(World *)world {
    
    self = [super initWithImageNamed:BOSS_IMAGE_NAME];
    
    if (self) {
        
        
        [self initHealthBar];
        [self setPosition:CGPointMake(x, y)];
        [self setScale:BOSS_TANK_SCALE_FACTOR];
        
//        [world addChild:self];
        
        [world performSelector:@selector(addChild:) withObject: self];
        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}

- (void)replaceImageWithFire {
    
    [self setTexture:[SKTexture textureWithImageNamed:@"bossDeath"]];
    
}

- (void)initHealthBar {
    
    HealthBar *hb = [[HealthBar alloc] initWithHealth:600.0 WithParentWidth:self.size.width WithParentHeight:self.size.height WithParent:self];

    [self setHealthBar:hb];
    
}

- (void)updateEnemyXYWithPlayerX:(CGFloat)playerX {

    if (![self isAlive]) {
        
        return;
        
    }
    
    // Eliminate jitter
    if (ABS(playerX - [self position].x) < 1) {
        
        return;
        
    }
    
    else if (playerX > [self position].x) {
        
        [self goRight];
        
    }
    
    else {
        
        [self goLeft];
        
    }
    
}

- (Boolean)isFiring {
    
    if ([self isAlive]) {
        
        return ((arc4random() % 100)/100.0f < 0.13);
        
    }
    
    else {
        
        return false;
        
    }
    
}

- (void)goRight {
    
    CGPoint newPosition = CGPointMake([self position].x + [GameViewController bossSpeed], [self position].y);
    [self setPosition:newPosition];
    
}

- (void)goLeft {
    
    CGPoint newPosition = CGPointMake([self position].x - [GameViewController bossSpeed], [self position].y);
    [self setPosition:newPosition];
    
}

@end












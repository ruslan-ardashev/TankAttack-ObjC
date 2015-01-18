//
//  Boss.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "Boss.h"

@implementation Boss

- (id)initWithX:(double)x WithY:(double)y IntoWorld:(World *)world {
    
    self = [super initWithImageNamed:MINION_IMAGE_NAME];
    
    if (self) {
        
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

- (void)replaceImageWithFire {
    
    [self setTexture:[SKTexture textureWithImageNamed:@"bossDeath"]];
    
}

- (void)initHealthBar {
    
    HealthBar *hb;
    
    if ([GameViewController difficulty] == 1) {
        
        hb = [[HealthBar alloc] initWithHealth:50.0 WithParentWidth:self.size.width WithParentHeight:self.size.height WithParent:self];
        
    }
    
    else if ([GameViewController difficulty] == 2) {
        
        hb = [[HealthBar alloc] initWithHealth:100.0 WithParentWidth:self.size.width WithParentHeight:self.size.height WithParent:self];
        
    }
    
    else if ([GameViewController difficulty] == 3) {
        
        hb = [[HealthBar alloc] initWithHealth:200.0 WithParentWidth:self.size.width WithParentHeight:self.size.height WithParent:self];
        
    }
    
    [self setHealthBar:hb];
    
}

- (void)updateEnemyXY {
    
    if (![self isAlive]) {
        
        return;
        
    }
    
    NSLog(@"implement boss xy");
    
}

@end

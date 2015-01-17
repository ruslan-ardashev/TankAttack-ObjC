//
//  Enemy.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

- (id)initWithImageNamed:(NSString *)name {
    
    self = [super initWithImageNamed:name];
    
    if (self) {
        
        [self setIsAlive:true];
        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}

- (void)updateEnemyXY {

    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    
}

- (Boolean)isFiring {
    
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    
    return NO;
    
}

- (double)getBulletOffsetX {
    
    return [self position].x;
    
}

- (double)getBulletOffsetY {
    
    return ([self position].y - [self size].height/2);
    
}

- (void)checkForDeathAndReactAppropriately {
    
    if ([[self healthBar] health] <= 0.0) {
        
        SKAction *showFireAndDisappear = [self fireDisplayAndDisappearAction];
        
    }
    
}
                              
- (SKAction *)fireDisplayAndDisappearAction {

    [SKAction performSelector:@selector(replaceImageWithFire) onTarget:self];

    
    
    return nil;
    
}

- (void)replaceImageWithFire {
    
    if (self isKindOfClass:[Boss class]) {
        
        [self setTexture:[SKTexture textureWithImageNamed:@"bossDeath"]];
        
    }
    
    else {
        
        [self setTexture:[SKTexture textureWithImageNamed:@"normalDeath"]];
        
    }
    
    
    
}

void (^blockToDisplayFireThenDisappear)(SKNode *node, CGFloat elapsedTime) = ^(SKNode *node, CGFloat elapsedTime){
    
    
    
};

@end











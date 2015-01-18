//
//  Sprite.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "Sprite.h"



@implementation Sprite

- (void)death {
    
    [self setIsAlive:false];
    SKAction *showFireAndDisappear = [self fireDisplayAndDisappearAction];
    [self runAction:showFireAndDisappear];
    
}

- (SKAction *)fireDisplayAndDisappearAction {
    
    SKAction *replace = [SKAction performSelector:@selector(replaceImageWithFire) onTarget:self];
    SKAction *wait = [SKAction waitForDuration:2.00];
    SKAction *remove = [SKAction removeFromParent];
    
    return [SKAction sequence:@[replace, wait, remove]];
    
}

- (void)replaceImageWithFire {
    
    [self setTexture:[SKTexture textureWithImageNamed:@"normalDeath"]];
    
}

@end

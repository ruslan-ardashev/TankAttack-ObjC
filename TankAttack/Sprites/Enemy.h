//
//  Enemy.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Sprite.h"

@interface Enemy : Sprite

@property (nonatomic) Boolean followsPlayer;

- (id)initWithImageNamed:(NSString *)name;
- (void)updateEnemyXY;
- (void)updateEnemyXYWithPlayerX:(CGFloat)playerX;
- (void)updateEnemyXYWithPlayerX:(CGFloat)playerX WithPlayerY:(CGFloat)playerY;
- (Boolean)isFiring;
- (double)getBulletOffsetX;
- (double)getBulletOffsetY;
- (void)checkForDeathAndReactAppropriately;

@end

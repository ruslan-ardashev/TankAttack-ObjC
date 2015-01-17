//
//  Enemy.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Sprite.h"
#import "Boss.h"

@interface Enemy : Sprite

@property (nonatomic) Boolean isAlive;

- (id)initWithImageNamed:(NSString *)name;
- (void)updateEnemyXY;
- (Boolean)isFiring;
- (double)getBulletOffsetX;
- (double)getBulletOffsetY;
- (void)checkForDeathAndReactAppropriately;

@end

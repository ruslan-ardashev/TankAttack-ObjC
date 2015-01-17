//
//  Enemy.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Enemy : SKSpriteNode

@property (readonly, nonatomic) Boolean isAlive;
- (id)initWithImageNamed:(NSString *)name;
- (void)updateEnemyXY;
- (Boolean)isFiring;
- (double)getBulletOffsetX;
- (double)getBulletOffsetY;

@end

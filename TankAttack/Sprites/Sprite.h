//
//  Sprite.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "HealthBar.h"

@interface Sprite : SKSpriteNode

@property (nonatomic) HealthBar *healthBar;
@property (nonatomic) Boolean isAlive;

- (void)death;

@end

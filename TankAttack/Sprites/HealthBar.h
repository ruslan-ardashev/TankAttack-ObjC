//
//  HealthBar.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface HealthBar : SKNode

@property (readonly, nonatomic) double health;

- (id)initWithHealth:(double)health WithParentWidth:(double)width WithParentHeight:(double)height WithParent:(SKSpriteNode *)parent;
- (void)decrementHealthByAmount:(double)amount;
- (void)instantDeath;
- (void)infiniteHealth;

@end











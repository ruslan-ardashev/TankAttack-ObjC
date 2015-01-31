//
//  Boss.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

@class World;

#import "Enemy.h"

@interface Boss : Enemy

- (id)initWithX:(double)x WithY:(double)y IntoWorld:(World *)world;

- (void)goRight;
- (void)goLeft;

@end


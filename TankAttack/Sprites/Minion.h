//
//  Minion.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "Enemy.h"
#import "GameViewController.h"
#import "World.h"

@interface Minion : Enemy

- (id)initWithX:(double)x WithY:(double)y WithLeftXLimit:(double)leftXLimit WithRightXLimit:(double)rightXLimit WithIsGoingRight:(Boolean)isGoingRight IntoWorld:(World *)world;

@end







//
//  Boss.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Sprite.h"
#import "GameViewController.h"
#import "World.h"


@interface Boss : Sprite

- (id)initWithX:(double)x WithY:(double)y IntoWorld:(World *)world;

@end

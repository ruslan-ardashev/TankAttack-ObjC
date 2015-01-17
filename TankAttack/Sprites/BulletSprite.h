//
//  BulletSprite.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameViewController.h"
#import "World.h"

@interface BulletSprite : SKSpriteNode

- (id)initAtX:(CGFloat)xPosition AtY:(CGFloat)yPosition IntoWorld:(World *)world;
- (void)updateXY;

@end

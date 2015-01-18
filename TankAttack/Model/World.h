//
//  World.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/15/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

//@class BulletSprite;

#import <SpriteKit/SpriteKit.h>
#import "GameViewController.h"
#import "Player.h"
#import "Overlay.h"
#import "BulletSprite.h"

@interface World : SKScene

- (SKScene *)createScene;
- (void)createPlayerSprite;

@property (readonly, nonatomic) Player *playerSprite;

@end

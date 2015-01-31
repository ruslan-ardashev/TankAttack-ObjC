//
//  World.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/15/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameViewController.h"
#import "Player.h"
#import "Overlay.h"
#import "BulletSprite.h"
#import "Enemy.h"
#import "Minion.h"
#import "KamikazeeMinion.h"
#import "Boss.h"
#import "SillyBoss.h"

@interface World : SKScene

- (SKScene *)createScene;

@property (readonly, nonatomic) Player *playerSprite;

@end

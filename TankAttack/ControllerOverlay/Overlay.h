//
//  Overlay.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/16/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

@class World;

#import <SpriteKit/SpriteKit.h>
#import "World.h"
#import "Joystick.h"

@interface Overlay : SKSpriteNode

@property (readonly, nonatomic) Boolean isOverlayFiring;

- (id)initIntoWorld:(World *)world;
- (double)getXVelocity;
- (double)getYVelocity;
- (void)notifyOfTouchAtLocation:(CGPoint)location;
- (void)notifyOfRelease;

@end

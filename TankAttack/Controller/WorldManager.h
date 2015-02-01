//
//  WorldManager.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/31/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class WorldArray;

@interface WorldManager : NSObject

@property (nonatomic) WorldArray *worldArray;

- (SKScene *)getSceneToDisplay;

@end

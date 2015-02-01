//
//  WorldArray.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/31/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class World;

@interface WorldArray : NSObject

@property (readonly, nonatomic) int currentWorldIndex;

- (World *)currentWorld;

@end

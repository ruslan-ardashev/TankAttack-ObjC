//
//  WorldArray.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/31/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@class World;

@interface WorldArray : NSMutableArray

@property (readonly, nonatomic) int currentWorldIndex;

- (World *)currentWorld;

@end

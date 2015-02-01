//
//  WorldManager.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/31/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "WorldManager.h"
#import "WorldArray.h"
#import "World.h"

@implementation WorldManager

- (id)init {
    
    if (self = [super init]) {
        
        [self setWorldArray:[[WorldArray alloc] init]];
        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}

- (SKScene *)getSceneToDisplay {
    
    World *currentWorld = [[self worldArray] currentWorld];
    
    if (!currentWorld) {
        
        // Increase difficulty
        [GameViewController increaseDifficulty];
        
        // Create more worlds based
        [self setWorldArray:[[WorldArray alloc] init]];
        
        currentWorld = [self.worldArray currentWorld];
        
    }
    
    
    return [currentWorld createScene];
    
}

@end

//
//  Enemy.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

- (id)initWithImageNamed:(NSString *)name {
    
    self = [super initWithImageNamed:name];
    
    if (self) {
        
        _isAlive = true;
        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}

- (void)updateEnemyXY {

    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    
}

- (Boolean)isFiring {
    
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    
    return NO;
    
}

- (double)getBulletOffsetX {
    
    return [self position].x;
    
}

- (double)getBulletOffsetY {
    
    return ([self position].y - [self size].height/2);
    
}




@end











//
//  Player.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/15/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "Player.h"

@implementation Player


- (id)initWithLocation:(CGPoint)location {
    
    self = [super initWithImageNamed:@"tank"];
    
    if (self != nil) {
        
        [self setScale:0.25];
        [self setPosition:location];
        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}


@end

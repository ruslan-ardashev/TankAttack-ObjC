//
//  EighthWorld.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/31/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "EighthWorld.h"

@implementation EighthWorld

- (id)initWithSize:(CGSize)size {
    
    self = [super initWithSize:size];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor brownColor]];
        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}

- (void)createInitialSprites {
    
    [self createMinionSprites];
    
}

- (void)createMinionSprites {
    
    CGFloat oneTenthWidth = self.size.width/10;
    CGFloat oneTenthHeight = self.size.height/10;
    
    [[Minion alloc] initWithX:0.5*oneTenthWidth WithY:8*oneTenthHeight      WithLeftXLimit:0.5*oneTenthWidth WithRightXLimit:3.5*oneTenthWidth WithIsGoingRight:true IntoWorld:self];
    [[Minion alloc] initWithX:2.5*oneTenthWidth WithY:8.5*oneTenthHeight    WithLeftXLimit:2.5*oneTenthWidth WithRightXLimit:5.5*oneTenthWidth WithIsGoingRight:true IntoWorld:self];
    [[Minion alloc] initWithX:4.5*oneTenthWidth WithY:9*oneTenthHeight      WithLeftXLimit:4.5*oneTenthWidth WithRightXLimit:7.5*oneTenthWidth WithIsGoingRight:true IntoWorld:self];
    [[Minion alloc] initWithX:6.5*oneTenthWidth WithY:9.5*oneTenthHeight    WithLeftXLimit:6.5*oneTenthWidth WithRightXLimit:9.5*oneTenthWidth WithIsGoingRight:true IntoWorld:self];

    
}

@end




















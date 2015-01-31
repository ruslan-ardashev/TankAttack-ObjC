//
//  SixthWorld.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/29/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "SixthWorld.h"

@implementation SixthWorld

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
    
    [[Boss alloc] initWithX:5*oneTenthWidth WithY:8.25*oneTenthHeight IntoWorld:self];
    
    [[Minion alloc] initWithX:oneTenthWidth*2 WithY:oneTenthHeight*7.5 WithLeftXLimit:oneTenthWidth*0.2 WithRightXLimit:oneTenthWidth*3.5 WithIsGoingRight:true IntoWorld:self];
    [[Minion alloc] initWithX:oneTenthWidth*8.8 WithY:oneTenthHeight*7.5 WithLeftXLimit:oneTenthWidth*6.5 WithRightXLimit:oneTenthWidth*9.8 WithIsGoingRight:false IntoWorld:self];
    
    
}

@end




















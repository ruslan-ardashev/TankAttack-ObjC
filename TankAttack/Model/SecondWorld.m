//
//  SecondWorld.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/15/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "SecondWorld.h"

@implementation SecondWorld

- (id)initWithSize:(CGSize)size {
    
    self = [super initWithSize:size];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
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
    
    [[Minion alloc] initWithX:oneTenthWidth*2 WithY:oneTenthHeight*9 WithLeftXLimit:oneTenthWidth*0.2 WithRightXLimit:oneTenthWidth*3 WithIsGoingRight:true IntoWorld:self];
    
    [[Minion alloc] initWithX:oneTenthWidth*3 WithY:oneTenthHeight*8 WithLeftXLimit:oneTenthWidth*3.2 WithRightXLimit:oneTenthWidth*6 WithIsGoingRight:false IntoWorld:self];
    
    [[Minion alloc] initWithX:oneTenthWidth*6.1 WithY:oneTenthHeight*8.5 WithLeftXLimit:oneTenthWidth*6.1 WithRightXLimit:oneTenthWidth*9.9 WithIsGoingRight:true IntoWorld:self];
    
}

@end

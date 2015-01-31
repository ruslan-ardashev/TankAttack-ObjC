//
//  FifthWorld.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/29/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "FifthWorld.h"

@implementation FifthWorld

- (id)initWithSize:(CGSize)size {
    
    self = [super initWithSize:size];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor UIColorFromHexString:@"#CCFFCC"]];
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
    
    [[SillyBoss alloc] initWithX:2*oneTenthWidth WithY:8.75*oneTenthHeight IntoWorld:self WithLeftLimit:1*oneTenthWidth WithRightLimit:5.25*oneTenthWidth];
    
    [[Minion alloc] initWithX:oneTenthWidth*7.25 WithY:oneTenthHeight*9 WithLeftXLimit:oneTenthWidth*7 WithRightXLimit:oneTenthWidth*9.5 WithIsGoingRight:true IntoWorld:self];
    
    
}

@end




















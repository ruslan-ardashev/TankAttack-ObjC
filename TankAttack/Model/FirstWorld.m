//
//  FirstWorld.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/15/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "FirstWorld.h"

@implementation FirstWorld

- (id)initWithSize:(CGSize)size {
    
    self = [super initWithSize:size];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor UIColorFromHexString:BACKGROUND_GREEN_COLOR]];
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
    
    
    [[Minion alloc] initWithX:oneTenthWidth*0.3 WithY:oneTenthHeight*8 WithLeftXLimit:oneTenthWidth*0.3 WithRightXLimit:oneTenthWidth*9.7 WithIsGoingRight:true IntoWorld:self];


}

@end

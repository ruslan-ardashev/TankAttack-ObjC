//
//  SeventhWorld.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/29/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "SeventhWorld.h"

@implementation SeventhWorld

- (id)initWithSize:(CGSize)size {
    
    self = [super initWithSize:size];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor UIColorFromHexString:@"#CC3300"]];
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
    
    [[Boss alloc] initWithX:1*oneTenthWidth WithY:8.25*oneTenthHeight IntoWorld:self];
    
    [[KamikazeeMinion alloc] initWithX:oneTenthWidth*9.5 WithY:oneTenthHeight*9.5 IntoWorld:self];
    
}

@end




















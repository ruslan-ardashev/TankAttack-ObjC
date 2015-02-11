//
//  WorldArray.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/31/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "GameViewController.h"
#import "WorldArray.h"
#import "World.h"
#import "FirstWorld.h"
#import "SecondWorld.h"
#import "ThirdWorld.h"
#import "FourthWorld.h"
#import "FifthWorld.h"
#import "SixthWorld.h"
#import "SeventhWorld.h"
#import "EighthWorld.h"

@implementation WorldArray {
    
    NSMutableArray *_supportingArray;
    
}

- (id)init {
    
    if (self = [super init]) {
        
        _supportingArray = [[NSMutableArray alloc] init];
        
        [self allocateAndInitiateWorldsInBackground];
        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}

- (void)allocateAndInitiateWorldsInBackground {
    
    _currentWorldIndex = 0;
    
    CGSize gameSize = [ScalingManager size];
    
    FirstWorld *w1 = [[FirstWorld alloc] initWithSize:gameSize];
    SecondWorld *w2 = [[SecondWorld alloc] initWithSize:gameSize];
    ThirdWorld *w3 = [[ThirdWorld alloc] initWithSize:gameSize];
    FourthWorld *w4 = [[FourthWorld alloc] initWithSize:gameSize];
    FifthWorld *w5 = [[FifthWorld alloc] initWithSize:gameSize];
    SixthWorld *w6 = [[SixthWorld alloc] initWithSize:gameSize];
    SeventhWorld *w7 = [[SeventhWorld alloc] initWithSize:gameSize];
    EighthWorld *w8 = [[EighthWorld alloc] initWithSize:gameSize];
    
    // Includes a bogus object at the beginning. _currentWorldIndex++; below is the reason.
    [_supportingArray addObjectsFromArray:@[@"", w1, w2, w3, w4, w5, w6, w7, w8]];
    
}

- (World *)currentWorld {
    
    _currentWorldIndex++;
    
    if (_currentWorldIndex >= _supportingArray.count) {
        
        return nil;
        
    }
    
    else {
        
        return [_supportingArray objectAtIndex:_currentWorldIndex];
        
    }
    
}

@end


















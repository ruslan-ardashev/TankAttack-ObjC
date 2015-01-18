//
//  Boss.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "Boss.h"

@implementation Boss

- (void)replaceImageWithFire {
    
    [self setTexture:[SKTexture textureWithImageNamed:@"bossDeath"]];
    
}

@end

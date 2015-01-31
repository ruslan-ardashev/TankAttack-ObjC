//
//  SillyBoss.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/30/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "Boss.h"

@interface SillyBoss : Boss
- (id)initWithX:(double)x WithY:(double)y IntoWorld:(World *)world WithLeftLimit:(double)left WithRightLimit:(double)right;
@end

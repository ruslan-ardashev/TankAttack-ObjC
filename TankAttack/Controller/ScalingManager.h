//
//  ScalingManager.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 2/10/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ScalingManager : NSObject

// Game Parameters
+ (CGFloat)width;
+ (CGFloat)height;
+ (CGSize)size;
+ (void)setSize:(CGSize)size;

// Scaling Parameters
+ (int)TitleFontSize;
+ (int)ButtonFontSize;
+ (int)LevelOverFontSize;
+ (int)CurrentLevelFontSize;
+ (CGFloat)smallTankScaleFactor;
+ (CGFloat)largeTankScaleFactor;

@end

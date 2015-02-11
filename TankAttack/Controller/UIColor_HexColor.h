//
//  UIColor+HexColor.h
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/31/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <UIKit/UIKit.h>


#define BACKGROUND_GREEN_COLOR @"#629632"


@interface UIColor (HexColor)

+ (UIColor *)UIColorFromHexString:(NSString *)string;

// Tank Color
+ (UIColor *)tankColor;

@end

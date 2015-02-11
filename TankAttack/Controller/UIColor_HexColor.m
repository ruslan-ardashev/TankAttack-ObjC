//
//  UIColor+HexColor.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/31/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "UIColor_HexColor.h"

@implementation UIColor (HexColor)

+ (UIColor *)UIColorFromHexString:(NSString *)string {
    
    // http://stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string
    // Assumes input like "#00FF00" (#RRGGBB).
    
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:string];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    
}

@end

//
//  ScalingManager.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 2/10/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "ScalingManager.h"


typedef enum {
    
    iPhone4S_iPad,
    iPhone5_5S_6DS,
    iPhone6_6PlusDS,
    iPhone6Plus
    
} iPhoneDevice;

@implementation ScalingManager

static CGSize size;
static CGFloat width, height;

static iPhoneDevice deviceKind;

+ (CGFloat)width {
    
    return width;
    
}

+ (CGFloat)height {
    
    return height;
    
}

+ (CGSize)size {
    
    return size;
    
}

+ (void)setSize:(CGSize)newSize {
    
    size = newSize;
    width = newSize.width;
    height = newSize.height;
    
    [ScalingManager determineDevice];
    
}

// Scaling Parameters
+ (void)determineDevice {
    
    if (width == 320.000000) {
        
        // iPhone 4S, down-scaled iPad: 320.000000, 480.000000
        if (height == 480.000000) {
            
            deviceKind = iPhone4S_iPad;
            
        }
        
        // iPhone 5, 6 down-scaled: 320.000000, 568.000000
        else if (height == 568.000000) {
            
            deviceKind = iPhone5_5S_6DS;
            
        }
        
    }
    
    // iPhone 6, 6 Plus downscaled: 375.000000, 667.000000
    else if (width == 375.000000 && height == 667.000000) {
        
        deviceKind = iPhone6_6PlusDS;
        
    }
    
    // iPhone 6 Plus: 414.000000, 736.000000
    else if (width == 414.000000 && height == 736.000000) {
        
        deviceKind = iPhone6Plus;
        
    }
    
}

+ (int)TitleFontSize {
    
    switch (deviceKind) {
        case iPhone6Plus:
            return 85;
            break;
            
        case iPhone6_6PlusDS:
            return 75;
            break;
            
        case iPhone5_5S_6DS:
            return 60;
            break;
            
        case iPhone4S_iPad:
            return 60;
            break;
            
        default:
            NSLog(@"Device not detected. Returning default title size from ScalingManager.");
            return 0;
            break;
    }
    
}

+ (int)ButtonFontSize {
    
    switch (deviceKind) {
        case iPhone6Plus:
            return 55;
            break;
            
        case iPhone6_6PlusDS:
            return 50;
            break;
            
        case iPhone5_5S_6DS:
            return 45;
            break;
            
        case iPhone4S_iPad:
            return 45;
            break;
            
        default:
            NSLog(@"Device not detected. Returning default title size from ScalingManager.");
            return 0;
            break;
    }

}

+ (int)LevelOverFontSize {
    
    switch (deviceKind) {
        case iPhone6Plus:
            return 65;
            break;
            
        case iPhone6_6PlusDS:
            return 60;
            break;
            
        case iPhone5_5S_6DS:
            return 50;
            break;
            
        case iPhone4S_iPad:
            return 50;
            break;
            
        default:
            NSLog(@"Device not detected. Returning default title size from ScalingManager.");
            return 0;
            break;
    }
    
}

+ (int)CurrentLevelFontSize {
    
    switch (deviceKind) {
        case iPhone6Plus:
            return 20;
            break;
            
        case iPhone6_6PlusDS:
            return 18;
            break;
            
        case iPhone5_5S_6DS:
            return 15;
            break;
            
        case iPhone4S_iPad:
            return 15;
            break;
            
        default:
            NSLog(@"Device not detected. Returning default title size from ScalingManager.");
            return 0;
            break;
    }
    
}

+ (CGFloat)smallTankScaleFactor {
    
    return 0.000604 * width;
    
}

+ (CGFloat)largeTankScaleFactor {
    
    return 2 * 0.000604 * width;
    
}


@end

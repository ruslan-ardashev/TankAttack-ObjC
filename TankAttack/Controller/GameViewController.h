//
//  GameViewController.h
//  TankAttack
//

//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface GameViewController : UIViewController

// Game Parameters
+ (CGFloat)width;
+ (void)setWidth:(CGFloat)width;
+ (CGFloat)height;
+ (void)setHeight:(CGFloat)height;

@end

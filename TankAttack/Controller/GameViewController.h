//
//  GameViewController.h
//  TankAttack
//

//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>


#define DEFAULT_FONT @"DamascusBold"

#define PLAYER_SPEED 0.025          // Compensates for a crazy Joystick velocity
#define MINION_SPEED 2

#define BULLET_SPEED 4
#define DELAY_BETWEEN_BULLETS 0.100   // seconds


@interface UIColor (HexColor)

+ (UIColor *)UIColorFromHexString:(NSString *)string;

@end

@interface GameViewController : UIViewController

// Game Parameters
+ (CGFloat)width;
+ (CGFloat)height;
+ (CGSize)size;
+ (CGPoint)playerInitLocation;
+ (void)setSize:(CGSize)size;

// Class Methods
+ (GameViewController *)sharedInstance;

// Instance Methods
- (void)startGame;

@end

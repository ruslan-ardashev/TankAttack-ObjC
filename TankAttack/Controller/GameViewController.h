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
#define MINION_SPEED 1

#define BULLET_SPEED 3.5
#define DELAY_BETWEEN_BULLETS 0.100   // seconds
#define BULLET_DAMAGE 10
#define BULLET_HEIGHT_COMPENSATION 5

#define SMALL_TANK_SCALE_FACTOR 0.25
#define BOSS_TANK_SCALE_FACTOR 0.25
#define PLAYER_IMAGE_NAME @"tank"
#define MINION_IMAGE_NAME @"minion"


@interface UIColor (HexColor)

+ (UIColor *)UIColorFromHexString:(NSString *)string;

@end

@interface GameViewController : UIViewController

// Tank Color
+ (UIColor *)tankColor;

// Game Parameters
+ (CGFloat)width;
+ (CGFloat)height;
+ (CGSize)size;
+ (CGPoint)playerInitLocation;
+ (void)setSize:(CGSize)size;
+ (int)difficulty;
+ (void)setDifficulty:(int)difficulty;

// Class Methods
+ (GameViewController *)sharedInstance;

// Instance Methods
- (void)startGame;
- (void)displayMainMenu;
- (void)progressToNextLevel;

@end













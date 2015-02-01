//
//  GameViewController.h
//  TankAttack
//

//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "UIColor_HexColor.h"

#define BACKGROUND_GREEN_COLOR @"#629632"

#define DEFAULT_FONT @"DamascusBold"
#define TITLE_FONT 85
#define BUTTON_FONT 55

#define PLAYER_SPEED 0.025          // Compensates for a crazy Joystick velocity

#define BULLET_SPEED 3.5
#define DELAY_BETWEEN_BULLETS 0.100   // seconds
#define BULLET_DAMAGE 10
#define BULLET_HEIGHT_COMPENSATION 5

#define SMALL_TANK_SCALE_FACTOR 0.25
#define BOSS_TANK_SCALE_FACTOR 0.50
#define PLAYER_IMAGE_NAME @"tank"
#define MINION_IMAGE_NAME @"minion"
#define KAMIKAZEE_MINION_IMAGE_NAME @"kamikazeeminion"
#define BOSS_IMAGE_NAME @"boss"

#define START_LEVEL 0


@interface GameViewController : UIViewController

@property (nonatomic) NSInteger maximumLevelsDefeated;

// Tank Color
+ (UIColor *)tankColor;

// Game Parameters
+ (CGFloat)width;
+ (CGFloat)height;
+ (CGSize)size;
+ (CGPoint)playerInitLocation;
+ (void)setSize:(CGSize)size;
+ (CGFloat)minionSpeed;
+ (CGFloat)bossSpeed;
+ (CGFloat)kamikazeeMinionSpeed;

// Class Methods
+ (GameViewController *)sharedInstance;
+ (void)increaseDifficulty;

// Instance Methods

- (void)stepWorld;
- (void)displayMainMenu;

@end













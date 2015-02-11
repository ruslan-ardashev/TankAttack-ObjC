//
//  GameViewController.h
//  TankAttack
//

//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "ScalingManager.h"
#import "UIColor_HexColor.h"

#define DEFAULT_FONT @"DamascusBold"

#define PLAYER_SPEED 0.025              // Compensates for a crazy Joystick velocity

#define BULLET_SPEED 3.5
#define DELAY_BETWEEN_BULLETS 0.100     // seconds
#define BULLET_DAMAGE 10
#define BULLET_HEIGHT_COMPENSATION 5

#define PLAYER_IMAGE_NAME @"tank"
#define MINION_IMAGE_NAME @"minion"
#define KAMIKAZEE_MINION_IMAGE_NAME @"kamikazeeminion"
#define BOSS_IMAGE_NAME @"boss"

#define START_LEVEL 0                   // debugging


@interface GameViewController : UIViewController

@property (nonatomic) NSInteger maximumLevelsDefeated;


// Game Methods
+ (GameViewController *)sharedInstance;
+ (void)increaseDifficulty;

// Sprite-Specific
+ (CGPoint)playerInitLocation;
+ (CGFloat)minionSpeed;
+ (CGFloat)bossSpeed;
+ (CGFloat)kamikazeeMinionSpeed;


// Instance Methods
- (void)stepWorld;
- (void)displayMainMenu;
- (void)presentControlScreen;

@end













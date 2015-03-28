//
//  GameViewController.h
//  TankAttack
//

//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

#import "Defines.h"
#import "ScalingManager.h"
#import "UIColor_HexColor.h"


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













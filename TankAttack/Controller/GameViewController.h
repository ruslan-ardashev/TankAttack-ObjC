//
//  GameViewController.h
//  TankAttack
//

//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

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

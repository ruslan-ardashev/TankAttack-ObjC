//
//  GameViewController.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/15/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "GameViewController.h"
#import "SplashScreen.h"
#import "World.h"
#import "WorldManager.h"


@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
     
    return scene;
}

@end


@implementation GameViewController {
    
    SKView *_view;
    SKScene *_scene;
    World *_currWorld;
    SKScene *_splashScreen;
    
    WorldManager *_worldManager;
    
}


// Class Variables
static GameViewController *sharedInstance;
static CGSize gameSize;
static CGFloat gameWidth, gameHeight;
static CGFloat minionSpeed, bossSpeed, kamikazeeMinionSpeed;


// Class Methods
+ (UIColor *)tankColor {
    
    return [UIColor UIColorFromHexString:@"#003f00"];
    
}

+ (CGFloat)width {
    
    return gameWidth;
    
}

+ (CGFloat)height {
    
    return gameHeight;
    
}

+ (CGSize)size {
    
    return gameSize;
    
}

+ (void)setSize:(CGSize)size {
    
    gameSize = size;
    gameWidth = size.width;
    gameHeight = size.height;
    
}

+ (CGFloat)minionSpeed {
    
    return minionSpeed;
    
}

+ (CGFloat)bossSpeed {
    
    return bossSpeed;
    
}

+ (CGFloat)kamikazeeMinionSpeed {
    
    return kamikazeeMinionSpeed;
    
}

+ (void)setInitialDifficulty {
    
    minionSpeed = .7;
    bossSpeed = 0.6;
    kamikazeeMinionSpeed = .8;
    
}

+ (CGPoint)playerInitLocation {
    
    return CGPointMake(gameWidth/2, gameHeight/4);
    
}

+ (GameViewController *)sharedInstance {
    
    return sharedInstance;
    
}

+ (void)increaseDifficulty {
    
    minionSpeed += .15;
    bossSpeed += .15;
    kamikazeeMinionSpeed += .15;
    
}


// Instance Methods
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    sharedInstance = self;
    
    [GameViewController setSize:self.view.frame.size];
    [GameViewController setInitialDifficulty];
    
    [self configureAndShowSKView];                  // The JavaFX equivalent of SKView is Stage
    [self configureSplashScreen];
    
    // Present the scene.
    [_view presentScene:_splashScreen];
    
    [self allocateAndInitiateWorldsInBackground];
    
}

- (void)displayMainMenu {
    
    [self configureSplashScreen];
    // Present the scene.
    [_view presentScene:_splashScreen];
    [self allocateAndInitiateWorldsInBackground];
    [self resetLevelsTracking];
    
}

- (void)allocateAndInitiateWorldsInBackground {
    
    _maximumLevelsDefeated = -1;                    // NOT 0, it's incremented on every world scene call.
    _worldManager = [[WorldManager alloc] init];
    
}

- (void)resetLevelsTracking {
    
    [self setMaximumLevelsDefeated:0];
    
}

- (void)configureAndShowSKView {
    
    // The JavaFX equivalent of SKView is Stage
    _view = (SKView *)self.view;
    
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    _view.ignoresSiblingOrder = YES;
    
}

- (void)configureSplashScreen {
    
    // Create and configure the scene.
    _splashScreen = [[SplashScreen alloc] initWithSize:gameSize];       // The JavaFX equivalent of SKScene is Scene

}

- (void)displayScene:(SKScene *)scene {
    
    [_view presentScene:scene];
    
}

- (BOOL)shouldAutorotate {
    
    return NO;
    
}

- (NSUInteger)supportedInterfaceOrientations {
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
    
}

- (BOOL)prefersStatusBarHidden {
    
    return YES;
    
}

- (void)stepWorld {
    
    _maximumLevelsDefeated++;
    
    _scene = [_worldManager getSceneToDisplay];
    [_view presentScene:_scene];
    
}


@end




















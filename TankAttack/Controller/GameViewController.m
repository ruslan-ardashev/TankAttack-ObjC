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
    NSMutableArray *_worlds;
    
    int _currentWorldIndex;
    
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
    
    minionSpeed = 1;
    bossSpeed = 0.85;
    kamikazeeMinionSpeed = 1.5;
    
}

+ (CGPoint)playerInitLocation {
    
    return CGPointMake(gameWidth/2, gameHeight/4);
    
}

+ (GameViewController *)sharedInstance {
    
    return sharedInstance;
    
}

+ (void)increaseDifficulty {
    
    // Set game params to more difficult.
    NSLog(@"IMPLEMENT [GameViewController increaseDifficulty]");
    
}


// Instance Methods
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    sharedInstance = self;
    
    [self configureGameParameters];
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
    
}

- (void)configureGameParameters {
        
    // Size
    [GameViewController setSize:self.view.frame.size];
    
}

- (void)allocateAndInitiateWorldsInBackground {
    
    _currentWorldIndex = 0;
    
    FirstWorld *w1 = [[FirstWorld alloc] initWithSize:gameSize];
    SecondWorld *w2 = [[SecondWorld alloc] initWithSize:gameSize];
    ThirdWorld *w3 = [[ThirdWorld alloc] initWithSize:gameSize];
    FourthWorld *w4 = [[FourthWorld alloc] initWithSize:gameSize];
    FifthWorld *w5 = [[FifthWorld alloc] initWithSize:gameSize];
    SixthWorld *w6 = [[SixthWorld alloc] initWithSize:gameSize];
    SeventhWorld *w7 = [[SeventhWorld alloc] initWithSize:gameSize];
    EighthWorld *w8 = [[EighthWorld alloc] initWithSize:gameSize];
    
    if (_worlds == nil) {
        
        _worlds = [[NSMutableArray alloc] initWithObjects:w1, w2, w3, w4, w5, w6, w7, w8, nil];
        
    }
    
    // Just lost a level. Get rid of what's already there.
    else  {
        
        [_worlds removeAllObjects];
        _worlds = [NSMutableArray arrayWithObjects:w1, w2, w3, w4, w5, w6, w7, w8, nil];
        
    }
    
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

- (void)startGame {
    
    _isAtEndOfGame = false;
    
    if (_worlds == nil) {
        NSLog(@"Resources not loaded yet.");
        return;
    }
    
    else {
        
        _currWorld = [_worlds objectAtIndex:START_LEVEL];
        [self initCurrWorld];
        
    }
    
}

- (void)initCurrWorld {
    
    _scene = [_currWorld createScene];
    [_view presentScene:_scene];
    
}

- (void)progressToNextLevel {
    
    _currentWorldIndex++;
    
    switch (_currentWorldIndex) {
        case 1:
            [self displayLevelTwo];
            break;
        case 2:
            [self displayLevelThree];
            break;
        case 3:
            [self displayLevelFour];
            break;
        case 4:
            [self displayLevelFive];
            break;
        case 5:
            [self displayLevelSix];
            break;
        case 6:
            [self displayLevelSeven];
            break;
        case 7:
            _isAtEndOfGame = true;
            [self displayLevelEight];
            break;
        default:
            [self displayMainMenu];
            break;
    }
    
}

- (void)displayLevelTwo {
    
    [self initCurrWorld];
    
}

- (void)displayLevelThree {
    
    [self initCurrWorld];
    
}

- (void)displayLevelFour {
    
    [self initCurrWorld];
    
}

- (void)displayLevelFive {
    
    [self initCurrWorld];
    
}

- (void)displayLevelSix {
    
    [self initCurrWorld];
    
}

- (void)displayLevelSeven {
    
    [self initCurrWorld];
    
}

- (void)displayLevelEight {
    
    [self initCurrWorld];
    
}


@end




















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
#import "FirstWorld.h"
#import "SecondWorld.h"
#import "ThirdWorld.h"
#import "FourthWorld.h"
#import "FifthWorld.h"
#import "SixthWorld.h"
#import "SeventhWorld.h"


@implementation UIColor (HexColor)

+ (UIColor *)UIColorFromHexString:(NSString *)string {
    
    // http://stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string
    // Assumes input like "#00FF00" (#RRGGBB).
    
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:string];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    
}

@end


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
static CGFloat gameWidth;
static CGFloat gameHeight;
static int difficulty;



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

+ (CGPoint)playerInitLocation {
    
    return CGPointMake(gameWidth/2, gameHeight/4);
    
}

+ (GameViewController *)sharedInstance {
    
    return sharedInstance;
    
}

+ (int)difficulty {
    
    return difficulty;
    
}

+ (void)setDifficulty:(int)newDifficulty {
    
    difficulty = newDifficulty;
    
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
    
    // TODO: Remember last difficulty. Maybe.
    
    NSLog(@"Remember last difficulty, maybe. TODO");
    [GameViewController setDifficulty:2];
    
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
    
    if (_worlds == nil) {
        
        _worlds = [[NSMutableArray alloc] initWithObjects:w1, w2, w3, w4, w5, w6, w7, nil];
        
    }
    
    // Just lost a level. Get rid of what's already there.
    else  {
        
        [_worlds removeAllObjects];
        _worlds = [NSMutableArray arrayWithObjects:w1, w2, w3, w4, w5, w6, w7, nil];
        
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
            _isAtEndOfGame = true;
            [self displayLevelFour];
            break;
        default:
            [self displayMainMenu];
            break;
    }
    
}

- (void)displayLevelTwo {
    
    _currWorld = [_worlds objectAtIndex:1];
    [self initCurrWorld];
    
}

- (void)displayLevelThree {
    
    _currWorld = [_worlds objectAtIndex:2];
    [self initCurrWorld];
    
}

- (void)displayLevelFour {
    
    _currWorld = [_worlds objectAtIndex:3];
    [self initCurrWorld];
    
}


@end




















//
//  GameViewController.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/15/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import "SplashScreen.h"


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
    GameScene *_scene;
    GameScene *_splashScreen;
    
}

// Class Variables
static CGFloat gameWidth;
static CGFloat gameHeight;


// Class Methods
+ (CGFloat)width {
    
    return gameWidth;
    
}

+ (CGFloat)height {
    
    return gameHeight;
    
}

+ (void)setWidth:(CGFloat)width {
    
    gameWidth = width;
    
}

+ (void)setHeight:(CGFloat)height {
    
    gameHeight = height;
    
}


// Instance Methods
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self configureGameParameters];
    [self configureAndShowSKView];
    [self configureAndShowSplashScreen];
    
    // Present the scene.
    [_view presentScene:_scene];
    
}

- (void)configureGameParameters {
    
    CGSize size = self.view.frame.size;
    double width = size.width;
    double height = size.height;
    
    [GameViewController setWidth:width];
    [GameViewController setHeight:height];
    
}

- (void)configureAndShowSKView {
    
    // Configure the view.
    _view = (SKView *)self.view;                          // The JavaFX equivalent of SKView is Stage
    _view.showsFPS = YES;
    _view.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    _view.ignoresSiblingOrder = YES;
    
}

- (void)configureAndShowSplashScreen {
    
    _splashScreen = [[SplashScreen alloc] init];
    _scene = _splashScreen;
    
    // Create and configure the scene.
    
    _scene = [[GameScene alloc] initWithSize:size];       // The JavaFX equivalent of GameScene is Scene
    _scene.scaleMode = SKSceneScaleModeAspectFill;

    
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

@end

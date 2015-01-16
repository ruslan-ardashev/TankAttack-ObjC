//
//  World.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/15/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "World.h"


@implementation World {
    
    Overlay *_overlay;
    
}

- (id)initWithSize:(CGSize)size {
    
    self = [super initWithSize:size];
    NSLog(@"initWithSize on world: x: %f, y: %f", size.width, size.height);
    self.backgroundColor = [UIColor lightGrayColor];
    self.scaleMode = SKSceneScaleModeResizeFill;
    return self;
    
}

- (SKScene *)createScene {
    
    [self createControllerOverlay];
    [self createInitialSprites];
    
    return self;
    
}

- (void)createInitialSprites {
    
    // http://stackoverflow.com/questions/1034373/creating-an-abstract-class-in-objective-c
    
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    
}

- (void)createControllerOverlay {
    
    _overlay = [[Overlay alloc] initIntoWorld:self];
    
}

- (void)createPlayerSprite {
    
    NSLog(@"TODO: modify player init to reflect boundaries");
    _playerSprite = [[Player alloc] initWithLocation:[GameViewController playerInitLocation] WithBottomBoundary:0 WithTopBoundary:1000 WithLeftBoundary:0 WithRightBoundary:1000];
    [self addChild:_playerSprite];
    
}

- (void)initAnimation {
    
    
    
}

- (void)update:(CFTimeInterval)currentTime {
    
    /* Called before each frame is rendered */
    [self updateSprites];
    
}

- (void)updateSprites {
    
    // From my own TankAttack-Java done for CS308 (once the course is over, will open-source)
//    playerSprite.updateLocation();
    [self handlePlayerSprite];
    
//    handleFiring();             // Handle Player Firing
//    updateEnemySprites();       // also handles enemy fire
//    updateBulletMovements();    // Bullet Movement
//    handleCollision();          // Register Collisions With Tanks
//    handleCollisionBullets();   // Register Collisions Between Sprites & Bullets
//    updateAllSpritesToCheckForDeath();
//    checkForWin();              // Check for win
    
}

- (void)handlePlayerSprite {
    
    [self updatePlayerLocation];
    [self handlePlayerFiring];
    
}

- (void)updatePlayerLocation {
    
    double xIncrement = [_overlay getXVelocity];
    double yIncrement = [_overlay getYVelocity];
    
    [_playerSprite updateLocationWithX:xIncrement WithY:yIncrement];
    
}

- (void)handlePlayerFiring {
    
    
    
}



@end












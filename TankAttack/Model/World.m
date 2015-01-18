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
    
    NSMutableArray *_bodiesToRemove;
    
    NSDate *_lastFired;
    
}

- (id)initWithSize:(CGSize)size {
    
    self = [super initWithSize:size];
    
    self.backgroundColor = [UIColor lightGrayColor];
    self.scaleMode = SKSceneScaleModeResizeFill;
    
    // Bullet Firing Interval Calculation
    _lastFired = [NSDate date];
    
    return self;
    
}

- (SKScene *)createScene {
    
    [self createControllerOverlayAndPlayerSprite];
    [self createInitialSprites];
    
    return self;
    
}

- (void)createInitialSprites {
    
    // http://stackoverflow.com/questions/1034373/creating-an-abstract-class-in-objective-c
    
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    
}

- (void)createControllerOverlayAndPlayerSprite {
    
    _overlay = [[Overlay alloc] initIntoWorld:self];

    CGFloat bottomBoundaryWorld = [_overlay size].height;
    CGFloat rightBoundaryWorld = [self size].width;
    CGFloat leftBoundaryWorld = 0;
    CGFloat topBoundaryWorld = [self size].height;
    
    _playerSprite = [[Player alloc] initWithLocation:[GameViewController playerInitLocation] WithBottomBoundary:bottomBoundaryWorld WithTopBoundary:topBoundaryWorld WithLeftBoundary:leftBoundaryWorld WithRightBoundary:rightBoundaryWorld];
    [self addChild:_playerSprite];
    
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

//    handleCollision();          // Register Collisions With Tanks
//    handleCollisionBullets();   // Register Collisions Between Sprites & Bullets
    
//    updateBulletMovements();    // Bullet Movement
    [self updateBulletMovements];
    
//    updateAllSpritesToCheckForDeath();
    
    // Clean up bullets & completed-animating sprites
    [self cleanUp];               // TODO: implement the rest of this!
    
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
    
    // Fire button pressed?
    
    if ([_overlay isOverlayFiring]) {
        
        // Delay between firing
        
        if (-[_lastFired timeIntervalSinceNow] > DELAY_BETWEEN_BULLETS) {
            
            _lastFired = [NSDate date];
            
            CGFloat initXPosition = [_playerSprite position].x;
            CGFloat initYPosition = [_playerSprite position].y + [_playerSprite size].height/2;
            
            [[BulletSprite alloc] initAtX:initXPosition AtY:initYPosition IntoWorld:self];
            
        }

    }
    
}

- (void)updateBulletMovements {
    
    for (id sprite in [self children]) {
        
        if ([sprite isKindOfClass:[BulletSprite class]]) {
            
            [sprite updateXY];
            
        }
        
    }
    
}

- (void)cleanUp {
    
    // Enemy sprites already remove themselves after displaying fire.
    // All that remains is bullet cleanup.
    
    NSMutableArray *removeArray = [[NSMutableArray alloc] init];
    
    for (SKSpriteNode *s in [self children]) {
        
        if ([s isKindOfClass:[BulletSprite class]]) {
            
            if ([s position].y > [self size].height) {
                
                [removeArray addObject:s];
                
            }
            
        }
        
    }
    
    // Done not to concurrently modify above array as we iterate
    for (BulletSprite *b in removeArray) {
        
        [b removeFromParent];
        
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
        CGPoint touchLocation = [touch locationInNode:_overlay];
        
        [_overlay notifyOfTouchAtLocation:touchLocation];
        
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [_overlay notifyOfRelease];
    
}


@end












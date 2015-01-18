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
    NSMutableArray *_spritesToAdd;
    
    NSDate *_lastFired;
    
    SKLabelNode *_failureLabel;
    SKLabelNode *_successLabel;
    
}

- (id)initWithSize:(CGSize)size {
    
    self = [super initWithSize:size];
    
    if (self) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        self.scaleMode = SKSceneScaleModeResizeFill;
        
        // Bullet Firing Interval Calculation
        _lastFired = [NSDate date];
        
        return self;
        
    }
    
    else {
    
        return nil;
        
    }
    
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
    
    NSLog(@"overlay fraction: %f", [_overlay size].height / [self size].height);

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
    
    [self handlePlayerSprite];          // Movement & Firing
    [self handleCollision];             // Register Collisions With Tanks
    [self handleBulletCollisions];      // Register Collisions Between Sprites & Bullets
    [self updateBulletMovements];       // Bullet movement
    [self updateEnemyFiringMoveDeath];  // Enemy Firing, Enemy Movement, Enemy Death
    [self cleanUp];
    [self checkForWinOrLoss];                 // Check for win
        
}

- (void)handleCollision {
    
    for (SKSpriteNode *s in self.children) {
        
        if ([_playerSprite intersectsNode:s]) {
            
            if ([_playerSprite isEqual:s]) {
                continue;
            }
            
            if ([s isKindOfClass:[Sprite class]]) {
                
                [_playerSprite death];
                [(Enemy *)s death];
                
            }
            
        }
        
    }
    
}

- (void)handlePlayerSprite {
    
    [_playerSprite checkIfAlive];
    
    if ([_playerSprite isAlive]) {
        
        [self updatePlayerLocation];
        [self handlePlayerFiring];
        
    }
    
}

- (void)handleBulletCollisions {
    
    // Let's see how this works... the idea is to use one array to detect all bullet collisions with objects
    NSMutableArray *bulletsThatCollided = [[NSMutableArray alloc] init];
    
    // Non-bullet for-loop
    for (Sprite *s in [self children]) {
        
        if ([s isKindOfClass:[BulletSprite class]]) {
            
            continue;
            
        }
        
        // Bullet for-loop
        for (SKSpriteNode *b in [self children]) {
            
            if (![b isKindOfClass:[BulletSprite class]]) {
                
                continue;
                
            }
            
            if ([s intersectsNode:b]) {
                
                if ([s isKindOfClass:[Sprite class]]) {
                    
                    [bulletsThatCollided addObject:b];
                    [[s healthBar] decrementHealthByAmount:BULLET_DAMAGE];
                    
                }
                
            }
            
        }
        
    }
    
    for (SKSpriteNode *sprite in bulletsThatCollided) {
     
        [sprite removeFromParent];
        
    }
    
    
    
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
            
            [self fireBulletForSprite:_playerSprite IsGoingUp:true];
            
        }

    }
    
}

- (void)fireBulletForSprite:(Sprite *)s IsGoingUp:(Boolean)isGoingUp {
    
    CGFloat initYPosition;
    
    CGFloat initXPosition = [s position].x;
    
    if (isGoingUp) {
        
        initYPosition = [s position].y + [s size].height/2 + BULLET_HEIGHT_COMPENSATION;
        
    }

    else {
        
        initYPosition = [s position].y - [s size].height/2 - BULLET_HEIGHT_COMPENSATION;
        
    }
    
    [[BulletSprite alloc] initAtX:initXPosition AtY:initYPosition IntoWorld:self IsGoingUp:isGoingUp];
    
}

- (void)updateBulletMovements {
    
    for (id sprite in [self children]) {
        
        if ([sprite isKindOfClass:[BulletSprite class]]) {
            
            [sprite updateXY];
            
        }
        
    }
    
}

- (void)updateEnemyFiringMoveDeath {
    
    for (SKSpriteNode *s in [self children]) {
        
        if ([s isKindOfClass:[Enemy class]]) {
            
            [(Enemy *)s checkForDeathAndReactAppropriately];
            
            if ([s isKindOfClass:[Boss class]]) {
                
                [(Enemy *)s updateEnemyXYWithPlayerX:[_playerSprite position].x];
                
            }
            
            else {
                
                [(Enemy *)s updateEnemyXY];
                
            }
            
            if ([(Enemy *)s isFiring]) {
                
                [self fireBulletForSprite:s IsGoingUp:false];
                
            }
            
        }
        
    }
    
}

- (void)cleanUp {
    
    // Enemy sprites already remove themselves after displaying fire.
    // All that remains is bullet cleanup.
    
    NSMutableArray *removeArray = [[NSMutableArray alloc] init];
    
    for (SKSpriteNode *s in [self children]) {
        
        if ([s isKindOfClass:[BulletSprite class]]) {
            
            if ([s position].y > [self size].height
                ||
                [s position].y < 0.0) {
                
                [removeArray addObject:s];
                
            }
            
        }
        
    }
    
    // Done not to concurrently modify above array as we iterate
    for (BulletSprite *b in removeArray) {
        
        [b removeFromParent];
        
    }
    
}

- (void)checkForWinOrLoss {
    
    // Loss Check
    if (![_playerSprite isAlive]) {
        
        [self signalFailure];
        return;
        
    }
    
    // Win Check
    int enemyCount = 0;
    for (SKSpriteNode *s in self.children) {
        
        if ([s isKindOfClass:[Enemy class]]) {
            
            enemyCount++;
            
        }
        
    }
    
    if (enemyCount == 0) {
        
        [self signalVictory];
        
    }
    
}

- (void)signalFailure {
    
    if (_successLabel) {
        return;
    }
    
    if (!_failureLabel) {
        
        _failureLabel = [self createLabelAtCenter];
        _failureLabel.text = @"FAILURE";
        _failureLabel.fontColor = [UIColor redColor];

        [self backToMainMenu];
        
    }

}

- (void)signalVictory {
    
    if (_failureLabel) {
        return;
    }
    
    if (!_successLabel) {
        
        _successLabel = [self createLabelAtCenter];
        _successLabel.text = @"SUCCESS";
        _successLabel.fontColor = [UIColor greenColor];
     
        [self progressNextLevel];
        
    }
    
}

- (SKLabelNode *)createLabelAtCenter {
    
    SKLabelNode *returnLabel = [[SKLabelNode alloc] initWithFontNamed:DEFAULT_FONT];
    
    [returnLabel setFontSize:65];
    [returnLabel setPosition:CGPointMake([GameViewController width]/2, [GameViewController height]/2)];
    [returnLabel setZPosition:5.0];
    [self addChild:returnLabel];
    
    return returnLabel;
    
}

- (void)backToMainMenu {
    
    SKAction *wait = [SKAction waitForDuration:4.00];
    SKAction *replace = [SKAction performSelector:@selector(displayMainMenu) onTarget:[GameViewController sharedInstance]];
    
    SKAction *sequence = [SKAction sequence:@[wait, replace]];
    
    [self runAction:sequence];
    
}

- (void)progressNextLevel {
    
    SKAction *wait = [SKAction waitForDuration:4.00];
    SKAction *replace = [SKAction performSelector:@selector(progressToNextLevel) onTarget:[GameViewController sharedInstance]];
    
    SKAction *sequence = [SKAction sequence:@[wait, replace]];
    
    [self runAction:sequence];
    
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












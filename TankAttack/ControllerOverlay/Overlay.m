//
//  Overlay.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/16/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "Overlay.h"

@implementation Overlay {
    
    Joystick *_joystick;
    SKLabelNode *_bulletButton;
    
}

- (id)initIntoWorld:(World *)world {
    
    self = [super initWithColor:[UIColor blackColor] size:CGSizeMake(world.size.width, world.size.height/5)];
    
    if (self) {
        
        [self setPosition:CGPointMake(world.size.width/2, world.size.height/10)];
        [self setZPosition:2.0];        // Controller is 1, Fire is 2, all else 0
        
        [self createJoystickAtLocation:CGPointMake(-[self size].width/4, 0)];
        [self createBulletButton];
        
        [world addChild:self];

        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}

- (void)setParametersFromWorld:(World *)world {


    
    NSLog(@"color: %@, position: %f, %f", [self color], [self position].x, [self position].y);

    
}

- (void)createJoystickAtLocation:(CGPoint)location {
    
    SKSpriteNode *jsThumb = [SKSpriteNode spriteNodeWithImageNamed:@"joystick"];
    SKSpriteNode *jsBackdrop = [SKSpriteNode spriteNodeWithImageNamed:@"dpad"];
    _joystick = [Joystick joystickWithThumb:jsThumb andBackdrop:jsBackdrop];
    
    [_joystick setPosition:CGPointMake(location.x, location.y)];
    
    [self addChild:_joystick];
    
}

- (void)createBulletButton {
    
    _bulletButton = [[SKLabelNode alloc] initWithFontNamed:DEFAULT_FONT];
    
    [_bulletButton setFontColor:[UIColor whiteColor]];
    [_bulletButton setFontSize:45];
    [_bulletButton setText:@"FIRE"];
    [_bulletButton setPosition:CGPointMake([self size].width/4, 0.0)];
    [_bulletButton setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
    
    [self addChild:_bulletButton];
    
}

- (double)getXVelocity {
    
    if (_joystick) {
        
        return _joystick.velocity.x;
        
    }
    
    else  {
        
        return 0.0;
        
    }
    
}

- (double)getYVelocity {
    
    if (_joystick) {
        
        return _joystick.velocity.y;
        
    }
    
    else  {
        
        return 0.0;
        
    }
    
}

- (void)notifyOfTouchAtLocation:(CGPoint)location {
    
    if ([_bulletButton containsPoint:location]) {
        
        _isOverlayFiring = true;
        [_bulletButton setFontColor:[UIColor redColor]];
        
    }
    
}

- (void)notifyOfRelease {
    
    _isOverlayFiring = false;
    [_bulletButton setFontColor:[UIColor whiteColor]];
    
}

@end







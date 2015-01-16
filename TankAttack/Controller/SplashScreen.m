//
//  SplashScreen
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/15/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "GameViewController.h"
#import "SplashScreen.h"

@implementation SplashScreen {
    
    SKLabelNode *_pressedLabel;
    
    CFTimeInterval _previousTime;
    
}

- (id)initWithSize:(CGSize)size {
    
    self = [super initWithSize:size];
    self.scaleMode = SKSceneScaleModeAspectFill;
    self.backgroundColor = [UIColor UIColorFromHexString:@"#003f00"];
    return self;
    
}

-(void)didMoveToView:(SKView *)view {
    
    /* Setup your scene here */
    CGFloat distance = [self createStartButton];
    [self createDifficultyButtonWithDistance:distance];
    
}

- (CGFloat)createStartButton {
    
    CGFloat returnFloat;
    
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"DamascusBold"];
    
    myLabel.text = @"START";
    myLabel.fontSize = 65;
    myLabel.position = CGPointMake([GameViewController width]/2, [GameViewController height]/2);
    NSLog(@"height: %f", [GameViewController height]/2);
    returnFloat = myLabel.frame.size.height*1.5;
    
    [self addChild:myLabel];
    
    return returnFloat;
    
}

- (void)createDifficultyButtonWithDistance:(CGFloat)distance {
    
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"DamascusBold"];
    
    myLabel.text = @"DIFFICULTY";
    myLabel.fontSize = 65;
    myLabel.position = CGPointMake([GameViewController width]/2, [GameViewController height]/2-distance);
    
    NSLog(@"height: %f", [GameViewController height]/2+distance);
    
    [self addChild:myLabel];
    
//    
//    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"tank"];
//    
//    sprite.xScale = 0.5;
//    sprite.yScale = 0.5;
//    sprite.position = CGPointMake(50, 50);
//    
//    SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//    
//    [sprite runAction:[SKAction repeatActionForever:action]];
//
//    [self addChild:sprite];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
        [self testIfTouchedLabelWithLocation:[touch locationInNode:self]];
        
    }
    
}

- (void)testIfTouchedLabelWithLocation:(CGPoint)location {
    
    SKLabelNode *l;
    
    for (SKSpriteNode *s in self.children) {
        
        if ([s isKindOfClass:[SKLabelNode class]]) {
            
            l = (SKLabelNode *)s;
            
            if ([l containsPoint:location]) {
                
                [self handleLabelPressed:l];
                
            }
            
        }
        
    }
    
}

- (void)handleLabelPressed:(SKLabelNode *)l {
    
    if ([l.text isEqualToString:@"START"]) {
        
        _pressedLabel = l;
        
    }
    
    else if ([l.text isEqualToString:@"DIFFICULTY"]) {
        
        _pressedLabel = l;
        
    }
    
    _pressedLabel.fontColor = [UIColor UIColorFromHexString:@"#629632"];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    _pressedLabel.fontColor = [UIColor whiteColor];
    
    if ([_pressedLabel.text isEqualToString:@"START"]) {
        
        [[GameViewController sharedInstance] startGame];
        
    }
    
    else if ([_pressedLabel.text isEqualToString:@"DIFFICULTY"]) {
        
        NSLog(@"difficulty pressed!");
        
    }
    
}




-(void)update:(CFTimeInterval)currentTime {
    
    /* Called before each frame is rendered */
    
    
    _previousTime = currentTime;
    
}

@end


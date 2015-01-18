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
    self.backgroundColor = [UIColor UIColorFromHexString:BACKGROUND_GREEN_COLOR];
    return self;
    
}

-(void)didMoveToView:(SKView *)view {
    
    /* Setup your scene here */
    CGFloat distance = [self createStartButton];
    [self createDifficultyButtonWithOffsetFromStart:distance];
    [self createControlsButtonWithOffsetFromStart:distance];
    [self animateTankInBackground];
    [self animateSlildingInTitle];
    
}

- (CGFloat)createStartButton {
    
    CGFloat returnFloat;
    
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:DEFAULT_FONT];
    
    myLabel.text = @"START";
    myLabel.fontSize = 45;
    myLabel.position = CGPointMake([GameViewController width]/2, [GameViewController height]/2);
    myLabel.zPosition = 5.00;

    returnFloat = myLabel.frame.size.height*1.5;
    
    [self addChild:myLabel];
    
    return returnFloat;
    
}

- (void)createDifficultyButtonWithOffsetFromStart:(CGFloat)distance {
    
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:DEFAULT_FONT];
    
    myLabel.text = @"DIFFICULTY";
    myLabel.fontSize = 45;
    myLabel.position = CGPointMake([GameViewController width]/2, [GameViewController height]/2-distance);
    myLabel.zPosition = 5.00;
    
    [self addChild:myLabel];
    
}

- (void)createControlsButtonWithOffsetFromStart:(CGFloat)distance {
    
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:DEFAULT_FONT];
    
    myLabel.text = @"CONTROLS";
    myLabel.fontSize = 45;
    myLabel.position = CGPointMake([GameViewController width]/2, [GameViewController height]/2-2*distance);
    myLabel.zPosition = 5.00;

    [self addChild:myLabel];
    
}

- (void)animateTankInBackground {

    SKSpriteNode *tank = [SKSpriteNode spriteNodeWithImageNamed:@"tank"];

    [tank setScale:0.5];
    [tank setPosition:CGPointMake(-50, [GameViewController height]/6)];
    
    SKAction *actionRight = [SKAction moveToX:([GameViewController width]+50.0) duration:5.00];
    SKAction *actionLeft  = [SKAction moveToX:(-50.0) duration:5.00 ];
    
    SKAction *cycle = [SKAction sequence:@[actionRight, actionLeft]];
    SKAction *loop = [SKAction repeatActionForever:cycle];

    [tank runAction:loop];
    
    [self addChild:tank];
    
}

- (void)animateSlildingInTitle {
    
    SKLabelNode *tank = [SKLabelNode labelNodeWithFontNamed:DEFAULT_FONT];
    
    [tank setFontColor:[GameViewController tankColor]];
    
    tank.text = @"TANKATTACK";
    tank.fontSize = 55;
    tank.position = CGPointMake([GameViewController width]/2, [GameViewController height]+100);
    tank.zPosition = 5.00;
    
    SKAction *slide = [SKAction moveTo:CGPointMake([GameViewController width]/2, [GameViewController height]*3/4) duration:4.00];
    [tank runAction:slide];
    
    [self addChild:tank];
    
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

    _pressedLabel = l;
    _pressedLabel.fontColor = [GameViewController tankColor];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGPoint location = [[touches anyObject] locationInNode:self];
    
    _pressedLabel.fontColor = [UIColor whiteColor];
    
    if ([_pressedLabel containsPoint:location]) {
        
        [self handleSameLabelReleasedAsPressed];
        
    }
    
    else {
        
        // Released outside of button. Not interested in pressing the button.
        
    }
    
}

- (void)handleSameLabelReleasedAsPressed {
    
    if ([_pressedLabel.text isEqualToString:@"START"]) {
        
        [[GameViewController sharedInstance] startGame];
        
    }
    
    else if ([_pressedLabel.text isEqualToString:@"DIFFICULTY"]) {
        
        NSLog(@"difficulty pressed!");
        
    }
    
    else if ([_pressedLabel.text isEqualToString:@"CONTROLS"]) {
        
        NSLog(@"controls pressed!");
        
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    
    /* Called before each frame is rendered */
    
    
    _previousTime = currentTime;
    
}

@end


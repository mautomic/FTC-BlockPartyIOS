//
//  RedVC.m
//  FTC Scorer 13-14
//
//  Created by Maurya on 9/8/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import "RedVC.h"
#import "AutoVC.h"


// PI - This is defined in Math.h
#define M_PI   3.14159265358979323846264338327950288   

// The conversion definition
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@interface RedVC ()
@end

@implementation RedVC
@synthesize redscore, bluescore, balance, block, numOfBlocks, insideCrateL, insideCrateR, outsideCrateL, outsideCrateR, floor, plus1, pAreaLO, pAreaLI, pAreaRI, pAreaRO, numFloor, numIL, numIR, numOL, numOR;


// ***************** User is moving finger across screen *******************
// DONT WORRY ABOUT THIS FOR ANDROID - DIFFERENT CONCEPT

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [[event allTouches] anyObject];
	if ([touch view] == block) {
        
        CGPoint location = [touch locationInView:self.view];
        block.center = location;
        
	}
}


// **************************** User removed finger ****************************
// DONT WORRY ABOUT THIS FOR ANDROID - DIFFERENT CONCEPT

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
    // get the touch event
	UITouch *touch = [touches anyObject];
    
    // check for block placement
    [self checkForBlockPlacement];
    
    // Get screen bounds of the used device
    CGRect screenBounds = [[UIScreen mainScreen] bounds]; 
    
    // If iPhone...
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        if (screenBounds.size.height == 568) { // 4 inch screen
            
            // reset block images
            if ([touch view] == block) {
                CGRect frame = [block frame];
                frame.origin.x = 520;
                frame.origin.y = 40;
                [block setFrame:frame];
            }
            
        }
        else { // 3.5-inch screen
            
            // reset block image
            if ([touch view] == block) {
                CGRect frame = [block frame];
                frame.origin.x = 430;
                frame.origin.y = 35;
                [block setFrame:frame];
            }
        }  
    }
    
    // If iPad
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        // reset block image
        if ([touch view] == block) {
            CGRect frame = [block frame];
            frame.origin.x = 920;
            frame.origin.y = 60;
            [block setFrame:frame];
        }
        
    }
}


// ******************** Check for collision between two images *************************
// ANDROID IS DIFFERENT FOR COLLISIONS

- (bool) checkForCollision: (UIImageView *)imageView1 : (UIImageView *)imageView2 {
    
    if (CGRectIntersectsRect(imageView1.frame, imageView2.frame))
        return true;
    return false;
}


// ***************** Check if block touched floor and add score/animation if so ******************


- (void) placeBlockOnFloor {
    
    // call method and return boolean to check if block was placed on the floor
    bool placedBlock = [self checkForCollision:block: floor];
    
    if (placedBlock) {
        
        numOfBlocksFloor++;
        redScore++;
        [self updateScoreLabels];
        [self updateBlockLabels];
                
        // set timer for a 0.5 second animation of a "+1" pic to confirm the score
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(showplus1) userInfo:nil repeats:NO];
        
        // set it to hidden again
        plus1.hidden = NO;

    }
}


// **************************** Method that Timer calls to show +1 ****************************

- (void) showplus1 {
    plus1.hidden = YES;
}


// *********************** Method to check for block placemont on crate ****************************

- (void) checkForBlockPlacement {
    
    // Check for collision and if there is one, update ratio then execute scoring/image processing
    
    if (app.blockCounterBlue + app.blockCounterRed < 100) {
        
        // INNER LEFT CRATE
        if ([self checkForCollision: block: pAreaLI]) {
            
            ratio--;
            insideCrateLval  = [self placeBlockInCrate: insideCrateL  : insideCrateLval  : 2];
            numOfBlocksIL++;
            [self updateBlockLabels];
            [self checkForPendulumBalance:ratio];
        }
        
        // INNER RIGHT CRATE
        if ([self checkForCollision: block: pAreaRI]) {
            
            ratio++;
            insideCrateRval  = [self placeBlockInCrate: insideCrateR  : insideCrateRval  : 2];
            numOfBlocksIR++;
            [self updateBlockLabels];
            [self checkForPendulumBalance:ratio];
        }
        
        // OUTER LEFT CRATE
        if ([self checkForCollision: block: pAreaLO]) {
            
            ratio--;
            outsideCrateLval = [self placeBlockInCrate: outsideCrateL : outsideCrateLval : 3];
            numOfBlocksOL++;
            [self updateBlockLabels];
            [self checkForPendulumBalance:ratio];
        }
        
        // OUTER RIGHT CRATE
        if ([self checkForCollision: block: pAreaRO]) {
            
            ratio++;
            outsideCrateRval = [self placeBlockInCrate: outsideCrateR : outsideCrateRval : 3];
            numOfBlocksOR++;
            [self updateBlockLabels];
            [self checkForPendulumBalance:ratio];
            
        }
        
        // check to see if block was placed on the floor
        [self placeBlockOnFloor];
        
    }
    
}

// **************************** User removed finger ****************************


- (int) placeBlockInCrate: (UIImageView *)crate : (int)val : (int)score {
 
    // create images needed for grpahic updates
    UIImage *bigcrate1   = [UIImage imageNamed: @"bigcrate1.png"];
    UIImage *bigcrate2   = [UIImage imageNamed: @"bigcrate2.png"];
    UIImage *bigcrate3   = [UIImage imageNamed: @"bigcrate3.png"];
    UIImage *bigcrate4   = [UIImage imageNamed: @"bigcrate4.png"];
    UIImage *bigcrate5   = [UIImage imageNamed: @"bigcrate5.png"];
    UIImage *bigcrate6   = [UIImage imageNamed: @"bigcrate6.png"];
    UIImage *bigcrate7   = [UIImage imageNamed: @"bigcrate7.png"];
    
    // update the # of blocks because one was just placed
    app.blockCounterRed++;
        
    // Huge if-statement where value of the crate is checked and then sets up the next image in order
    // then adds score    
    
    if (val == 0) {
        [crate setImage:bigcrate1];
        val = 1;
        [self addRedScore:score];
    }
    else if (val == 1) {
        [crate setImage:bigcrate2];
        val = 2;
        [self addRedScore:score];
    }
    else if (val == 2) {
        [crate setImage:bigcrate3];
        val = 3;
        [self addRedScore:score];
    }
    else if (val == 3) {
        [crate setImage:bigcrate4];
        val = 4;
        [self addRedScore:score];
    }
    else if (val == 4) {
        [crate setImage:bigcrate5];
        val = 5;
        [self addRedScore:score];
    }  
    else if (val == 5) {
        [crate setImage:bigcrate6];
        val = 6;
        [self addRedScore:score];
    }  
    else if (val == 6) {
        [crate setImage:bigcrate7];
        val = 7;
        [self addRedScore:score];
    }  
    else
        [self addRedScore:score];
        
    return val;

}


// **************************** Check ratio to update graphics ****************************


- (void) checkForPendulumBalance: (int) aRatio {
    
     CGRect screenBounds = [[UIScreen mainScreen] bounds]; 
    
    // If iPhone...
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        if (screenBounds.size.height == 568) { // 4 inch screen
            
            if (aRatio == 9)        [self updatePendulumAnimation:94 :109 :139 :154 :9.0];
            else if (aRatio == 8)   [self updatePendulumAnimation:97 :110 :138 :151 :8.0];
            else if (aRatio == 7)   [self updatePendulumAnimation:100 :111 :137 :148 :7.0];   
            else if (aRatio == 6)   [self updatePendulumAnimation:104 :113 :135 :144 :6.0];  
            else if (aRatio == 5)   [self updatePendulumAnimation:108 :115 :133 :140 :5.0]; //LEFT            
            else if (aRatio == 4)   [self updatePendulumAnimation:111 :117 :131 :137 :4.0];               
            else if (aRatio == 3)   [self updatePendulumAnimation:115 :119 :129 :133 :3.0];               
            else if (aRatio == 2)   [self updatePendulumAnimation:117 :120 :128 :131 :2.0];                
            else if (aRatio == 1)   [self updatePendulumAnimation:120 :122 :126 :128 :1.0];               
            else if (aRatio == 0)   [self updatePendulumAnimation:124 :124 :124 :124 :0.0]; //CENTERED            
            else if (aRatio == -1)  [self updatePendulumAnimation:128 :126 :122 :120 :-1.0];               
            else if (aRatio == -2)  [self updatePendulumAnimation:131 :128 :120 :117 :-2.0];           
            else if (aRatio == -3)  [self updatePendulumAnimation:133 :129 :119 :115 :-3.0];   
            else if (aRatio == -4)  [self updatePendulumAnimation:137 :131 :117 :112 :-4.0];   
            else if (aRatio == -5)  [self updatePendulumAnimation:140 :133 :115 :109 :-5.0];// RIGHT
            else if (aRatio == -6)  [self updatePendulumAnimation:144 :135 :113 :106 :-6.0];
            else if (aRatio == -7)  [self updatePendulumAnimation:148 :137 :111 :103 :-7.0];
            else if (aRatio == -8)  [self updatePendulumAnimation:151 :138 :110 :100 :-8.0];
            else if (aRatio == -9)  [self updatePendulumAnimation:154 :139 :109 :94 :-9.0];
            
        }
        else { // 3.5-inch screen
            
            if (aRatio == 9)        [self updatePendulumAnimation:96 :109 :139 :152 :9.0];
            else if (aRatio == 8)   [self updatePendulumAnimation:99 :111 :137 :149 :8.0];
            else if (aRatio == 7)   [self updatePendulumAnimation:102 :113 :135 :146 :7.0];   
            else if (aRatio == 6)   [self updatePendulumAnimation:106 :115 :133 :142 :6.0];  
            else if (aRatio == 5)   [self updatePendulumAnimation:109 :117 :131 :139 :5.0]; //LEFT            
            else if (aRatio == 4)   [self updatePendulumAnimation:112 :118 :130 :136 :4.0];               
            else if (aRatio == 3)   [self updatePendulumAnimation:115 :119 :129 :133 :3.0];               
            else if (aRatio == 2)   [self updatePendulumAnimation:117 :120 :128 :131 :2.0];                
            else if (aRatio == 1)   [self updatePendulumAnimation:120 :122 :126 :128 :1.0];               
            else if (aRatio == 0)   [self updatePendulumAnimation:124 :124 :124 :124 :0.0]; //CENTERED            
            else if (aRatio == -1)  [self updatePendulumAnimation:128 :126 :122 :120 :-1.0];               
            else if (aRatio == -2)  [self updatePendulumAnimation:131 :128 :120 :117 :-2.0];           
            else if (aRatio == -3)  [self updatePendulumAnimation:133 :129 :119 :115 :-3.0];   
            else if (aRatio == -4)  [self updatePendulumAnimation:136 :130 :118 :112 :-4.0];   
            else if (aRatio == -5)  [self updatePendulumAnimation:139 :131 :117 :109 :-5.0];// RIGHT
            else if (aRatio == -6)  [self updatePendulumAnimation:142 :133 :115 :106 :-6.0];
            else if (aRatio == -7)  [self updatePendulumAnimation:145 :135 :113 :103 :-7.0];
            else if (aRatio == -8)  [self updatePendulumAnimation:149 :137 :111 :99 :-8.0];
            else if (aRatio == -9)  [self updatePendulumAnimation:152 :139 :109 :96 :-9.0];
        
        }  
    }
    
    // If iPad
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {

        if (aRatio == 9)        [self updatePendulumAnimation:293 :318 :370 :395 :9.0];
        else if (aRatio == 8)   [self updatePendulumAnimation:299 :321 :367 :389 :8.0];
        else if (aRatio == 7)   [self updatePendulumAnimation:305 :324 :364 :383 :7.0];   
        else if (aRatio == 6)   [self updatePendulumAnimation:310 :327 :361 :378 :6.0];  
        else if (aRatio == 5)   [self updatePendulumAnimation:316 :330 :358 :372 :5.0]; //LEFT            
        else if (aRatio == 4)   [self updatePendulumAnimation:323 :333 :355 :365 :4.0];               
        else if (aRatio == 3)   [self updatePendulumAnimation:328 :336 :352 :360 :3.0];               
        else if (aRatio == 2)   [self updatePendulumAnimation:333 :339 :349 :355 :2.0];                
        else if (aRatio == 1)   [self updatePendulumAnimation:339 :342 :346 :349 :1.0];
        
        else if (aRatio == 0)   [self updatePendulumAnimation:344 :344 :344 :344 :0.0]; //CENTERED   
        
        else if (aRatio == -1)  [self updatePendulumAnimation:349 :346 :342 :339 :-1.0];               
        else if (aRatio == -2)  [self updatePendulumAnimation:355 :349 :339 :333 :-2.0];           
        else if (aRatio == -3)  [self updatePendulumAnimation:360 :352 :336 :328 :-3.0];   
        else if (aRatio == -4)  [self updatePendulumAnimation:365 :355 :333 :323 :-4.0];   
        else if (aRatio == -5)  [self updatePendulumAnimation:372 :358 :330 :316 :-5.0];// RIGHT
        else if (aRatio == -6)  [self updatePendulumAnimation:378 :361 :327 :310 :-6.0];
        else if (aRatio == -7)  [self updatePendulumAnimation:383 :364 :324 :305 :-7.0];
        else if (aRatio == -8)  [self updatePendulumAnimation:389 :367 :321 :299 :-8.0];
        else if (aRatio == -9)  [self updatePendulumAnimation:395 :370 :318 :293 :-9.0];
        
    }
    
    
    

}



// *************** method to update the animation, called from above method ***********************


- (void) updatePendulumAnimation: (CGFloat) yOCL : (CGFloat) yICL : (CGFloat) yICR : (CGFloat) yOCR : (CGFloat) degrees {
    
    // rotate images so they act realistic, rotateImage is a custom method from internet
    [self rotateImage:insideCrateL  duration:0.2 curve:0 degrees:degrees];
    [self rotateImage:insideCrateR  duration:0.2 curve:0 degrees:degrees];
    [self rotateImage:outsideCrateL duration:0.2 curve:0 degrees:degrees];
    [self rotateImage:outsideCrateR duration:0.2 curve:0 degrees:degrees];
    [self rotateImage:balance       duration:0.2 curve:0 degrees:degrees];
    
    
    // update location of the crates based on the pendulum
    insideCrateL.center = CGPointMake(insideCrateL.center.x, yICL);
    insideCrateR.center = CGPointMake(insideCrateR.center.x, yICR);
    outsideCrateL.center = CGPointMake(outsideCrateL.center.x, yOCL);
    outsideCrateR.center = CGPointMake(outsideCrateR.center.x, yOCR);
    
    // updates location of the drag-event recieving area in the crate
    pAreaLO.center = CGPointMake(outsideCrateL.center.x, outsideCrateL.center.y);
    pAreaLI.center = CGPointMake(insideCrateL.center.x, insideCrateL.center.y);
    pAreaRI.center = CGPointMake(insideCrateR.center.x, insideCrateR.center.y);
    pAreaRO.center = CGPointMake(outsideCrateR.center.x, outsideCrateR.center.y);
    
}


// *********************** method to update score labels in the view **************************

- (void) updateScoreLabels {
    
    // update number of blocks left to use
    [numOfBlocks setText:[NSString stringWithFormat:@"%d", 100 - app.blockCounterRed - app.blockCounterBlue]];
    
    // update red and blue scores
    [redscore setText:[NSString stringWithFormat:@"%d", redScore]];
    [bluescore setText:[NSString stringWithFormat:@"%d", app.blueBlockScore]];
    
    
}

// *********************** method to update score labels in the view **************************

- (void) updateBlockLabels {
    
    [numOL    setText: [NSString stringWithFormat:@"%d", numOfBlocksOL]];
    [numOR    setText: [NSString stringWithFormat:@"%d", numOfBlocksOR]];
    [numIL    setText: [NSString stringWithFormat:@"%d", numOfBlocksIL]];
    [numIR    setText: [NSString stringWithFormat:@"%d", numOfBlocksIR]];
    [numFloor setText: [NSString stringWithFormat:@"%d", numOfBlocksFloor]];
    
    
    
}


// ************************** method to add score to the red score **************************

- (void) addRedScore:(int)value {
    
    redScore += value;
    // set redscore in this view to the global app var
    app.redBlockScore = redScore;
    [self updateScoreLabels];    
}

- (void) subtractRedScore:(int)value {
    
    redScore -= value;
    // set redscore in this view to the global app var
    app.redBlockScore = redScore;
    [self updateScoreLabels];    

}

// ************************** clear all of the crates, points, labels **************************

- (IBAction)clear:(id)sender {    
    
    // reset everything to 0 from this side of the view
    redScore = 0;
    redScoreBonus = 0;
    app.redBlockScore = 0;
    app.blockCounterRed = 0;
    ratio = 0;
    
    insideCrateLval  = 0;
    insideCrateRval  = 0;
    outsideCrateLval = 0;
    outsideCrateRval = 0;
    
    numOfBlocksFloor = 0;
    numOfBlocksIL = 0;
    numOfBlocksIR = 0;
    numOfBlocksOL = 0;
    numOfBlocksOR = 0;
    
    // reset pendulum graphics -- coordinates
    // If iPhone...
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self updatePendulumAnimation:124 :124 :124 :124 :0.0];
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [self updatePendulumAnimation:344 :344 :344 :344 :0.0];
    }
    
    // reset score labels
    [self updateScoreLabels];
    [self updateBlockLabels];
    
    // change image back to empty crate
    UIImage *emptyCrate  = [UIImage imageNamed: @"bigcrate.png"];
    [insideCrateL  setImage:emptyCrate];
    [insideCrateR  setImage:emptyCrate];
    [outsideCrateL setImage:emptyCrate];
    [outsideCrateR setImage:emptyCrate];
    
}


// ****************************** User clicks finalize *******************************


- (IBAction)finalize:(id)sender {
    
    if (ratio <= 2 && ratio >= -2) {
        app.redBonusScore = app.redBlockScore * .5;
    }
    else
        app.redBonusScore = 0;
    
    EndGameVC *evc = [self.storyboard instantiateViewControllerWithIdentifier:@"endGameVC"];
    [self presentViewController:evc animated:YES completion:nil];
    
}

- (IBAction)back:(id)sender {
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
    
}

// ****************** Advanced method used for rotating an image (not mine/internet code) *********************


- (void)rotateImage:(UIImageView *)image duration:(NSTimeInterval)duration 
              curve:(int)curve degrees:(CGFloat)degrees
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = 
    CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degrees));
    image.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}


// ****************** SYSTEM METHODS *******************

// whenever tab is switched
- (void)viewWillAppear:(BOOL)animated {
    
    [self updateScoreLabels];
}
- (void)viewDidAppear:(BOOL)animated {
    
    [self updateScoreLabels];
}


// **************************** View loading ****************************

- (void)viewDidLoad
{
    ratio = 0;
    
    app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    app.blockCounterRed = 0;
    app.redBlockScore = 0;
    
    redScore = 0;
    redScoreBonus = 0;
    
    isBalanced = false;
    
    insideCrateLval  = 0;
    insideCrateRval  = 0;
    outsideCrateLval = 0;
    outsideCrateRval = 0;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

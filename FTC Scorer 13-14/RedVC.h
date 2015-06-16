//
//  RedVC.h
//  FTC Scorer 13-14
//
//  Created by Maurya on 9/8/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class AppDelegate;
@interface RedVC : UIViewController {

    // shared object for global app vars
    AppDelegate *app;
    
    // keep track of local score in view
    int redScore;
    int redScoreBonus;
    
    bool isBalanced;
    
    // crate values to keep track of what image
    int insideCrateLval;
    int insideCrateRval;
    int outsideCrateLval;
    int outsideCrateRval;
    
    int numOfBlocksIL;
    int numOfBlocksOL;
    int numOfBlocksOR;
    int numOfBlocksIR;
    int numOfBlocksFloor;
    
    // ratio of pendulum balance (ex. 2 blocks on left, ratio -2. 4 on right, ratio +4)
    int ratio;


}

// Button Actions

- (IBAction)clear:(id)sender;
- (IBAction)finalize:(id)sender;
- (IBAction)back:(id)sender;

// Collision Methods

- (bool) checkForCollision: (UIImageView *) imageView1 : (UIImageView *)imageView2;
- (void) checkForBlockPlacement;
- (void) placeBlockOnFloor;
- (int) placeBlockInCrate: (UIImageView *) iv : (int) val : (int) score;

// Scoring Methods and Label Updates

- (void) updateScoreLabels;
- (void) updateBlockLabels;
//- (void) updateBonus;
- (void) addRedScore:(int)value;
- (void) subtractRedScore:(int)value;
- (void) showplus1;

// Animations

- (void) checkForPendulumBalance: (int)ratio;
- (void) updatePendulumAnimation: (CGFloat) yICR : (CGFloat) yICL : (CGFloat) yOCR : (CGFloat) yOCL : (CGFloat) degrees;
- (void)rotateImage:(UIImageView *)image duration:(NSTimeInterval)duration 
              curve:(int)curve degrees:(CGFloat)degrees;


// View Components

@property (nonatomic, retain) IBOutlet UILabel *redscore;
@property (nonatomic, retain) IBOutlet UILabel *bluescore;
@property (nonatomic, retain) IBOutlet UILabel *numOfBlocks;

@property (nonatomic, retain) IBOutlet UIImageView *balance;
@property (nonatomic, retain) IBOutlet UIImageView *outsideCrateL;
@property (nonatomic, retain) IBOutlet UIImageView *outsideCrateR;
@property (nonatomic, retain) IBOutlet UIImageView *insideCrateL;
@property (nonatomic, retain) IBOutlet UIImageView *insideCrateR;
@property (nonatomic, retain) IBOutlet UIImageView *floor;
@property (nonatomic, retain) IBOutlet UIImageView *block;

@property (nonatomic, retain) IBOutlet UIImageView *plus1;

@property (nonatomic, retain) IBOutlet UIImageView *pAreaLO;
@property (nonatomic, retain) IBOutlet UIImageView *pAreaLI;
@property (nonatomic, retain) IBOutlet UIImageView *pAreaRI;
@property (nonatomic, retain) IBOutlet UIImageView *pAreaRO;

@property (nonatomic, retain) IBOutlet UILabel *numIL;
@property (nonatomic, retain) IBOutlet UILabel *numOL;
@property (nonatomic, retain) IBOutlet UILabel *numIR;
@property (nonatomic, retain) IBOutlet UILabel *numOR;
@property (nonatomic, retain) IBOutlet UILabel *numFloor;



@end











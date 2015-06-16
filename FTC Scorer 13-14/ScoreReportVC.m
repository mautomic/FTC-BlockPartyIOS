//
//  ScoreReportVC.m
//  FTC Scorer 13-14
//
//  Created by Maurya on 11/27/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import "ScoreReportVC.h"

@interface ScoreReportVC ()

@end

@implementation ScoreReportVC
@synthesize redAutonomousLabel, redBlockScoreLabel, redBlockTotalLabel, redEndGameLabel, redTotalScoreLabel,blueAutonomousLabel, blueBlockScoreLabel, blueBlockTotalLabel, blueEndGameLabel, blueTotalScoreLabel, redBlockBonusLabel, blueBlockBonusLabel;



- (IBAction)restart:(id)sender {
    
    
    app.redAutoScore = 0;
    app.redBonusScore = 0;
    app.redEndGameScore = 0;
    
    app.blueAutoScore = 0;
    app.blueBonusScore = 0;
    app.blueEndGameScore = 0;
    
    [self.presentingViewController.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)done:(id)sender {
    
    app.redAutoScore = 0;
    app.redBonusScore = 0;
    app.redEndGameScore = 0;
    
    app.blueAutoScore = 0;
    app.blueBonusScore = 0;
    app.blueEndGameScore = 0;
    
    
        
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
      
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [redBlockScoreLabel setText:[NSString stringWithFormat:@"%d", app.redBlockScore]];
    [redBlockBonusLabel setText:[NSString stringWithFormat:@"%d", app.redBonusScore]];
    [redBlockTotalLabel setText:[NSString stringWithFormat:@"%d", app.blockCounterRed]];
    [redAutonomousLabel setText:[NSString stringWithFormat:@"%d", app.redAutoScore]];
    [redEndGameLabel    setText:[NSString stringWithFormat:@"%d", app.redEndGameScore]];
    [redTotalScoreLabel setText:[NSString stringWithFormat:@"%d", 
                                 app.redBlockScore + app.redAutoScore + app.redBonusScore + app.redEndGameScore]];
    
    [blueBlockScoreLabel setText:[NSString stringWithFormat:@"%d", app.blueBlockScore]];
    [blueBlockBonusLabel setText:[NSString stringWithFormat:@"%d", app.blueBonusScore]];
    [blueBlockTotalLabel setText:[NSString stringWithFormat:@"%d", app.blockCounterBlue]];
    [blueAutonomousLabel setText:[NSString stringWithFormat:@"%d", app.blueAutoScore]];
    [blueEndGameLabel    setText:[NSString stringWithFormat:@"%d", app.blueEndGameScore]];
    [blueTotalScoreLabel setText:[NSString stringWithFormat:@"%d", 
                                 app.blueBlockScore + app.blueAutoScore + app.blueBonusScore + app.blueEndGameScore]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

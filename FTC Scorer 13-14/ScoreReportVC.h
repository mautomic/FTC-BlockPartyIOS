//
//  ScoreReportVC.h
//  FTC Scorer 13-14
//
//  Created by Maurya on 11/27/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ScoreReportVC : UIViewController {
    
    AppDelegate *app;
}

- (IBAction)done:(id)sender;
- (IBAction)restart:(id)sender;

@property (nonatomic, retain) IBOutlet UILabel *redBlockScoreLabel;
@property (nonatomic, retain) IBOutlet UILabel *redBlockBonusLabel;
@property (nonatomic, retain) IBOutlet UILabel *redBlockTotalLabel;
@property (nonatomic, retain) IBOutlet UILabel *redAutonomousLabel;
@property (nonatomic, retain) IBOutlet UILabel *redEndGameLabel;
@property (nonatomic, retain) IBOutlet UILabel *redTotalScoreLabel;

@property (nonatomic, retain) IBOutlet UILabel *blueBlockScoreLabel;
@property (nonatomic, retain) IBOutlet UILabel *blueBlockBonusLabel;
@property (nonatomic, retain) IBOutlet UILabel *blueBlockTotalLabel;
@property (nonatomic, retain) IBOutlet UILabel *blueAutonomousLabel;
@property (nonatomic, retain) IBOutlet UILabel *blueEndGameLabel;
@property (nonatomic, retain) IBOutlet UILabel *blueTotalScoreLabel;

@end

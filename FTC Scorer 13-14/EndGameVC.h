//
//  Extras2VC.h
//  FTC Scorer 13-14
//
//  Created by Maurya on 11/27/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ScoreReportVC.h"

@interface EndGameVC : UIViewController {

    AppDelegate *app;
    int redEndPoints;
    int blueEndPoints;

}


- (IBAction)back:(id)sender;
- (IBAction)done:(id)sender;

- (void) sumUpEndGamePoints;


@property (nonatomic, retain) IBOutlet UISegmentedControl *redFlag;
@property (nonatomic, retain) IBOutlet UISegmentedControl *redLift;
@property (nonatomic, retain) IBOutlet UISegmentedControl *blueFlag;
@property (nonatomic, retain) IBOutlet UISegmentedControl *blueLift;


@end

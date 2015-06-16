//
//  Extras2VC.m
//  FTC Scorer 13-14
//
//  Created by Maurya on 11/27/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import "EndGameVC.h"

@interface EndGameVC ()

@end

@implementation EndGameVC
@synthesize redFlag, redLift, blueFlag, blueLift;


- (IBAction)back:(id)sender {
    
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)done:(id)sender {
    
    
    [self sumUpEndGamePoints];
    
    app.redEndGameScore = redEndPoints;
    app.blueEndGameScore = blueEndPoints;
    
    redEndPoints = 0;
    blueEndPoints = 0;
    
    
    ScoreReportVC *srvc = [self.storyboard instantiateViewControllerWithIdentifier:@"scoreReportVC"];
    [self presentViewController:srvc animated:YES completion:nil];
    
    
}


- (void) sumUpEndGamePoints {

    // red team flag
    switch (redFlag.selectedSegmentIndex) {
            
        case 1: redEndPoints += 15; break;
        case 2: redEndPoints += 35; break;
        default: break;
    }
    
    // red team lift
    switch (redLift.selectedSegmentIndex) {
            
        case 1: redEndPoints += 50; break;
        case 2: redEndPoints += 100; break;
        default: break;
    }
    
    // blue team flag
    switch (blueFlag.selectedSegmentIndex) {
            
        case 1: blueEndPoints += 15; break;
        case 2: blueEndPoints += 35; break;
        default: break;
    }
    
    // blue team lift
    switch (blueLift.selectedSegmentIndex) {
            
        case 1: blueEndPoints += 50; break;
        case 2: blueEndPoints += 100; break;
        default: break;
    }
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	
    redEndPoints = 0;
    blueEndPoints = 0;
    
    app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
              
        [redLift setFrame:CGRectMake
         (redLift.frame.origin.x, redLift.frame.origin.y, redLift.frame.size.width, 40)];
        [redFlag setFrame:CGRectMake
         (redFlag.frame.origin.x, redFlag.frame.origin.y, redFlag.frame.size.width, 40)];
        [blueLift setFrame:CGRectMake
         (blueLift.frame.origin.x, blueLift.frame.origin.y, blueLift.frame.size.width, 40)];
        [blueFlag setFrame:CGRectMake
         (blueFlag.frame.origin.x, blueFlag.frame.origin.y, blueFlag.frame.size.width, 40)];
        
    }

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

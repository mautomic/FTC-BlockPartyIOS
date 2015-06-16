//
//  ExtrasVC.h
//  FTC Scorer 13-14
//
//  Created by Maurya on 11/26/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EndGameVC.h"
#import "AppDelegate.h"
#import "RedVC.h"
#import "BlueVC.h"

@interface AutoVC : UIViewController {

    AppDelegate *app;
    int redAutoPoints;
    int blueAutoPoints;
    
}

- (IBAction)next:(id)sender;

- (void) sumUpAutonomousPoints;



// list of switches for first page (iPhone)
@property (nonatomic, retain) IBOutlet UISegmentedControl *red1block;
@property (nonatomic, retain) IBOutlet UISegmentedControl *red2block;
@property (nonatomic, retain) IBOutlet UISegmentedControl *blue1block;
@property (nonatomic, retain) IBOutlet UISegmentedControl *blue2block;
@property (nonatomic, retain) IBOutlet UISegmentedControl *red1ramp;
@property (nonatomic, retain) IBOutlet UISegmentedControl *red2ramp;
@property (nonatomic, retain) IBOutlet UISegmentedControl *blue1ramp;
@property (nonatomic, retain) IBOutlet UISegmentedControl *blue2ramp;





@end

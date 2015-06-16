//
//  ExtrasVC.m
//  FTC Scorer 13-14
//
//  Created by Maurya on 11/26/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import "AutoVC.h"

@interface AutoVC ()

@end

@implementation AutoVC
@synthesize red1block, red2block, red1ramp, red2ramp, blue1block, blue2block, blue1ramp, blue2ramp;


- (IBAction)next:(id)sender {
            
    [self sumUpAutonomousPoints];
        
    app.redAutoScore = redAutoPoints;
    app.blueAutoScore = blueAutoPoints;
    
    redAutoPoints = 0;
    blueAutoPoints = 0;
        
    UITabBarController *rvc = [self.storyboard instantiateViewControllerWithIdentifier:@"tbController"];
    [self presentViewController:rvc animated:YES completion:nil];
    
}



- (void) sumUpAutonomousPoints {
    
    // red team 1 block
    switch (red1block.selectedSegmentIndex) {
        
        case 1: redAutoPoints += 5;  break;
        case 2: redAutoPoints += 20; break;
        case 3: redAutoPoints += 40; break;
        default: break;
    }
    
    // red team 2 block
    switch (red2block.selectedSegmentIndex) {
        
        case 1: redAutoPoints += 5;  break;
        case 2: redAutoPoints += 20; break;
        case 3: redAutoPoints += 40; break;
        default: break;
    }
    
    // blue team 1 block
    switch (blue1block.selectedSegmentIndex) {
        
        case 1: blueAutoPoints += 5;  break;
        case 2: blueAutoPoints += 20; break;
        case 3: blueAutoPoints += 40; break;
        default: break;
    }
    
    // blue team 2 block
    switch (blue2block.selectedSegmentIndex) {
        
        case 1: blueAutoPoints += 5;  break;
        case 2: blueAutoPoints += 20; break;
        case 3: blueAutoPoints += 40; break;
        default: break;    
    }
    
    // red team 1 ramp
    switch (red1ramp.selectedSegmentIndex) {
            
        case 1: redAutoPoints += 10; break;
        case 2: redAutoPoints += 20; break;
        default: break;
    }
    
    // red team 2 ramp
    switch (red2ramp.selectedSegmentIndex) {
            
        case 1: redAutoPoints += 10; break;
        case 2: redAutoPoints += 20; break;
        default: break;
    }
    
    // blue team 1 ramp
    switch (blue1ramp.selectedSegmentIndex) {
            
        case 1: blueAutoPoints += 10; break;
        case 2: blueAutoPoints += 20; break;
        default: break;
    }
    
    // blue team 2 ramp
    switch (blue2ramp.selectedSegmentIndex) {
            
        case 1: blueAutoPoints += 10; break;
        case 2: blueAutoPoints += 20; break;
        default: break;
    }
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        // setting up uisegmentcontrols to height of 40 for the ipad
        [red1block setFrame:CGRectMake
            (red1block.frame.origin.x, red1block.frame.origin.y, red1block.frame.size.width, 40)];
        [red2block setFrame:CGRectMake
            (red2block.frame.origin.x, red2block.frame.origin.y, red2block.frame.size.width, 40)];
        
        [red1ramp setFrame:CGRectMake(red1ramp.frame.origin.x, red1ramp.frame.origin.y, red1ramp.frame.size.width, 40)];
        [red2ramp setFrame:CGRectMake(red2ramp.frame.origin.x, red2ramp.frame.origin.y, red2ramp.frame.size.width, 40)];
        
        [blue1block setFrame:CGRectMake
            (blue1block.frame.origin.x, blue1block.frame.origin.y, blue1block.frame.size.width, 40)];
        [blue2block setFrame:CGRectMake
            (blue2block.frame.origin.x, blue2block.frame.origin.y, blue2block.frame.size.width, 40)];
        [blue1ramp setFrame:CGRectMake
            (blue1ramp.frame.origin.x, blue1ramp.frame.origin.y, blue1ramp.frame.size.width, 40)];
        [blue2ramp setFrame:CGRectMake
            (blue2ramp.frame.origin.x, blue2ramp.frame.origin.y, blue2ramp.frame.size.width, 40)];
        
    }
    
    
    redAutoPoints = 0;
    blueAutoPoints = 0;
    
    app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

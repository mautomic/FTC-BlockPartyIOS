//
//  HelpVC.m
//  FTC Scorer 13-14
//
//  Created by Maurya on 11/30/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import "HelpVC.h"

@interface HelpVC ()

@end

@implementation HelpVC


- (IBAction)help:(id)sender {
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.usfirst.org/sites/default/files/uploadedFiles/Robotics_Programs/FTC/Game_Info/2013/FTC-2013-2014_Game_One_Page.pdf"]];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

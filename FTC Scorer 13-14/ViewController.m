//
//  ViewController.m
//  FTC Scorer 13-14
//
//  Created by Maurya on 9/8/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize vipergear, scoregear, contactgear;



// Email componser method

- (IBAction)emailComposer:(id)sender {
    
    // Check internet connection
    if ([MFMailComposeViewController canSendMail]) {
        
        // create mail view controller on screen and set properties
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setEditing:YES];
        [mailViewController setSubject:@"Suggestions/Comments/Problems"];
        [mailViewController setToRecipients:contactList];
        [self presentViewController:mailViewController animated:YES completion:NULL];
    }
    
    // No internet connection, create and display alert
    else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No Network Connection or No Email Set Up" delegate:nil cancelButtonTitle:@"OK" 
                                              otherButtonTitles: nil];
        [alert show];
    }
}


// Method to hit cancel and remove email view controlelr

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}


// Load the view when first opened

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Code for setting subtle pattern in background of iPhone/iPad view
    
    /*
    UIImage *bgimg = [UIImage imageNamed:@"green"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bgimg];
    */
    
    
    // Email??
    contactList = [NSArray arrayWithObjects:@"x@gmail.com", nil];
    
    
    // Set up animation properties for the applying object
    forward = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    forward.fromValue = [NSNumber numberWithFloat:0];
    forward.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    forward.duration = 5.0; // Speed
    forward.repeatCount = HUGE_VALF; // Repeat forever
    
    
	// Set up animation properties for the applying object
    backward = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    backward.fromValue = [NSNumber numberWithFloat:0];
    backward.toValue = [NSNumber numberWithFloat:(-2*M_PI)];
    backward.duration = 5.0; // Speed
    backward.repeatCount = HUGE_VALF; // Repeat forever
    
    
    // Set rotation objects to images
    [scoregear.layer    addAnimation:backward  forKey:@"Spin"];
    [contactgear.layer  addAnimation:forward  forKey:@"Spin"];
    [vipergear.layer    addAnimation:backward forKey:@"Spin"];
}


// When view is not on the screen anymore

- (void)viewDidUnload 
{
    [super viewDidUnload];
    
    [scoregear.layer removeAllAnimations];
    [vipergear.layer removeAllAnimations];
    [contactgear.layer removeAllAnimations];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    
    // Set rotation objects to images
    [scoregear.layer    addAnimation:backward  forKey:@"Spin"];
    [contactgear.layer  addAnimation:forward  forKey:@"Spin"];
    [vipergear.layer    addAnimation:backward forKey:@"Spin"];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

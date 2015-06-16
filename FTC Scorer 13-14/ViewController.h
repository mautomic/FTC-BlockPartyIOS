//
//  ViewController.h
//  FTC Scorer 13-14
//
//  Created by Maurya on 9/8/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController : UIViewController <MFMailComposeViewControllerDelegate> {
    
    // email array, and forward and backward animation objects
    NSArray *contactList;
    CABasicAnimation *forward;
    CABasicAnimation *backward;
    
}

// Button to send email

- (IBAction)emailComposer:(id)sender;

// View components

@property (nonatomic, retain) IBOutlet UIImageView *scoregear;
@property (nonatomic, retain) IBOutlet UIImageView *vipergear;
@property (nonatomic, retain) IBOutlet UIImageView *contactgear;

@end

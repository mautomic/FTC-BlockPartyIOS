//
//  AppDelegate.h
//  FTC Scorer 13-14
//
//  Created by Maurya on 9/8/13.
//  Copyright (c) 2013 CompleteIP. All rights reserved.
//

#define myAppDelegate (AppDelegate *)[[UIApplication sharedApplication] delegate]
#import <UIKit/UIKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


// variables that are shared throughout the application
@property int redBlockScore;
@property int blueBlockScore;

@property int redAutoScore;
@property int blueAutoScore;

@property int redEndGameScore;
@property int blueEndGameScore;

@property int redBonusScore;
@property int blueBonusScore;

@property int blockCounterRed;
@property int blockCounterBlue;

@end

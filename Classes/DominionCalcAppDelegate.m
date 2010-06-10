//
//  DominionCalcAppDelegate.m
//  DominionCalc
//
//  Created by marutanm on 11/8/09.
//  Copyright shisobu.in 2009. All rights reserved.
//

#import "DominionCalcAppDelegate.h"
#import "DominionCalcViewController.h"

@implementation DominionCalcAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end

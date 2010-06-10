//
//  DominionCalcAppDelegate.h
//  DominionCalc
//
//  Created by marutanm on 11/8/09.
//  Copyright shisobu.in 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DominionCalcViewController;

@interface DominionCalcAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DominionCalcViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DominionCalcViewController *viewController;

@end


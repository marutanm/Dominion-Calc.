//
//  DisplayManager.h
//  DominionCalc
//
//  Created by marutanm on 11/13/09.
//  Copyright 2009 shisobu.in. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DisplayManager : NSObject {

	IBOutlet UILabel* estateNum;
	IBOutlet UILabel* duchyNum;
	IBOutlet UILabel* provinceNum;
	IBOutlet UILabel* gardensNum;
	IBOutlet UILabel* curseNum;
	IBOutlet UILabel* otherNum;
	
	IBOutlet UILabel* estateScore;
	IBOutlet UILabel* duchyScore;
	IBOutlet UILabel* provinceScore;
	IBOutlet UILabel* gardensScore;
	IBOutlet UILabel* curseScore;	

}

- (void)setNumber;

@end

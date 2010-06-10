//
//  DominionCalcViewController.h
//  DominionCalc
//
//  Created by marutanm on 11/8/09.
//  Copyright shisobu.in 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ScoreManager;

@interface DominionCalcViewController : UIViewController {
	
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
	IBOutlet UILabel* totalScore;
	
	IBOutlet UILabel* victoryCardsLabel;
	IBOutlet UILabel* treasureActionLabel;
	IBOutlet UILabel* totalScoreLabel;
	
	IBOutlet UILabel* estateLabel;
	IBOutlet UILabel* duchyLabel;
	IBOutlet UILabel* provinceLabel;
	IBOutlet UILabel* gardensLabel;
	IBOutlet UILabel* curseLabel;
	IBOutlet UILabel* otherLabel;
	
	IBOutlet UIButton* estateDecrementButton;
	IBOutlet UIButton* duchyDecrementButton;
	IBOutlet UIButton* provinceDecrementButton;
	IBOutlet UIButton* gardensDecrementButton;
	IBOutlet UIButton* curseDecrementButton;
	IBOutlet UIButton* otherDecrementButton;
	
	IBOutlet UIButton* estateIncrementButton;
	IBOutlet UIButton* duchyIncrementButton;
	IBOutlet UIButton* provinceIncrementButton;
	IBOutlet UIButton* gardensIncrementButton;
	IBOutlet UIButton* curseIncrementButton;
	IBOutlet UIButton* otherIncrementButton;
	
	ScoreManager* scoreManager;
}

- (IBAction)buttonPressed:(id)sender;
- (IBAction)resetPressed:(id)sender;
- (void)dispAll;
- (void)dispAllNumbers;
- (void)dispAllScores;

@end


//
//  DominionCalcViewController.m
//  DominionCalc
//
//  Created by marutanm on 11/8/09.
//  Copyright shisobu.in 2009. All rights reserved.
//

#import "DominionCalcViewController.h"
#import "ScoreManager.h"

@implementation DominionCalcViewController

#pragma mark IBAction
- (IBAction)buttonPressed:(id)sender{
	NSLog(@"buttonPressed: %d", [sender tag]);
	NSLog(@"%@", [sender titleForState:UIControlStateNormal]);
	NSString *buttonName;
	switch ([sender tag]) {
		case 1:			
			buttonName = @"estate";
			break;
		case 3:
			buttonName = @"duchy";
			break;
		case 6:
			buttonName = @"province";
			break;
		case 9:
			buttonName = @"gardens";
			break;
		case -1:
			buttonName = @"curse";
			break;
		case 10:
			buttonName = @"other";
			break;
		default:
			buttonName = @"reset";
			break;
	}

	if ([[sender titleForState:UIControlStateNormal] isEqualToString: @"+"]) {
		[scoreManager incrementNumber:buttonName];
	}else if ([[sender titleForState:UIControlStateNormal] isEqualToString:@"-"]) {
		[scoreManager decrementNumber:buttonName];
	}else {
	}
	[self dispAll];
	[buttonName release];
}

- (IBAction)resetPressed:(id)sender{
	[scoreManager resetScores];
	[self dispAll];
}

#pragma mark Displays
- (void)dispAll{
	[self dispAllNumbers];
	[self dispAllScores];
}

- (void)dispAllNumbers{
	NSLog(@"dispAllNumbers");
	NSArray *tempKey = [NSArray arrayWithObjects:@"estate", @"duchy", @"province", @"gardens", @"curse", @"other", nil];
	NSArray *tempNum = [NSArray arrayWithObjects:estateNum, duchyNum,  provinceNum, gardensNum, curseNum, otherNum, nil];
	NSDictionary *temp = [NSDictionary dictionaryWithObjects:tempNum forKeys:tempKey];
	for (UILabel *element in temp){
		[[temp objectForKey:element] setText:[scoreManager currentNumber:element]];
	}
//	[temp release];
//	[tempKey release];
//	[tempNum release];
}

- (void)dispAllScores{
	NSLog(@"dispAllScores");
	NSArray *tempKey = [NSArray arrayWithObjects:@"estate", @"duchy", @"province", @"gardens", @"curse", nil];
	NSArray *tempScore = [NSArray arrayWithObjects:estateScore, duchyScore,  provinceScore, gardensScore, curseScore, nil];
	NSDictionary *temp = [NSDictionary dictionaryWithObjects:tempScore forKeys:tempKey];
	for (UILabel *element in temp){
//		NSLog(@"%@", element);
		[[temp objectForKey:element] setText:[scoreManager currentScore:element]];
	}
	[totalScore setText:[scoreManager totalScore]];
//	[temp release];
//	[tempKey release];
//	[tempNum release];
}

#pragma mark -
- (void)viewDidLoad {
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	NSLog(@"%@", context);
	// Drawing lines with a white stroke color
	CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
	// Draw them with a 2.0 stroke width so they are a bit more visible.
	CGContextSetLineWidth(context, 2.0);
	
	// Draw a single line from left to right
	CGContextMoveToPoint(context, 10.0, 30.0);
	CGContextAddLineToPoint(context, 310.0, 400.0);
	CGContextStrokePath(context);

	
	
	NSLog(@"viewDidLoad");
	[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    [super viewDidLoad];
	scoreManager = [[ScoreManager alloc] init];
	[scoreManager initAllScores];
	[scoreManager resetScores];
	[self dispAll];
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[scoreManager dealloc];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

#pragma mark Rotations
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait ||
			interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
			interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration{
	if (interfaceOrientation == UIInterfaceOrientationPortrait) {
		NSLog(@"rotate to portrait");
		victoryCardsLabel.frame = CGRectMake(55, 50, 160, 30);
		treasureActionLabel.frame = CGRectMake(55, 210, 220, 30);
		totalScoreLabel.frame = CGRectMake(60, 370, 140, 30);

		gardensLabel.frame = CGRectMake(60, 240, 90, 30);
		otherLabel.frame = CGRectMake(60, 280, 90, 30);
		curseLabel.frame = CGRectMake(60, 320, 90, 30);
		
		estateNum.frame = CGRectMake(170, 80, 30, 30);
		duchyNum.frame = CGRectMake(170, 120, 30, 30);
		provinceNum.frame = CGRectMake(170, 160, 30, 30);
		gardensNum.frame = CGRectMake(170, 240, 30, 30);
		curseNum.frame = CGRectMake(170, 280, 30, 30);
		otherNum.frame = CGRectMake(170, 320, 30, 30);

		estateScore.frame = CGRectMake(220, 80, 40, 30);
		duchyScore.frame = CGRectMake(220, 120, 40, 30);
		provinceScore.frame = CGRectMake(220, 160, 40, 30);
		gardensScore.frame = CGRectMake(220, 240, 40, 30);
		curseScore.frame = CGRectMake(220, 280, 40, 30);
		totalScore.frame = CGRectMake(200, 360, 60, 40);
		
		estateDecrementButton.frame = CGRectMake(20, 80, 30, 30);
		duchyDecrementButton.frame = CGRectMake(20, 120, 30, 30);
		provinceDecrementButton.frame = CGRectMake(20, 160, 30, 30);
		gardensDecrementButton.frame = CGRectMake(20, 240, 30, 30);
		curseDecrementButton.frame = CGRectMake(20, 280, 30, 30);
		otherDecrementButton.frame = CGRectMake(20, 320, 30, 30);
		
		estateIncrementButton.frame = CGRectMake(270, 80, 30, 30);
		duchyIncrementButton.frame = CGRectMake(270, 120, 30, 30);
		provinceIncrementButton.frame = CGRectMake(270, 160, 30, 30);
		gardensIncrementButton.frame = CGRectMake(270, 240, 30, 30);
		curseIncrementButton.frame = CGRectMake(270, 280, 30, 30);
		otherIncrementButton.frame = CGRectMake(270, 320, 30, 30);

	}else if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		NSLog(@"rotate to landscape");
		victoryCardsLabel.frame = CGRectMake(40, 50, 160, 30);
		treasureActionLabel.frame = CGRectMake(250, 50, 220, 30);
		totalScoreLabel.frame = CGRectMake(260, 215, 140, 30);

		gardensLabel.frame = CGRectMake(300, 80, 90, 30);
		otherLabel.frame = CGRectMake(300, 120, 90, 30);
		curseLabel.frame = CGRectMake(300, 160, 90, 30);
		
		estateNum.frame = CGRectMake(150, 80, 30, 30);
		duchyNum.frame = CGRectMake(150, 120, 30, 30);
		provinceNum.frame = CGRectMake(150, 160, 30, 30);
		gardensNum.frame = CGRectMake(390, 80, 30, 30);
		curseNum.frame = CGRectMake(390, 160, 30, 30);
		otherNum.frame = CGRectMake(390, 120, 30, 30);
		
		estateScore.frame = CGRectMake(220, 80, 0, 30);
		duchyScore.frame = CGRectMake(220, 120, 0, 30);
		provinceScore.frame = CGRectMake(220, 160, 0, 30);
		gardensScore.frame = CGRectMake(220, 240, 0, 30);
		curseScore.frame = CGRectMake(220, 280, 0, 30);
		totalScore.frame = CGRectMake(400, 210, 60, 40);

		estateDecrementButton.frame = CGRectMake(20, 80, 30, 30);
		duchyDecrementButton.frame = CGRectMake(20, 120, 30, 30);
		provinceDecrementButton.frame = CGRectMake(20, 160, 30, 30);
		gardensDecrementButton.frame = CGRectMake(260, 80, 30, 30);
		otherDecrementButton.frame = CGRectMake(260, 120, 30, 30);
		curseDecrementButton.frame = CGRectMake(260, 160, 30, 30);
		
		estateIncrementButton.frame = CGRectMake(190, 80, 30, 30);
		duchyIncrementButton.frame = CGRectMake(190, 120, 30, 30);
		provinceIncrementButton.frame = CGRectMake(190, 160, 30, 30);
		gardensIncrementButton.frame = CGRectMake(430, 80, 30, 30);
		otherIncrementButton.frame = CGRectMake(430, 120, 30, 30);
		curseIncrementButton.frame = CGRectMake(430, 160, 30, 30);
	
	}else {
		NSLog(@"rotate to landscape upside down");
	}
}

@end

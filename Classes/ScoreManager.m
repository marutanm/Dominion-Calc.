//
//  ScoreManager.m
//  DominionCalc
//
//  Created by marutanm on 11/12/09.
//  Copyright 2009 shisobu.in. All rights reserved.
//

#import "ScoreManager.h"

@implementation ScoreManager
@synthesize keys;

- (NSInteger)incrementNumber:(NSString*)cardKind{
	NSLog(@"incrementNumber: %@", cardKind);
	NSLog(@"currentNum: %@", [currentNums objectForKey:cardKind]);

	NSInteger addedNum = [[currentNums objectForKey:cardKind] intValue] + 1;
	[currentNums setObject:[NSString stringWithFormat:@"%d", addedNum] forKey:cardKind];
	[currentNums setObject:[NSString stringWithFormat:@"%d", [[currentNums objectForKey:@"total"] intValue] + 1] forKey:@"total"];
	NSLog(@"addedNum: %@", [currentNums objectForKey:cardKind]);
	
	[self calcScore:cardKind];
	[self calcScore:@"gardens"];
	return(addedNum);
}

- (NSInteger)decrementNumber:(NSString *)cardKind{
	NSLog(@"decrementNumber: %@", cardKind);
	if ([[currentNums objectForKey:cardKind] intValue] != 0) {
		[currentNums setObject:[NSString stringWithFormat:@"%d", [[currentNums objectForKey:cardKind] intValue] - 1] forKey:cardKind];
	}
	if ([[currentNums objectForKey:@"total"] intValue] != 0) {
		[currentNums setObject:[NSString stringWithFormat:@"%d", [[currentNums objectForKey:@"total"] intValue] - 1] forKey:@"total"];
	}
	[self calcScore:cardKind];
	[self calcScore:@"gardens"];
	return(10);
}

- (NSInteger)calcScore:(NSString*)cardKind{
	NSLog(@"calcScore:%@", cardKind);
//	scores = [[NSMutableDictionary alloc]init];
	if ([cardKind isEqualToString:@"gardens"] || [cardKind isEqualToString:@"other"]) {
		[scores setObject:[NSString stringWithFormat:@"%d", [[currentNums objectForKey:@"total"] intValue] / 10 * [[currentNums objectForKey:@"gardens"] intValue]] forKey:@"gardens"];
	}else{
		[scores setObject:[NSString stringWithFormat:@"%d", [[currentNums objectForKey:cardKind] intValue] * [[rates objectForKey:cardKind] intValue]] forKey:cardKind];
	}

	NSLog(@"scores: %@", [scores objectForKey:cardKind]);
	NSInteger tempTotalScore = 0;
	for(NSString *element in keys){
//		NSLog(@"add %@ score", element);
		if (![element isEqualToString:@"total"]) {
			tempTotalScore += [[scores objectForKey:element]intValue];
		}
	}
	[scores setObject:[NSString stringWithFormat:@"%d", tempTotalScore] forKey:@"total"];
	return(10);
}

- (void)resetScores{
	NSLog(@"resetScores");
	for (NSString *key in keys){
		NSLog(@"%@", key);
		if ([key isEqualToString:@"estate"]) {
			[currentNums setObject:@"3" forKey:key];
		}else if ([key isEqualToString:@"other"]) {
			[currentNums setObject:@"7" forKey:key];
		}else if ([key isEqualToString:@"total"]) {
			[currentNums setObject:@"10" forKey:key];
		}else {
			[currentNums setObject:@"0" forKey:key];
		}
		[self calcScore:key];
	}
	//	[currentNums setObject:@"3" forKey:@"estate"];
	//	[currentNums setObject:@"7" forKey:@"other"];
	[self logAll];
}

- (void)logAll{
	NSLog(@"\ncurrentNums: %@", [currentNums description]);
	NSLog(@"\nscores: %@", [scores description]);
	NSLog(@"\nrates: %@", [rates description]);
}

#pragma mark ACCESSERS
- (NSString *)currentNumber:(NSString *)cardKind{
	return [currentNums objectForKey:cardKind];
}

- (NSString *)currentScore:(NSString *)cardKind{
	return [scores objectForKey:cardKind];
//	return @"10";
}

- (NSString *)totalScore{
//	[scores setObject:@"10" forKey:@"total"];
	return [scores objectForKey:@"total"];
}

//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}

#pragma mark INITIALIZER
- (id)init{
	NSLog(@"init");
	keys = [NSArray arrayWithObjects:@"estate", @"duchy", @"province", @"gardens", @"curse", @"other", @"total", nil];
	[keys retain];
	self = [super init];
	return self;
}

- (void)initAllScores{
	NSLog(@"initAllScores");
	NSArray* currentNumObjects;
	NSArray* scoreObjects;
	NSArray* ratesObjects;
	currentNumObjects = [NSArray arrayWithObjects:@"0", @"0", @"0", @"0", @"0", @"0", @"0", nil];
	scoreObjects = [NSArray arrayWithObjects:@"0", @"0", @"0", @"0", @"0", @"0", @"0", nil];
	ratesObjects = [NSArray arrayWithObjects:@"1", @"3", @"6", @"0", @"-1", @"0", @"0", nil];
	currentNums = [NSMutableDictionary dictionaryWithObjects:currentNumObjects forKeys:keys];
	[currentNums retain];
	scores = [NSMutableDictionary dictionaryWithObjects:scoreObjects forKeys:keys];
	[scores retain];
	rates = [NSDictionary dictionaryWithObjects:ratesObjects forKeys:keys];
	[rates retain];
	
	[self logAll];
	
	//	for (NSString *element in keys) {
	//		NSLog(@"%@", element);
	//	}
	
	//	NSString* hoge = [currentNums objectForKey:@"estate"];
	//	NSLog(@"%@", hoge);
	//	NSLog(@"count = %d", [currentNums count]);
	//	NSLog(@"**********************");
}

- (void)dealloc {
    [super dealloc];
	[currentNums dealloc];
	[scores dealloc];
	[rates dealloc];
	[keys dealloc];
}


@end

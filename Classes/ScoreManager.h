//
//  ScoreManager.h
//  DominionCalc
//
//  Created by marutanm on 11/12/09.
//  Copyright 2009 shisobu.in. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ScoreManager : NSObject {

	NSMutableDictionary *currentNums;
	NSMutableDictionary *scores;
	NSDictionary *rates;

	NSArray* keys;

}
@property(readonly, retain)NSArray* keys;

- (id)init;
- (void)initAllScores;
- (void)resetScores;
- (void)logAll;
- (NSInteger)incrementNumber:(NSString *)cardKind;
- (NSInteger)decrementNumber:(NSString *)cardKind;
- (NSInteger)calcScore:(NSString*)cardKind;
- (NSString *)currentNumber:(NSString *)cardKind;
- (NSString *)currentScore:(NSString *)cardKind;
- (NSString *)totalScore;
@end

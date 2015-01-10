//
//  NSDate+Additions.h
//
//  Created by Applico Inc. on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Additions)


- (NSDate *)previousDay;
- (NSDate *)previousDayWithoutTime;
- (NSDate *)dateWithoutTime;
- (NSString *)shortStyleTimeString;
- (NSString *)shortStyleString;
- (NSString *)longStyleString;
- (NSDate *)dateWithUTCTimeZone;
- (NSString *)daysAndHoursSinceDate:(NSDate *)date;
@end

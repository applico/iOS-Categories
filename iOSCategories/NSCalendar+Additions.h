//
//  NSCalendar+Additions.h
//
//  Created by Applico Inc on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (Additions)

-(NSInteger)daysWithinEraFromDate:(NSDate *) startDate toDate:(NSDate *) endDate;
-(NSInteger)hoursWithinEraFromDate:(NSDate *) startDate toDate:(NSDate *) endDate;
@end

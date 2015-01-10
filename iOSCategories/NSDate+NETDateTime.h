//
//  NSDate+NETDateTime.h
//
//  Created by Applico Inc. on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (NETDateTime)

@property (nonatomic, strong, readonly) NSString *json;
@property (nonatomic, strong, readonly) NSString *netjson;

/*
 
 Dates/Times are encoded as a string with the following format:
 "/Date(1305777459977-0400)/" where the first set of integers represents milliseconds since the reference date of the first instant of 1 January 1970, GMT. The second set of integers represents the applicable time-zone.
 
 */

+ (NSDate *)dateWithJson:(NSString *)json;
+ (NSDate *)dateWithNETJson:(NSString *)json;

@end

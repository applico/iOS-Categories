//
//  NSDate+NETDateTime.m
//
//  Created by Applico Inc. on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import "NSDate+NETDateTime.h"

@implementation NSDate (NETDateTime)

+ (NSDate *)dateWithJson:(NSString *)json
{
    return [NSDate dateWithNETJson:json];
}

+ (NSDate *)dateWithNETJson:(NSString *)json
{
    
    if(!json)
        return nil;
    
    static NSRegularExpression *dateRegEx = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateRegEx = [[NSRegularExpression alloc]
                     initWithPattern:@"^\\/date\\((-?\\d++)(?:([+-])(\\d{2})(\\d{2}))?\\)\\/$"
                     options:NSRegularExpressionCaseInsensitive
                     error:nil];
    });
    
    NSTextCheckingResult *regexResult = [dateRegEx firstMatchInString:json options:0 range:NSMakeRange(0, [json length])];
    
    if (regexResult) {
        // milliseconds
        NSTimeInterval seconds = [[json substringWithRange:[regexResult rangeAtIndex:1]] doubleValue] / 1000.0;
        // timezone offset
        if ([regexResult rangeAtIndex:2].location != NSNotFound) {
            NSString *sign = [json substringWithRange:[regexResult rangeAtIndex:2]];
            // hours
            seconds += [[NSString stringWithFormat:@"%@%@", sign,
                         [json substringWithRange:[regexResult rangeAtIndex:3]]] doubleValue] * 60.0 * 60.0;
            // minutes
            seconds += [[NSString stringWithFormat:@"%@%@", sign,
                         [json substringWithRange:[regexResult rangeAtIndex:4]]] doubleValue] * 60.0;
        }
        
        return [NSDate dateWithTimeIntervalSince1970:seconds];
    }
    
    return nil;
}

- (NSDate *)date {
    return [NSDate date];
}

- (NSString *)json
{
    return self.netjson;
}

- (NSString *)netjson
{
    double timeSince1970=[self timeIntervalSince1970];
    double nowMillis = 1000.0 * (timeSince1970);
    NSString *dotNetDate=[NSString stringWithFormat:@"/Date(%.0f%+03d00)/",nowMillis,0] ;
    return  dotNetDate;
}



@end

//
//  NSString+Additions.h
//
//  Created by Applico Inc. on 10/2/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

+ (NSString *)randomStringOfLength:(int)length {
    NSString *characterSet = @"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *randomString = [[NSMutableString alloc] initWithCapacity:length];
    
    for (int i = 0; i<length; i++) {
        [randomString appendString:[characterSet substringWithRange:NSMakeRange(arc4random_uniform((uint32_t)[characterSet length]), 1)]];
    }
    
    
    return randomString;
}

+ (NSString*)GUIDString {
    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
    NSString *guid = (__bridge NSString *)newUniqueIDString;
    CFRelease(newUniqueIDString);
    CFRelease(newUniqueID);
    return([guid lowercaseString]);
}

@end

//
//  UIColor+HexColor.m
//
//  Created by Applico Inc. on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)

+ (UIColor *)UIColorFromRGB:(int)rgbValue
{

    return [UIColor colorWithRed:((float)((rgbValue >> 24) & 0xFF))/255.0 green:((float)((rgbValue >> 16) & 0xFF))/255.0 blue:((float)((rgbValue >> 8) & 0xFF))/255.0 alpha:((float)((rgbValue >> 0) & 0xFF))/255.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    return [[self class] colorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    // Check for hash and add the missing hash
    if('#' != [hexString characterAtIndex:0])
    {
        hexString = [NSString stringWithFormat:@"#%@", hexString];
    }

    // check for string length
    assert(7 == hexString.length || 4 == hexString.length);

    // check for 3 character HexStrings
    hexString = [[self class] hexStringShortenString:hexString];

    NSString *redHex    = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(1, 2)]];
    unsigned redInt = [[self class] hexValueToInt:redHex];

    NSString *greenHex  = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(3, 2)]];
    unsigned greenInt = [[self class] hexValueToInt:greenHex];

    NSString *blueHex   = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(5, 2)]];
    unsigned blueInt = [[self class] hexValueToInt:blueHex];

    UIColor *color = [UIColor colorWith8BitRed:redInt green:greenInt blue:blueInt alpha:alpha];

    return color;
}

+ (UIColor *)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue
{
    return [[self class] colorWith8BitRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha
{
    UIColor *color = nil;

    color = [UIColor colorWithRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:alpha];

    return color;
}

+ (NSString *)hexStringShortenString:(NSString *)hexString
{
    if(hexString.length == 4)
    {
        hexString = [NSString stringWithFormat:@"#%@%@%@%@%@%@",
                     [hexString substringWithRange:NSMakeRange(1, 1)],[hexString substringWithRange:NSMakeRange(1, 1)],
                     [hexString substringWithRange:NSMakeRange(2, 1)],[hexString substringWithRange:NSMakeRange(2, 1)],
                     [hexString substringWithRange:NSMakeRange(3, 1)],[hexString substringWithRange:NSMakeRange(3, 1)]];
    }
    
    return hexString;
}

+ (unsigned)hexValueToInt:(NSString *)hexValue
{
    unsigned value = 0;
    
    NSScanner *hexValueScanner = [NSScanner scannerWithString:hexValue];
    [hexValueScanner scanHexInt:&value];
    
    return value;
}

@end


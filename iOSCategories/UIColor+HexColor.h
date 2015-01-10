//
//  UIColor+HexColor.h
//
//  Created by Applico Inc. on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Additions)

+ (UIColor *)UIColorFromRGB:(int)rgbValue;
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
+ (UIColor *)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;
+ (NSString *)hexStringShortenString:(NSString *)hexString;
+ (unsigned)hexValueToInt:(NSString *)hexValue;

@end
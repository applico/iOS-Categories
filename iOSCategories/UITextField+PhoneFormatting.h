//
//  UITextField+PhoneFormatting.h
//
//  Created by Applico Inc. on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (PhoneFormatting)

-(BOOL)formatForPhoneWithEditingRange:(NSRange)range replacementString:(NSString *)string;

@end

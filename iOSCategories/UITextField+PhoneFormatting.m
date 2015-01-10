//
//  UITextField+PhoneFormatting.m
//
//  Created by Applico Inc. on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import "UITextField+PhoneFormatting.h"
#import <Foundation/Foundation.h>

@implementation UITextField (PhoneFormatting)


-(BOOL)formatForPhoneWithEditingRange:(NSRange)range replacementString:(NSString *)string 
{
  NSMutableString *temp = [NSMutableString stringWithString:self.text];
  [temp replaceCharactersInRange:range withString:string];
  
  NSString *digitsOnly = [[[[temp stringByReplacingOccurrencesOfString:@"-" withString:@""]
                          stringByReplacingOccurrencesOfString:@"(" withString:@""]
                          stringByReplacingOccurrencesOfString:@")" withString:@""]
                          stringByReplacingOccurrencesOfString:@" " withString:@""];
  NSString *newText = nil;
  NSInteger startPos = range.location;
  if (string.length > 0) {
    startPos++;
  }
  if (self.text.length == 3 && temp.length == 4 && startPos > 2) {
    startPos++;
  } else if (self.text.length == 8 && temp.length == 9 && startPos > 7) {
    startPos++;
  }
  
  if([digitsOnly length] > 10) {
    return NO;
  } else if ([digitsOnly length] > 7) {
    newText = [NSString stringWithFormat:@"%@-%@-%@",
               [digitsOnly substringWithRange:NSMakeRange(0, 3)],
               [digitsOnly substringWithRange:NSMakeRange(3,3)],
               [digitsOnly substringWithRange:NSMakeRange(6, digitsOnly.length-6)]];
  } else if ([digitsOnly length] > 3) {
    newText = [NSString stringWithFormat:@"%@-%@",
               [digitsOnly substringWithRange:NSMakeRange(0, 3)],
               [digitsOnly substringWithRange:NSMakeRange(3,digitsOnly.length-3)]];
  } else {
    newText = digitsOnly;
  }
  self.text = newText;
  if (startPos > newText.length ) {
    startPos = newText.length;
  }
  UITextPosition *beginning = self.beginningOfDocument;
  UITextPosition *start = [self positionFromPosition:beginning offset:startPos];
  UITextPosition *end = [self positionFromPosition:start offset:0];
  UITextRange *textRange = [self textRangeFromPosition:start toPosition:end];
  self.selectedTextRange = textRange;
  return NO;
}

@end


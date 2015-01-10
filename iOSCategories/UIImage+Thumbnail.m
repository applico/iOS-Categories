//
//  UIImage+Thumbnail.m
//
//  Created by Applico Inc. on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import "UIImage+Thumbnail.h"
#import <UIKit/UIKit.h>

@implementation UIImage (Thumbnail)

- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize {
  
  UIImage *sourceImage = self;
  UIImage *newImage = nil;
  
  CGSize imageSize = sourceImage.size;
  CGFloat width = imageSize.width;
  CGFloat height = imageSize.height;
  
  CGFloat targetWidth = targetSize.width;
  CGFloat targetHeight = targetSize.height;
  
  CGFloat scaleFactor = 0.0;
  CGFloat scaledWidth = targetWidth;
  CGFloat scaledHeight = targetHeight;
  
  CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
  
  if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
    
    CGFloat widthFactor = targetWidth / width;
    CGFloat heightFactor = targetHeight / height;
    
    if (widthFactor > heightFactor) 
      scaleFactor = widthFactor;
    else
      scaleFactor = heightFactor;
    
    scaledWidth  = width * scaleFactor;
    scaledHeight = height * scaleFactor;
    
    // center the image
    thumbnailPoint.x = (targetWidth - scaledWidth);
  }
  
  
  // this is actually the interesting part:
  
  UIGraphicsBeginImageContext(targetSize);
  
  CGRect thumbnailRect = CGRectZero;
  thumbnailRect.size.width  = scaledWidth;
  thumbnailRect.size.height = scaledHeight;
  
  [sourceImage drawInRect:thumbnailRect];
  
  newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return newImage ;
}

@end;
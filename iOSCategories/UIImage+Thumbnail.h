//
//  UIImage+Thumbnail.h
//
//  Created by Applico Inc. on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (Thumbnail)
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
@end;
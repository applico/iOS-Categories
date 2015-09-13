//
//  UIImage+Additions.swift
//  iOSCategories
//
//  Created by Applico on 6/2/15.
//  Copyright (c) 2015 Applico Inc. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {

 func imageByScalingProportionallToSize(targetSize: CGSize) -> UIImage {
    
    var sourceImage = self
    
    var newImage = UIImage()
    
    var scaleFactor:CGFloat = 0
    
    var scaledWidth = sourceImage.size.width
    
    var scaledHeight = sourceImage.size.height
    
    var thumbnailOrigin = CGPointZero
    
    if CGSizeEqualToSize(sourceImage.size, targetSize) == false {
        
        if targetSize.width/sourceImage.size.width > targetSize.height/sourceImage.size.height {
            
            scaleFactor = targetSize.width/sourceImage.size.width
        }
        
        else {
            
            scaleFactor = targetSize.height/sourceImage.size.height
        }
        
        scaledWidth = sourceImage.size.width * scaleFactor
        scaledHeight = sourceImage.size.height * scaleFactor
        
        thumbnailOrigin.x = targetSize.width - scaledWidth
        
    }
    
    //draw thumbnail
    
    UIGraphicsBeginImageContext(targetSize)
    
    var thumbnailRect = CGRectZero
    
    thumbnailRect.origin = thumbnailOrigin
    thumbnailRect.size.width = scaledWidth
    thumbnailRect.size.height = scaledHeight
    sourceImage.drawInRect(thumbnailRect)
    
    newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage
    
}
    
    func imageByApplyingAlpha(alpha:CGFloat) -> UIImage{
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        var ctx = UIGraphicsGetCurrentContext()
        var area = CGRectMake(0, 0, size.width, size.height)
        
        CGContextScaleCTM(ctx, 1, -1)
        CGContextTranslateCTM(ctx, 0, -size.height)
        
        CGContextSetBlendMode(ctx, kCGBlendModeMultiply)
        CGContextSetAlpha(ctx, alpha)
        
        CGContextDrawImage(ctx, area, CGImage)
        
        var newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage
        
    }

}

    


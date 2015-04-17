//
//  UIImage+ColorChange.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 16/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    
    func imageWithColor(color : UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.mainScreen().scale)
        let context : CGContextRef = UIGraphicsGetCurrentContext()
        CGContextSetShouldAntialias(context, true)
        CGContextSetInterpolationQuality(context, kCGInterpolationHigh)
        color.setFill()
        
        CGContextTranslateCTM(context, 0, self.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        CGContextSetBlendMode(context, kCGBlendModeCopy)
        let rect : CGRect = CGRectMake(0,0,self.size.width,self.size.height)
        CGContextDrawImage(context, rect, self.CGImage)
        
        CGContextClipToMask(context, rect, self.CGImage)
        CGContextAddRect(context, rect)
        CGContextDrawPath(context, kCGPathFill)
        let coloredImg : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return coloredImg
    }
    
}
//
//  NGCoursesCell.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 25/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGCoursesCell: UICollectionViewCell {

    @IBOutlet weak var imgGlass: UIImageView!
    @IBOutlet weak var btnIOS: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func animate(){
        self.imgGlass.alpha = 0.0
        self.btnIOS.alpha = 0.0
        self.imgGlass.transform = CGAffineTransformMakeScale(0.5, 0.5)
        self.btnIOS.transform = CGAffineTransformMakeScale(0.5, 0.5)
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.btnIOS.alpha = 1.0
            self.btnIOS.transform = CGAffineTransformMakeScale(1.0, 1.0)
        }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.50, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.imgGlass.alpha = 1.0
            self.imgGlass.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion: nil)
        
    }

}

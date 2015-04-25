//
//  NGWWDCAwardCell.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 22/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGWWDCAwardCell: UICollectionViewCell {

    @IBOutlet weak var lblWWDC: UILabel!
    @IBOutlet weak var lblDesc1: UILabel!
    @IBOutlet weak var lblDesc2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    func animate(){
        lblWWDC.alpha = 0.0
        lblWWDC.transform = CGAffineTransformMakeScale(0.50, 0.50)
        UIView.animateWithDuration(1.0, delay: 1.0, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.lblWWDC.alpha = 1.0
            self.lblWWDC.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion:nil)
        
        lblDesc1.alpha = 0.0
        UIView.animateWithDuration(1.0, delay: 1.75, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.lblDesc1.alpha = 1.0
            self.lblDesc1.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion:nil)
        
        lblDesc2.alpha = 0.0
        UIView.animateWithDuration(1.0, delay: 2.75, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.lblDesc2.alpha = 1.0
            self.lblDesc2.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion:nil)
    }

}

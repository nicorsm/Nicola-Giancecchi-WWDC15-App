//
//  NGStudyCell.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 14/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGStudyCell: UICollectionViewCell {
    
    /*
    
    var school : String = ""
    var institution : String = ""
    var course : String = ""
    var type : String = ""
    var vote : String = ""
    var projects : Array<String> = []
    */
    
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    
    @IBOutlet weak private var lblSchool: UILabel!
    @IBOutlet weak private var lblInstitution: UILabel!
    @IBOutlet weak private var lblCourse: UILabel!
    @IBOutlet weak private var lblType: UILabel!
    @IBOutlet weak private var lblVote: UILabel!
    
    override func awakeFromNib() {
        
        for v in self.contentView.subviews as! [UIView] {
            if let img = v as? UIImageView {
                img.layer.cornerRadius = img.frame.size.width/2
                img.layer.masksToBounds = true
            }
        }
    }
    
    func populateSchool(school : School){
        self.lblSchool.text = school.school
        self.lblInstitution.text = school.institution
        self.lblCourse.text = school.course
        self.lblType.text = school.type
        self.lblVote.text = school.vote
        self.imgView1.image = UIImage(named: school.img1)
        self.imgView2.image = UIImage(named: school.img2)
        self.imgView3.image = UIImage(named: school.img3)
        
    }
    
    func animate(){
        self.alpha = 0.0
        self.imgView1.alpha = 0.0
        self.imgView2.alpha = 0.0
        self.imgView3.alpha = 0.0
        UIView.animateWithDuration(0.50, delay: 0.00, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.alpha = 1.0
            }, completion: { (Bool) -> Void in
                
                UIView.animateWithDuration(0.50, delay: 0.00, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
                    self.imgView1.alpha = 1.0
                    }, completion: { (Bool) -> Void in
                        
                        UIView.animateWithDuration(0.50, delay: 0.00, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
                            self.imgView3.alpha = 1.0
                            }, completion: { (Bool) -> Void in
                                UIView.animateWithDuration(0.50, delay: 0.00, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
                                    self.imgView2.alpha = 1.0
                                    }, completion: { (Bool) -> Void in
                                        
                                })
                        })
                })
        })
    }
    
    
}

//
//  NGWorkCell.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 17/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit


protocol WebBrowserDelegate{
    func openURL(url:String)
}

protocol ProjectsDelegate{
    func openProjects(ownershipGroup:String)
}

class NGWorkCell: UICollectionViewCell {

    @IBOutlet private weak var imgCompany: UIImageView!
    
    @IBOutlet private weak var imgBackground: UIImageView!
    
    @IBOutlet private weak var lblWhy: UILabel!
    @IBOutlet private weak var lblBrief: UILabel!
    @IBOutlet private weak var lblLocation: UILabel!
    @IBOutlet private weak var lblPosition: UILabel!
    @IBOutlet private weak var lblTime: UILabel!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var btnProjects: UIButton!
    @IBOutlet private weak var btnWebsite: UIButton!
    var delegate : WebBrowserDelegate! = nil
    var projects_delegate : ProjectsDelegate! = nil
    var myWork : Work! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgCompany.layer.cornerRadius = imgCompany.frame.size.width/2
        imgCompany.layer.masksToBounds = true
        btnProjects.layer.cornerRadius = 5.0
        btnProjects.layer.masksToBounds = true
        btnProjects.layer.borderColor = UIColor.whiteColor().CGColor
        btnProjects.layer.borderWidth = 1.0
        btnWebsite.layer.cornerRadius = 5.0
        btnWebsite.layer.masksToBounds = true
        btnWebsite.layer.borderColor = UIColor.whiteColor().CGColor
        btnWebsite.layer.borderWidth = 1.0
        // Initialization code
    }
    
    func populate(work : Work){
        imgBackground.image = UIImage(named:work.img)
        imgCompany.image = UIImage(named:work.logo)
        lblTitle.text = work.title
        lblTime.text = work.time
        lblPosition.text = work.position
        lblLocation.text = work.location
        lblWhy.text = work.why
        lblBrief.text = work.brief
        
        btnProjects.hidden = (work.ownershipGroup == "")
        
        myWork = work
    }
    
    
    func animate(){
        self.imgBackground.alpha = 0.0
        self.imgCompany.alpha = 0.5
        self.imgCompany.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
        UIView.animateWithDuration(1.25, delay: 0.50, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.imgCompany.alpha = 1.0
            self.imgBackground.alpha = 1.0
            self.imgCompany.transform = CGAffineTransformMakeScale(1.0, 1.0)
            
            }, completion:nil)
    }

    @IBAction func didOpenProjects(sender: AnyObject) {
        if self.projects_delegate != nil {
            self.projects_delegate.openProjects(myWork.ownershipGroup)
        }
    }
    
    @IBAction func didOpenWebsite(sender: AnyObject) {
        if self.delegate != nil {
            self.delegate.openURL(myWork.website)
        }
    }
}

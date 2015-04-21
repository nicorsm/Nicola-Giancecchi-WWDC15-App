//
//  NGStudyCell.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 14/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGStudyCell: UICollectionViewCell {
    
    @IBOutlet private weak var lblSchool: UILabel!
    @IBOutlet private weak var lblInstitution: UILabel!
    @IBOutlet private weak var lblCourse: UILabel!
    @IBOutlet private weak var btnWebsite: UIButton!
    @IBOutlet private weak var btnProjects: UIButton!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblVote: UILabel!
    @IBOutlet private weak var lblText: UILabel!
    @IBOutlet private weak var imgLogo: UIImageView!
    @IBOutlet private weak var imgBackground: UIImageView!
    private var mySchool : School!
    var delegate : WebBrowserDelegate! = nil
    var projects_delegate : ProjectsDelegate! = nil
    
    
    
    override func awakeFromNib() {
        
        imgLogo.layer.cornerRadius = imgLogo.frame.size.width/2
        imgLogo.layer.masksToBounds = true
        
        btnWebsite.layer.cornerRadius = 5.0
        btnWebsite.layer.masksToBounds = true
        btnWebsite.layer.borderColor = UIColor.whiteColor().CGColor
        btnWebsite.layer.borderWidth = 1.0
        
        btnProjects.layer.cornerRadius = 5.0
        btnProjects.layer.masksToBounds = true
        btnProjects.layer.borderColor = UIColor.whiteColor().CGColor
        btnProjects.layer.borderWidth = 1.0
    }
    
    func populateSchool(school : School){
        self.lblSchool.text = school.school
        self.lblInstitution.text = school.institution
        self.lblCourse.text = school.course
        self.lblTitle.text = school.title
        self.lblVote.text = school.vote
        self.lblText.text = school.text
        self.imgLogo.image = UIImage(named: school.logo)
        self.imgBackground.image = UIImage(named: school.background)
        
        btnProjects.hidden = (school.ownershipGroup == "")
        
        mySchool = school
    }
    
    
    @IBAction func didOpenWebsite(sender: AnyObject) {
        if (self.delegate != nil){
            self.delegate.openURL(mySchool.website)
        }
    }
    
    
    @IBAction func didOpenProjects(sender: AnyObject) {
        if self.projects_delegate != nil {
            self.projects_delegate.openProjects(mySchool.ownershipGroup)
        }
    }


}

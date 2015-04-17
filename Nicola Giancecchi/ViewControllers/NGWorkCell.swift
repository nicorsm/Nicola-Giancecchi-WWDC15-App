//
//  NGWorkCell.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 17/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

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
    }

}

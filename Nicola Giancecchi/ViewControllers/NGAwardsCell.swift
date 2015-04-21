//
//  NGAwardsCell.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 17/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGAwardsCell: UICollectionViewCell {

    
    @IBOutlet private weak var imgBackground: UIImageView!
    
    @IBOutlet private weak var imgLogo: UIImageView!
    @IBOutlet private weak var lblTitle: UILabel!
    
    @IBOutlet private weak var lblSubtitle1: UILabel!
    @IBOutlet private weak var lblSubtitle2: UILabel!
    
    @IBOutlet private weak var textArea1: UILabel!
    @IBOutlet private weak var textArea2: UILabel!
    
    @IBOutlet weak var btnTalkingAbout: UIButton!
    var delegate : WebBrowserDelegate! = nil
    
    private var myAward : Award! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgLogo.layer.cornerRadius = imgLogo.frame.size.width/2
        imgLogo.layer.masksToBounds = true
        btnTalkingAbout.layer.cornerRadius = 5.0
        btnTalkingAbout.layer.masksToBounds = true
        btnTalkingAbout.layer.borderColor = UIColor.whiteColor().CGColor
        btnTalkingAbout.layer.borderWidth = 1.0
    
    }
    
    func populate(award : Award){
        imgLogo.image = UIImage(named:award.logo)
        imgBackground.image = UIImage(named:award.background)
        lblTitle.text = award.title
        lblSubtitle1.text = award.subtitle1
        lblSubtitle2.text = award.subtitle2
        textArea1.text = award.text1
        textArea2.text = award.text2
        
        myAward = award
    }

    @IBAction func didOpenTalkingAbout(sender: AnyObject) {
        if self.delegate != nil {
            self.delegate.openURL(myAward.link)
        }
    }
}


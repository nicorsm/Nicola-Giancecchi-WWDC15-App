//
//  NGProjectCell.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 15/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGProjectCell: UICollectionViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblAppName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgIcon.layer.cornerRadius = 15
        self.imgIcon.layer.masksToBounds = true
    }
    
    func populate(project : Project){
        self.imgIcon.image = UIImage(named:project.appIcon)
        self.lblAppName.text = project.title
    }

}

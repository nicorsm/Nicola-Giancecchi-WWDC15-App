//
//  NGSkillsHobbiesViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 20/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGSkillsHobbiesViewController: UIViewController {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var humanView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets=false
        // Do any additional setup after loading the view.
        
        let color : UIColor = UIColor().hexStringToUIColor("#ffad19")
        
        for v : UIView in self.contentView.subviews as! [UIView] {
            if v.isKindOfClass(UIImageView) && v.tag == 1010 {
                let img : UIImageView = v as! UIImageView
                img.image = img.image?.imageWithColor(color)
                img.layer.cornerRadius = v.frame.size.width/2
                img.layer.masksToBounds = true
                img.layer.borderColor = color.CGColor
                img.layer.borderWidth = 2.0
                
            }
        }
        
        
        for v : UIView in self.humanView.subviews as! [UIView] {
            for vw : UIView in v.subviews as! [UIView] {
                if(vw.isKindOfClass(UIImageView)){
                    let img : UIImageView = vw as! UIImageView
                    img.image = img.image?.imageWithColor(color)
                    img.layer.cornerRadius = vw.frame.size.width/2
                    img.layer.masksToBounds = true
                    img.layer.borderColor = color.CGColor
                    img.layer.borderWidth = 2.0
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

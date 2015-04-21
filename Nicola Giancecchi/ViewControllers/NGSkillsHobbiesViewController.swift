//
//  NGSkillsHobbiesViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 20/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGSkillsHobbiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets=false
        // Do any additional setup after loading the view.
        
        
        for v : UIImageView in self.view.subviews as! [UIImageView] {
            if v.tag != 1 {
                v.layer.cornerRadius = v.frame.size.width/2
                v.layer.masksToBounds = true
                v.layer.borderColor = UIColor().hexStringToUIColor("#ffad19").CGColor
                v.layer.borderWidth = 2.0
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

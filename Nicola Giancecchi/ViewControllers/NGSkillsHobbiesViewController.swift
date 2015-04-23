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
    @IBOutlet private weak var imgGitBB: UIImageView!
    @IBOutlet private weak var viewLanguages: UIView!
    @IBOutlet private weak var viewPlatforms: UIView!
    
    @IBOutlet private weak var viewSCM: UIView!
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
        
        imgGitBB.image = imgGitBB.image?.imageWithColor(color)
        
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
        
        self.navigationItem.title = "SKILLS & HOBBIES"
        self.navigationController?.navigationBar.barTintColor = UIColor().hexStringToUIColor("#ff7d12")
        
        animate()
    }

    
    private func animate(){
        
        
        var startingDelayBars : Double = 0.5
        
        for(var i : Int = 1; i < 7; i++){
            let view : UIView = self.viewPlatforms.viewWithTag(i)!
            let currentRect : CGRect = view.frame
            view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y,0,view.frame.size.height)
            UIView.animateWithDuration(1.0, delay: startingDelayBars, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                view.frame = currentRect
                }, completion:nil)
            startingDelayBars += 0.25
            
        }
        
        
        var startingDelay : Double = 1.0
        
        for(var i : Int = 1; i < 15; i++){
            let label : UILabel = self.viewLanguages.viewWithTag(i) as! UILabel
            label.alpha = 0.0
            label.transform = CGAffineTransformMakeScale(0.5, 0.5)
            UIView.animateWithDuration(1.0, delay: startingDelay, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                label.alpha = 1.0
                label.transform = CGAffineTransformMakeScale(1.0, 1.0)
                }, completion:nil)
            startingDelay += 0.15
        }
        
        viewSCM.alpha = 0.0
        UIView.animateWithDuration(1.0, delay: 2.5, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.viewSCM.alpha = 1.0
            }, completion:nil)
        

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

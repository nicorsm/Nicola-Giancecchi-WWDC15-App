//
//  NGSkillsHobbiesViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 20/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGSkillsHobbiesViewController: UIViewController, UIScrollViewDelegate {
    
    private var interestsRead : Bool = false
    private var humanRead : Bool = false
    
    @IBOutlet weak var viewInterests: UIView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var humanView: UIView!
    @IBOutlet private weak var imgGitBB: UIImageView!
    @IBOutlet private weak var viewLanguages: UIView!
    @IBOutlet private weak var viewPlatforms: UIView!
    
    @IBOutlet private weak var pageControl: UIPageControl!
    
    @IBOutlet private weak var viewSCM: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
        self.pageControl.numberOfPages = 3
        self.pageControl.currentPage = 0
        
        
        self.automaticallyAdjustsScrollViewInsets=false
        
        let color : UIColor = UIColor().hexStringToUIColor("#ffad19")
        
        //reset alpha for "human" view
        for(var i : Int = 1111; i < 1115; i++){
            let v : UIView = self.contentView.viewWithTag(i)!
            v.alpha = 0.0
        }
        
        //reset alpha&buttons for "interests" view
        for v : UIView in self.viewInterests.subviews as! [UIView] {
            v.alpha = 0.0
            if v.isKindOfClass(UIImageView){
                let img : UIImageView = v as! UIImageView
                img.image = img.image?.imageWithColor(color)
                img.layer.cornerRadius = img.frame.size.width/2
                img.layer.masksToBounds = true
                img.layer.borderColor = color.CGColor
                img.layer.borderWidth = 2.0
            }
        }
        
    
        for v : UIView in self.contentView.subviews as! [UIView] {
            if v.isKindOfClass(UIImageView) && v.tag >= 1 {
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
        UIView.animateWithDuration(2.5, delay: 3.0, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.viewSCM.alpha = 1.0
            }, completion:nil)
        
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        self.pageControl.currentPage = Int(scrollView.contentOffset.y/self.view.frame.size.height)
        
        
        if(scrollView.contentOffset.y == self.view.frame.size.height*1 && !interestsRead) {
            var startingDelay : Double = 0.0
            interestsRead = true
            
            for(var i : Int = 1; i < 17; i++){
                if(i % 2 == 0){ //is label
                    
                    let lbl : UILabel = self.viewInterests.viewWithTag(i) as! UILabel
                    lbl.alpha = 0.0
                    UIView.animateWithDuration(1.0, delay: startingDelay, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                        lbl.alpha = 1.0
                        
                        }, completion:nil)
                    startingDelay += 0.30
                    
                } else { //is imageview
                    let img : UIImageView = self.viewInterests.viewWithTag(i) as! UIImageView
                    img.alpha = 0.0
                    UIView.animateWithDuration(1.0, delay: startingDelay, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                        img.alpha = 1.0
                        }, completion:nil)
                    startingDelay += 0.30
                }
            }
        }
        
        if(scrollView.contentOffset.y == self.view.frame.size.height*2 && !humanRead){
            humanRead = true
            var startingDelay : Double = 0.0
            
            for(var i : Int = 1111; i < 1115; i++){
                
                let v : UIView = self.contentView.viewWithTag(i)!
                v.alpha = 0.0
                v.transform = CGAffineTransformMakeScale(0.5, 0.5)
                UIView.animateWithDuration(1.0, delay: startingDelay, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                    v.alpha = 1.0
                    v.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    }, completion:nil)
                startingDelay += 0.50
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

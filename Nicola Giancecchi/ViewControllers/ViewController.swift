//
//  ViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 14/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private weak var lblNicoGiancecchi: UILabel!
    
    @IBOutlet private weak var lblScholarship: UILabel!
    
    @IBOutlet private weak var imgNico: UIImageView!
    
    @IBOutlet private weak var btnAboutMe: UIButton!
    @IBOutlet private weak var btnWWDC: UIButton!
    @IBOutlet private weak var btnStudy: UIButton!
    @IBOutlet private weak var btnProjects: UIButton!
    @IBOutlet private weak var btnAwards: UIButton!
    @IBOutlet private weak var btnWorks: UIButton!
    @IBOutlet private weak var btnSkills: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        
        btnSkills.titleLabel?.numberOfLines=2
        
        for v : UIView in self.view.subviews as! [UIView] {
            if v.tag != 1 {
                v.layer.cornerRadius = v.frame.size.width/2
                v.layer.masksToBounds = true
            }
        }
        
        self.view.bringSubviewToFront(imgNico)
        
        animate()
        
    }
    
    private func animate(){
        
        var buttons : Array<UIButton> = [btnAboutMe, btnWWDC, btnStudy, btnProjects, btnAwards, btnWorks, btnSkills]
        let centers : Array<CGPoint> = [btnAboutMe.center, btnWWDC.center, btnStudy.center, btnProjects.center, btnAwards.center, btnWorks.center, btnSkills.center]
        
        lblNicoGiancecchi.alpha = 0.0
        lblScholarship.alpha = 0.0
        imgNico.alpha = 0.0
        
        for(var i : Int = 0; i < buttons.count; i++){
            buttons[i].hidden = true
        }
        
        UIView.animateWithDuration(1.0, delay: 0.50, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .CurveEaseOut, animations: { () -> Void in
            self.lblNicoGiancecchi.alpha = 1.0
            }, completion:nil)
        
        UIView.animateWithDuration(1.0, delay: 1.25, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .CurveEaseOut, animations: { () -> Void in
            self.lblScholarship.alpha = 1.0
            }, completion:nil)
        
        imgNico.transform = CGAffineTransformMakeScale(1.5, 1.5)
        UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .CurveEaseIn, animations: { () -> Void in
            self.imgNico.alpha = 1.0
            self.imgNico.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion:{ (completed : Bool) -> Void in
                
                for(var i : Int = 0; i < buttons.count; i++){
                    buttons[i].hidden = false
                }
        })
        
        
        var startingDelay : Double = 3.0
        
        for var i : Int = 0; i < buttons.count; i++ {
            buttons[i].center = imgNico.center
            
            
            let currentCenter : CGPoint = centers[i]
            
            
        
            UIView.animateWithDuration(1.0, delay: startingDelay, usingSpringWithDamping: 2.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                buttons[i].center = centers[i]
                }, completion:{ (completed: Bool) -> Void in
                    
            })
            startingDelay += 0.10
            
        }
        
        
    }
    
    @IBAction func openWWDCViewController(sender: AnyObject) {
        let wwdc2k14 : NGWWDCViewController = NGWWDCViewController()
        self.navigationController?.pushViewController(wwdc2k14, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}


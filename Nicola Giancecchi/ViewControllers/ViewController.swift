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
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Gotham-Bold", size: 20)!]
        
        btnSkills.titleLabel?.numberOfLines=2
        
        for v : UIView in self.view.subviews as! [UIView] {
            if v.tag != 1 {
                v.layer.cornerRadius = v.frame.size.width/2
                v.layer.masksToBounds = true
            }
        }
        
        var buttons : Array<UIButton> = [btnAboutMe, btnWWDC, btnStudy, btnProjects, btnAwards, btnWorks, btnSkills]
        let centers : Array<CGPoint> = [btnAboutMe.center, btnWWDC.center, btnStudy.center, btnProjects.center, btnAwards.center, btnWorks.center, btnSkills.center]
        let startingCenters : Array<CGPoint> = [
            CGPointMake(-200,1000),
            CGPointMake(100,900),
            CGPointMake(300,1000),
            CGPointMake(500,1000),
            CGPointMake(800,900),
            CGPointMake(1000,1000),
            CGPointMake(1200,900)
        ]
        
        lblNicoGiancecchi.alpha = 0.0
        lblScholarship.alpha = 0.0
        imgNico.alpha = 0.0
        
        UIView.animateWithDuration(1.0, delay: 0.50, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .CurveEaseOut, animations: { () -> Void in
            self.lblNicoGiancecchi.alpha = 1.0
        }, completion:nil)
        
        UIView.animateWithDuration(1.0, delay: 1.25, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .CurveEaseOut, animations: { () -> Void in
            self.lblScholarship.alpha = 1.0
            }, completion:nil)
        
        UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .CurveEaseOut, animations: { () -> Void in
            self.imgNico.alpha = 1.0
            }, completion:nil)
        
        var startingDelay : Double = 3.0
        
        for(var i : Int = 0; i < buttons.count; i++){
            buttons[i].center = startingCenters[i]
            UIView.animateWithDuration(1.0, delay: startingDelay, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                    buttons[i].center = centers[i]
                }, completion:nil)
            startingDelay += 0.25
        }
        
        for(var i : Int = 0; i < buttons.count; i++){
            
            let currentCenter : CGPoint = centers[i]
            
            UIGraphicsBeginImageContext(CGSizeMake(1024,768))
            let ctx : CGContextRef = UIGraphicsGetCurrentContext()
            
            CGContextBeginPath(ctx);
            CGContextMoveToPoint(ctx, imgNico.center.x, imgNico.center.y);
            CGContextAddLineToPoint(ctx, currentCenter.x, currentCenter.y);
            CGContextSetLineWidth(ctx, 1);
            CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)
            
            CGContextClosePath(ctx); 
            CGContextStrokePath(ctx);
            UIGraphicsEndImageContext()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.0, green: 190.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


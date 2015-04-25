//
//  NGProjectDetailViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 15/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGProjectDetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak private var contentView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak private var imgIcon: UIImageView!
    @IBOutlet weak private var lblAppName: UILabel!
    @IBOutlet weak private var lblAppSubtitle: UILabel!
    @IBOutlet weak private var imgFirst: UIImageView!
    @IBOutlet weak private var lblFirstColumnText: UILabel!
    @IBOutlet weak private var lblSecondColumnText: UILabel!
    @IBOutlet weak private var viewFeatures: UIView!
    
    @IBOutlet weak var viewBox1: UIView!
    @IBOutlet weak var viewBox2: UIView!
    @IBOutlet weak var viewBox3: UIView!
    @IBOutlet weak var viewBox4: UIView!
    @IBOutlet weak var viewBox5: UIView!
    @IBOutlet weak var viewBox6: UIView!
    
    @IBOutlet weak var btnLink: UIButton!
    
    @IBOutlet weak var imgSecond: UIImageView!
    
    private var firstImgScrolled = false
    private var secondImgScrolled = false
    private var featuresScrolled = false
    
    var pageIndex : Int = 0
    
    var proj : Project = Project()
    
    init(){
        super.init(nibName: "NGProjectDetailViewController", bundle: nil)
    }
    
    init(project : Project){
        super.init(nibName: "NGProjectDetailViewController", bundle: nil)
        proj = project
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appColor : UIColor = UIColor().hexStringToUIColor(proj.appColor)
        let textColor : UIColor = UIColor().hexStringToUIColor(proj.textColor)
        
        imgIcon.image = UIImage(named: proj.appIcon)
        imgFirst.image = UIImage(named: proj.firstImage)
        imgSecond.image = UIImage(named: proj.secondImage)
        
        imgIcon.layer.cornerRadius = 25.0
        imgIcon.layer.masksToBounds = true
        
        lblAppName.text = proj.title.uppercaseString
        lblAppSubtitle.text = proj.subtitle
        lblAppName.textColor = textColor
        lblAppSubtitle.textColor = textColor
        
        btnLink.setTitleColor(appColor, forState: .Normal)
        btnLink.layer.cornerRadius = 5.0
        btnLink.layer.masksToBounds = true
        btnLink.layer.borderColor = appColor.CGColor
        btnLink.layer.borderWidth = 2.0
        
        if !proj.appLink.hasPrefix("itms://") {
            btnLink.setTitle("Find out more", forState: .Normal)
        }
        
        lblFirstColumnText.text = proj.firstColumnText;
        lblSecondColumnText.text = proj.secondColumnText;
        
        for var i : Int = 0; i < proj.features.count; i++ {
            
            var view : UIView = UIView()
            var dict : Dictionary<String,String> = proj.features[i]
            
            switch(i){
                case 0: view = self.viewBox1; break;
                case 1: view = self.viewBox2; break;
                case 2: view = self.viewBox3; break;
                case 3: view = self.viewBox4; break; //4 <-> 5
                case 4: view = self.viewBox5; break;
                case 5: view = self.viewBox6; break;
                default: break;
            }
            
            let imgView : UIImageView = view.viewWithTag(1) as! UIImageView
            imgView.image = UIImage(named: dict["icon"]!)?.imageWithColor(UIColor().hexStringToUIColor(proj.appColor))
            imgView.layer.cornerRadius = imgView.frame.size.width/2
            imgView.layer.masksToBounds = true
            imgView.layer.borderWidth = 2
            imgView.layer.borderColor = appColor.CGColor
            imgView.alpha = 0.0
            (view.viewWithTag(2) as! UILabel).text = dict["title"]!
            (view.viewWithTag(2) as! UILabel).alpha = 0.0
            (view.viewWithTag(3) as! UILabel).text = dict["subtitle"]!
            (view.viewWithTag(3) as! UILabel).alpha = 0.0
            
            imgFirst.alpha = 0.0
            imgSecond.alpha = 0.0
        }
        

        
        
        self.view.backgroundColor = UIColor().hexStringToUIColor(proj.appColor)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        if(!firstImgScrolled){
            firstImgScrolled = true
            animateView(imgFirst)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func didTapOpenAppLink(sender: AnyObject) {
        if proj.appLink.hasPrefix("itms://"){
            UIApplication.sharedApplication().openURL(NSURL(string: proj.appLink)!)
        } else {
            let bro : NGBrowserViewController = NGBrowserViewController(url: proj.appLink)
            self.navigationController?.pushViewController(bro, animated: true)
        }
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y > (self.imgSecond.frame.origin.y-350) && !secondImgScrolled {
            secondImgScrolled = true
            animateView(imgSecond)
        }
        
        if scrollView.contentOffset.y > (self.viewFeatures.frame.origin.y-550) && !featuresScrolled{
            featuresScrolled = true
            animateFeatures()
        }
        
    }
    
    func animateView(imageView : UIImageView){
        
        imageView.alpha = 0.0
        imageView.transform = CGAffineTransformMakeTranslation(0, -40)
        UIView.animateWithDuration(2.0, delay: 0.25, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            imageView.alpha = 1.0
            imageView.transform = CGAffineTransformMakeTranslation(0, 0)
        }, completion: nil)
    }
    
    func animateFeatures(){
        
        let views : Array<UIView> = [self.viewBox1, self.viewBox2, self.viewBox3, self.viewBox5, self.viewBox4, self.viewBox6]
        
        var startingDelay : Double = 0.0
        
        for v : UIView in views {
            
            
            let img : UIImageView = v.viewWithTag(1) as! UIImageView
            let title : UILabel = v.viewWithTag(2) as! UILabel
            let desc : UILabel = v.viewWithTag(3) as! UILabel
            
            
            img.alpha = 0.0
            img.transform = CGAffineTransformMakeScale(0.5, 0.5)
            UIView.animateWithDuration(0.75, delay: startingDelay, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                img.alpha = 1.0
                img.transform = CGAffineTransformMakeScale(1.0, 1.0)
                }, completion:nil)
            startingDelay += 0.25
            
            title.alpha = 0.0
            title.transform = CGAffineTransformMakeTranslation(-20, 0)
            UIView.animateWithDuration(0.75, delay: startingDelay, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                title.alpha = 1.0
                title.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion:nil)
            startingDelay += 0.25
            
            
            desc.alpha = 0.0
            UIView.animateWithDuration(0.75, delay: startingDelay, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                desc.alpha = 1.0
                }, completion:nil)
            startingDelay += 0.25
            
            if(v == self.viewBox2){
                
                btnLink.alpha = 0.0
                UIView.animateWithDuration(0.75, delay: startingDelay, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                    self.btnLink.alpha = 1.0
                    }, completion:nil)
                startingDelay += 0.25
            }
            
        }

        
    }
}

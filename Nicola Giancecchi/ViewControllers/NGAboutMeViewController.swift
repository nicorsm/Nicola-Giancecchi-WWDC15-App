//
//  NGAboutMeViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 14/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGAboutMeViewController: UIViewController {
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btnFindOutRSM: UIButton!
    @IBOutlet weak var viewBorn: UIView!
    @IBOutlet weak var viewAge: UIView!
    @IBOutlet weak var viewCountry: UIView!
    
    @IBOutlet weak var viewiOSExperience: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.width/2
        self.imgProfile.layer.masksToBounds = true
        
        for v : UIView in self.contentView.subviews as! [UIView] {
            if !v.isKindOfClass(UILabel) && v.tag==5 {
                v.layer.cornerRadius = v.frame.size.width/2
                v.layer.masksToBounds = true
            }
        }
        
        self.btnFindOutRSM.titleLabel?.numberOfLines = 2
        self.btnFindOutRSM.titleLabel?.textAlignment = .Center
        
        self.animate()
        
        self.navigationItem.title = "ABOUT ME"
        self.navigationController?.navigationBar.barTintColor = UIColor().hexStringToUIColor("#255979")
        
    }
    
    func animate() {
        
        self.viewBorn.transform = CGAffineTransformMakeScale(0.0, 0.0)
        self.viewAge.transform = CGAffineTransformMakeScale(0.0, 0.0)
        self.viewCountry.transform = CGAffineTransformMakeScale(0.0, 0.0)
        self.btnFindOutRSM.transform = CGAffineTransformMakeScale(0.0, 0.0)
        self.viewiOSExperience.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
        
        UIView.animateWithDuration(1.00, delay: 0.00, usingSpringWithDamping: 0.60, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.viewBorn.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion: nil)
        UIView.animateWithDuration(1.00, delay: 0.75, usingSpringWithDamping: 0.60, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.viewAge.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion: nil)
        UIView.animateWithDuration(1.00, delay: 1.75, usingSpringWithDamping: 0.60, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.viewCountry.transform = CGAffineTransformMakeScale(1.0, 1.0)
            self.btnFindOutRSM.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion: nil)
        UIView.animateWithDuration(1.00, delay: 2.75, usingSpringWithDamping: 0.60, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.viewiOSExperience.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didTapFindout(sender: AnyObject) {
        
    }
    
    @IBAction func didOpenMail(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "mailto:nicorsm@me.com")!)
    }
    
    @IBAction func didOpenFacebook(sender: UIButton) {
        MRSocial.openFacebookProfile("1458830076")
    }
    
    @IBAction func didOpenTwitter(sender: UIButton) {
        MRSocial.openTwitterProfile("nicorsm")
    }
    
    @IBAction func didOpenInstagram(sender: UIButton) {
        MRSocial.openInstagramProfile("nicorsm")
    }
    
    @IBAction func didOpenLinkedin(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.linkedin.com/in/nicolagiancecchi")!)
    }
    
    @IBAction func didOpenGithub(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.github.com/nicorsm")!)
    }
    
    @IBAction func didOpenBitbucketWork(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.bitbucket.org/nicorsm")!)
    }
    
    @IBAction func didOpenBitbucketUniversity(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.bitbucket.org/ngiancecchi")!)
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

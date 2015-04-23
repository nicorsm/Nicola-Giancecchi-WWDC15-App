//
//  NGProjectDetailViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 15/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGProjectDetailViewController: UIViewController {

    @IBOutlet weak private var contentView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak private var imgIcon: UIImageView!
    @IBOutlet weak private var lblAppName: UILabel!
    @IBOutlet weak private var lblAppSubtitle: UILabel!
    @IBOutlet weak private var imgFirst: UIImageView!
    @IBOutlet weak private var lblFirstColumnText: UILabel!
    @IBOutlet weak private var lblSecondColumnText: UILabel!
    
    @IBOutlet weak var viewBox1: UIView!
    @IBOutlet weak var viewBox2: UIView!
    @IBOutlet weak var viewBox3: UIView!
    @IBOutlet weak var viewBox4: UIView!
    @IBOutlet weak var viewBox5: UIView!
    @IBOutlet weak var viewBox6: UIView!
    
    @IBOutlet weak var btnLink: UIButton!
    
    @IBOutlet weak var imgSecond: UIImageView!
    
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
        
        if proj.appLink == "" {
            btnLink.hidden = true
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
                case 3: view = self.viewBox4; break;
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
            (view.viewWithTag(2) as! UILabel).text = dict["title"]!
            (view.viewWithTag(3) as! UILabel).text = dict["subtitle"]!
            
        }
        
        
        self.view.backgroundColor = UIColor().hexStringToUIColor(proj.appColor)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapOpenAppLink(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: proj.appLink)!)
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

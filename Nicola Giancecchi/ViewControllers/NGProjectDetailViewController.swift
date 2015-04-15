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

        imgIcon.image = UIImage(named: proj.appIcon)
        imgFirst.image = UIImage(named: proj.firstImage)
        imgSecond.image = UIImage(named: proj.secondImage)
        
        imgIcon.layer.cornerRadius = 25.0
        imgIcon.layer.masksToBounds = true
        
        lblAppName.text = proj.title.uppercaseString
        lblAppSubtitle.text = proj.subtitle
        lblAppName.textColor = UIColor().hexStringToUIColor(proj.textColor)
        lblAppSubtitle.textColor = UIColor().hexStringToUIColor(proj.textColor)
        
        lblFirstColumnText.text = proj.firstColumnText;
        lblSecondColumnText.text = proj.secondColumnText;
        
        self.view.backgroundColor = UIColor().hexStringToUIColor(proj.appColor)
        // Do any additional setup after loading the view.
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

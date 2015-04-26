//
//  NGWWDCViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 16/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGWWDCViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet private weak var imgChevronDown: UIImageView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var gradientView: UIView!
    @IBOutlet private weak var linksView: UIView!
    
    @IBOutlet private weak var imgSelfie: UIImageView!
    @IBOutlet private weak var lblWWDC: UILabel!
    @IBOutlet private weak var lblWriteTheCode: UILabel!
    @IBOutlet private weak var lblSanFrancisco: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    init(){
        super.init(nibName:"NGWWDCViewController", bundle:nil)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(nibName:"NGWWDCViewController", bundle:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = gradientView.bounds
        
        let cor1 = UIColor.clearColor().CGColor
        let cor2 = self.view.backgroundColor?.CGColor

        gradient.colors = [cor1 as AnyObject, cor2 as AnyObject!]
        gradientView.layer.insertSublayer(gradient, atIndex: 0)

        self.view.bringSubviewToFront(imgChevronDown)
        
        self.navigationItem.title = "WWDC 2014"
        self.navigationController?.navigationBar.barTintColor = UIColor().hexStringToUIColor("#469cff")
        
        for(var i : Int = 1; i < 7; i++){
            let btn : UIButton = self.linksView.viewWithTag(i) as! UIButton
            btn.layer.cornerRadius = 5.0
            btn.layer.masksToBounds = true
            btn.layer.borderColor = UIColor.whiteColor().CGColor
            btn.layer.borderWidth = 1.0
        }
        
        animate()
    }
    
    func animate(){
        
        imgSelfie.alpha = 0.0
        imgSelfie.transform = CGAffineTransformMakeScale(1.25, 1.25)
        UIView.animateWithDuration(2.0, delay: 0.25, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.imgSelfie.alpha = 1.0
            self.imgSelfie.transform = CGAffineTransformMakeScale(1.0, 1.0)
        }, completion:nil)
        
        lblWWDC.alpha = 0.0
        lblWriteTheCode.alpha = 0.0
        gradientView.alpha = 0.0
        UIView.animateWithDuration(1.0, delay: 1.75, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.lblWWDC.alpha = 1.0
            self.lblWriteTheCode.alpha = 1.0
            self.gradientView.alpha = 1.0
            }, completion:nil)
        
        
        lblSanFrancisco.alpha = 0.0
        imgChevronDown.alpha = 0.0
        imgChevronDown.hidden = false
        UIView.animateWithDuration(1.0, delay: 2.75, usingSpringWithDamping: 1.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.lblSanFrancisco.alpha = 1.0
            self.imgChevronDown.alpha = 1.0
            }, completion:nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        
        if(scrollView.contentOffset.y>0){
            if(!imgChevronDown.hidden){
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.imgChevronDown.alpha = 0.0
                    self.imgChevronDown.hidden = true
                })
            }
        }
    }
    
    @IBAction func openURL(sender: UIButton) {
        
        var url : String = ""
        
        switch sender.tag {
        case 1: url = "http://www.corriere.it/tecnologia/14_giugno_11/studente-cesena-che-vince-concorso-mondiale-apple-e20fea80-f153-11e3-affc-25db802dc057.shtml"; break;
        case 2: url = "http://www.thisisitaly-panorama.com/people/nicola-giancecchi-wins-apples-international-challenge/"; break;
        case 3: url = "https://it.finance.yahoo.com/notizie/apple-uno-studente-di-cesena-vince-il-concorso-mondiale-174809089.html"; break;
        case 4: url = "http://www.libertas.sm/cont/comunicato/mr-apps-un-sammarinese-insieme-al-capo-della-apple/93624/1.html"; break;
        case 5: url = "http://www.sanmarinopress.com/tre-domande-a-nicola-giancecchi-giovane-programmatore-alla-corte-dell-apple/"; break;
        case 6: url = "http://www.romagnanoi.it/news/san-marino/1204957/Il-giovane-Nicola-Giancecchi-alla-corte.html"; break;
            default: break;
        }
        
        let bro : NGBrowserViewController = NGBrowserViewController(url: url)
        self.navigationController?.pushViewController(bro, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.scrollView.delegate = nil
    }

}

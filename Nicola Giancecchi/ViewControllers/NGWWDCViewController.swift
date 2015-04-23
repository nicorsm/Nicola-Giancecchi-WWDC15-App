//
//  NGWWDCViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 16/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGWWDCViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imgChevronUp: UIImageView!
    @IBOutlet weak var imgChevronDown: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var gradientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = gradientView.bounds
        
        let cor1 = UIColor.clearColor().CGColor
        let cor2 = contentView.backgroundColor?.CGColor
        
        gradient.colors = [cor1 as AnyObject, cor2 as AnyObject!]
        gradientView.layer.insertSublayer(gradient, atIndex: 0)
        
        self.navigationItem.title = "WWDC 2014".uppercaseString
        self.view.bringSubviewToFront(imgChevronUp)
        self.view.bringSubviewToFront(imgChevronDown)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if(scrollView.contentOffset.y <= 0.0){
            if(!imgChevronUp.hidden){
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.imgChevronUp.alpha = 0.0
                    self.imgChevronUp.hidden = true
                })
            }
        } else {
            if(imgChevronUp.hidden){
                self.imgChevronUp.hidden = false
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.imgChevronUp.alpha = 0.8
                })
            }
        }
        
        if(scrollView.contentOffset.y + 704.0 >= scrollView.contentSize.height){
            if(!imgChevronDown.hidden){
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.imgChevronDown.alpha = 0.0
                    self.imgChevronDown.hidden = true
                })
            }
        } else {
            if(imgChevronDown.hidden){
                self.imgChevronDown.hidden = false
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.imgChevronDown.alpha = 0.8
                })
            }
        }
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

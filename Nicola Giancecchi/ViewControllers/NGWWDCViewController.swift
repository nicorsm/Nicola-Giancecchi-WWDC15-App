//
//  NGWWDCViewController.swift
//  Nicola Giancecchi
//
//  Created by Nicola Giancecchi on 16/04/15.
//  Copyright (c) 2015 Nicola Giancecchi. All rights reserved.
//

import UIKit

class NGWWDCViewController: UIViewController {
    
    //@IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var gradientView: UIView!
    //var data : Array<WWDCDescriptor> = []
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //data = DataManager.shared.getWWDCData()
        //self.collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = gradientView.bounds
        
        let cor1 = UIColor.clearColor().CGColor
        let cor2 = contentView.backgroundColor?.CGColor
        
        gradient.colors = [cor1 as AnyObject, cor2 as AnyObject!]
        gradientView.layer.insertSublayer(gradient, atIndex: 0)
        
        //self.collectionView?.registerNib(UINib(nibName: "NGConferenceCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        self.navigationItem.title = "WWDC 2014".uppercaseString
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
